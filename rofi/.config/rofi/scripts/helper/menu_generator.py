#!/usr/bin/env python3

import stat
import sys
from os.path import expanduser, join
from pathlib import Path

rofi_scripts_dir = '~/.config/rofi/scripts'


def run():
    args = sys.argv[1:]

    if len(args) != 1:
        print("Expected 1 argument. Usage: ./menu_generator.py <options_file>")
        exit(-1)

    file_path = args[0]
    file_name = Path(file_path).stem
    script_file_name = f'{file_name[:file_name.rfind("_")]}-test.sh'
    title = script_file_name.replace('.sh', '').replace('_', ' ').capitalize()

    with open(file_path, mode='r') as options_file:
        options = {}
        lines = options_file.readlines()
        for line in lines:
            tokens = line.strip().split(",")
            options[tokens[0]] = tokens[1]
        script = generate_script(options, title)

    script_file_path = expanduser(join(rofi_scripts_dir, script_file_name))
    with open(script_file_path, mode='w') as script_file:
        script_file.write(script)
    
    # give exec permission to file
    script_path = Path(script_file_path)
    script_path.chmod(script_path.stat().st_mode | stat.S_IEXEC)


def generate_script(options, title):
    names_formatted = '\n'.join(
        map(
            lambda name: f'-> {name}',
            options.keys()
        )
    )
    return f"""#!/usr/bin/env bash

options=("{names_formatted}")

option=$(echo -e "$options" | \\
    rofi -dmenu -i -p "{title}" "" \\
    -theme-str 'listview {{lines: {len(options)}; scrollbar: false;}} window {{width: 15%;}}')

case $option in
    {generate_cases(options)}
    *)
        exit 0  # do nothing on wrong response
        ;;
esac

    """


def generate_cases(options):
    return ''.join(
        [generate_case(name, action) for (name, action) in options.items()]
    )


def generate_case(name, action):
    return f"""*{name})
        {action}
        ;;
    """


if __name__ == '__main__':
    run()
