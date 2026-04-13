import sys
import os
import re

src_dir = sys.argv[1]
output_file = sys.argv[2]

chapters = sorted([
    f for f in os.listdir(src_dir)
    if f.startswith("chapitre-") and f.endswith(".md")
])

def title_from_file(path):
    with open(path, "r", encoding="utf-8") as f:
        for line in f:
            m = re.match(r'^#\\s+(.*)', line)
            if m:
                return m.group(1).strip()
    return os.path.basename(path)

with open(output_file, "w", encoding="utf-8") as out:
    for chap in chapters:
        full_path = os.path.join(src_dir, chap)
        title = title_from_file(full_path)

        html_name = chap.replace(".md", ".html")

        out.write(f"- [{title}]({html_name})\n")
