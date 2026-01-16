from pathlib import Path

current_directory = Path.cwd()
current_file = Path(__file__).name

print(f'Files in {current_directory}')

for fpath in current_directory.iterdir():
    if fpath.name == current_file:
        continue
    
    print(f'    - {fpath.name}')

    if fpath.is_file():
        content = fpath.read_text(encoding='utf-8')
        print(f'    Content: {content}')
