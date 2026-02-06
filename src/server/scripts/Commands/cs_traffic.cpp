/*
 * This file is part of the DestinyCore Project. See AUTHORS file for Copyright information
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "ScriptMgr.h"
#include "Chat.h"
#include "World.h"

#include <algorithm>
#include <mutex>
#include <vector>
#include <sstream>
#include <iomanip>

namespace
{
    constexpr uint32 DEFAULT_TOP_N = 25;

    struct TrafficEntry
    {
        uint16 opcode = 0;
        uint64 value = 0;
        uint64 count = 0;
        uint64 size = 0;
    };

    struct GreaterByValue
    {
        bool operator()(TrafficEntry const& a, TrafficEntry const& b) const
        {
            return a.value > b.value;
        }
    };

    enum class Metric : uint8
    {
        Count,
        Size,
        Avg
    };

    uint32 ParseTopNOptional(char const* args)
    {
        if (!args || !*args)
            return DEFAULT_TOP_N;

        int n = atoi(args);
        if (n <= 0)
            return DEFAULT_TOP_N;

        uint32 topN = uint32(n);
        if (topN > uint32(OPCODE_COUNT))
            topN = uint32(OPCODE_COUNT);

        return topN;
    }

    char const* GetOpcodeName(uint16 opcode)
    {
        if (opcode >= OPCODE_COUNT)
            return "INVALID_OPCODE";

        if (ServerOpcodeHandler const* handler = opcodeTable[static_cast<OpcodeServer>(opcode)])
            return handler->Name;

        return "UNKNOWN_OPCODE";
    }

    std::string FormatOpcodeWithName(uint16 opcode)
    {
        std::ostringstream ss;
        ss << "0x" << std::hex << std::setw(4) << std::setfill('0') << std::uppercase
            << opcode << std::nouppercase << std::dec
            << " (" << opcode << ") "
            << GetOpcodeName(opcode);

        return ss.str();
    }

    std::vector<TrafficEntry> BuildSnapshot(Metric metric)
    {
        std::vector<TrafficEntry> out;
        out.reserve(OPCODE_COUNT);

        static std::mutex lock;
        std::lock_guard<std::mutex> guard(lock);

        for (uint16 i = 0; i < OPCODE_COUNT; ++i)
        {
            uint64 cnt = World::SendCount[i];
            uint64 bytes = World::SendSize[i];

            if (cnt == 0 && bytes == 0)
                continue;

            TrafficEntry e;
            e.opcode = i;
            e.count = cnt;
            e.size = bytes;

            switch (metric)
            {
            case Metric::Count:
                e.value = cnt;
                break;
            case Metric::Size:
                e.value = bytes;
                break;
            case Metric::Avg:
                e.value = (cnt > 0) ? (bytes / cnt) : 0;
                break;
            }

            out.push_back(e);
        }

        std::sort(out.begin(), out.end(), GreaterByValue());
        return out;
    }

    void PrintTop(ChatHandler* handler, Metric metric, uint32 topN)
    {
        auto data = BuildSnapshot(metric);

        if (data.empty())
        {
            handler->PSendSysMessage("No traffic recorded yet (all counters are 0).");
            return;
        }

        if (topN > data.size())
            topN = uint32(data.size());

        switch (metric)
        {
        case Metric::Count:
            handler->PSendSysMessage("Sent packets ordered by COUNT (Top %u):", topN);
            break;
        case Metric::Size:
            handler->PSendSysMessage("Sent packets ordered by TOTAL SIZE (Top %u):", topN);
            break;
        case Metric::Avg:
            handler->PSendSysMessage("Sent packets ordered by AVERAGE SIZE (Top %u):", topN);
            break;
        }

        for (uint32 rank = 0; rank < topN; ++rank)
        {
            auto const& e = data[rank];
            std::string opStr = FormatOpcodeWithName(e.opcode);

            if (metric == Metric::Count)
            {
                handler->PSendSysMessage("%u) %s - Count: " UI64FMTD, rank + 1, opStr.c_str(), e.value);
            }
            else if (metric == Metric::Size)
            {
                float mb = float(e.value) / 1024.0f / 1024.0f;
                handler->PSendSysMessage("%u) %s - Size: %.2f MB", rank + 1, opStr.c_str(), mb);
            }
            else
            {
                handler->PSendSysMessage("%u) %s - Avg: " UI64FMTD " bytes (count=" UI64FMTD ", size=" UI64FMTD ")",
                    rank + 1, opStr.c_str(), e.value, e.count, e.size);
            }
        }
    }
}

class traffic_commandscript : public CommandScript
{
public:
    traffic_commandscript() : CommandScript("traffic_commandscript") {}

    std::vector<ChatCommand> GetCommands() const override
    {
        static std::vector<ChatCommand> byCommandTable =
        {
            { "avg",   SEC_ADMINISTRATOR, false, &HandleAvg,   "" },
            { "size",  SEC_ADMINISTRATOR, false, &HandleSize,  "" },
            { "count", SEC_ADMINISTRATOR, false, &HandleCount, "" }
        };

        static std::vector<ChatCommand> trafficCommandTable =
        {
            { "by", SEC_ADMINISTRATOR, false, nullptr, "", byCommandTable }
        };

        static std::vector<ChatCommand> commandTable =
        {
            { "traffic", SEC_ADMINISTRATOR, false, nullptr, "", trafficCommandTable }
        };

        return commandTable;
    }

    static bool HandleCount(ChatHandler* handler, char const* args)
    {
        PrintTop(handler, Metric::Count, ParseTopNOptional(args));
        return true;
    }

    static bool HandleSize(ChatHandler* handler, char const* args)
    {
        PrintTop(handler, Metric::Size, ParseTopNOptional(args));
        return true;
    }

    static bool HandleAvg(ChatHandler* handler, char const* args)
    {
        PrintTop(handler, Metric::Avg, ParseTopNOptional(args));
        return true;
    }
};

void AddSC_traffic_commandscript()
{
    new traffic_commandscript();
}
