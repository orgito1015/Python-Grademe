import sys
import os
import importlib.util

# Load student/solution file from same directory as this main.py
_script_dir = os.path.dirname(os.path.abspath(__file__))
_module_file = os.path.join(_script_dir, "cryptic_sorter.py")
_spec = importlib.util.spec_from_file_location("cryptic_sorter", _module_file)
_mod = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(_mod)
cryptic_sorter = _mod.cryptic_sorter

import ast


def main() -> None:
    """
    Main function that handles command line arguments and calls cryptic_sorter.
    """
    if len(sys.argv) != 2:
        return

    try:
        strings_arg = sys.argv[1]
        strings = ast.literal_eval(strings_arg)
        if not isinstance(strings, list):
            return
        result = cryptic_sorter(strings)
        print(result)
    except (ValueError, SyntaxError):
        return


if __name__ == "__main__":
    main()
