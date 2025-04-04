import subprocess
import sys


def main():
    args = [a for a in sys.argv if not a.endswith('.lib')]
    args += sorted({a for a in sys.argv if a.endswith('.lib')})
    args[0] = 'link.exe'
    subprocess.run(args, check=True)


if __name__ == '__main__':
    main()
