import os
import re
import shutil

project_root = "."
encounter_states = [
    "NOT_STARTED",
    "IN_PROGRESS",
    "DONE",
    "FAIL",
    "SPECIAL",
    "TO_BE_DECIDED",
]

def find_switch_blocks(lines):
    pattern = re.compile(r"switch\s*\(\s*state\s*\)")
    blocks = []

    i = 0
    while i < len(lines):
        if pattern.search(lines[i]):
            brace_level = 0
            block_start = i
            while i < len(lines):
                brace_level += lines[i].count("{") - lines[i].count("}")
                if brace_level == 0 and i > block_start:
                    break
                i += 1
            blocks.append((block_start, i))
        else:
            i += 1
    return blocks

def extract_present_cases(lines, start, end):
    present = []
    case_pattern = re.compile(r"case\s+([A-Z_]+)\s*:")
    for i in range(start, end + 1):
        match = case_pattern.search(lines[i])
        if match:
            present.append(match.group(1))
    return present

def add_missing_cases(lines, start, end, missing_cases):
    indent = " " * 24  # Anpassbar je nach Codeformatierung
    insert_index = end
    for case in missing_cases:
        lines.insert(insert_index, f"{indent}case {case}:\n")
        lines.insert(insert_index + 1, f"{indent}    // TODO: handle {case} if needed\n")
        lines.insert(insert_index + 2, f"{indent}    break;\n")
        insert_index += 3
    return lines

def fix_file(file_path):
    with open(file_path, "r", encoding="latin1") as f:
        lines = f.readlines()

    modified = False
    blocks = find_switch_blocks(lines)

    for start, end in reversed(blocks):  # reversed to avoid shifting lines
        present = extract_present_cases(lines, start, end)
        missing = [state for state in encounter_states if state not in present]

        if missing:
            print(f"[PATCH] {file_path}, Zeile {start + 1}: fehlende case(s): {', '.join(missing)}")
            lines = add_missing_cases(lines, start, end, missing)
            modified = True

    if modified:
        shutil.copyfile(file_path, file_path + ".bak")
        with open(file_path, "w", encoding="utf-8") as f:
            f.writelines(lines)

def process_all_cpp_files():
    for root, dirs, files in os.walk(project_root):
        for file in files:
            if file.endswith(".cpp"):
                full_path = os.path.join(root, file)
                fix_file(full_path)

if __name__ == "__main__":
    process_all_cpp_files()
    print("\n✅ Alle switch(state)-Blöcke überprüft und ergänzt (falls nötig).")
