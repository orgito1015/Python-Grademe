import sys
import os
import importlib.util

# Load student/solution file from same directory as this main.py
_script_dir = os.path.dirname(os.path.abspath(__file__))
_module_file = os.path.join(_script_dir, "string_sculptor.py")
_spec = importlib.util.spec_from_file_location("string_sculptor", _module_file)
_mod = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(_mod)
string_sculptor = _mod.string_sculptor

def main() -> None:
    """
    Main function that handles command line arguments and calls
    string_sculptor.
    """
    if len(sys.argv) != 2:
        return

    text = sys.argv[1]
    result = string_sculptor(text)
    print(result)


if __name__ == "__main__":
    main()
