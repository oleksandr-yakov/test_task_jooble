import re
import argparse
from pathlib import Path
IP_STR = ['192.168.0.100', '127.0.0.1']
DATE_REGEXP = '[0-9]{8}'
USERNAME_REGEXP = '[a-zA-Z0-9]{2,3}@[a-zA-Z0-9]{1,100}\.[a-zA-Z]{2,4}'


def get_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('--dir-path', type=str,)

    return parser.parse_args()


def change_loc_files(dir_path: str):
    for file_path in Path(dir_path).iterdir():
        with open(str(file_path), 'r', encoding='UTF-8') as fin:
            lines = fin.readlines()

        with open(str(file_path), 'w', encoding='UTF-8') as fout:
            for line in lines:
                line = re.sub(DATE_REGEXP, '*****', line)
                line = re.sub(USERNAME_REGEXP, '*****', line)
                if any([ip in line for ip in IP_STR]):
                    continue
                fout.write(line)


if __name__ == '__main__':
    args = get_args()
    change_loc_files(dir_path=args.dir_path)




