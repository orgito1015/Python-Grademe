import sys
import os
import importlib.util

# Load student/solution file from same directory as this main.py
_script_dir = os.path.dirname(os.path.abspath(__file__))
_module_file = os.path.join(_script_dir, "bracket_validator.py")
_spec = importlib.util.spec_from_file_location("bracket_validator", _module_file)
_mod = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(_mod)
bracket_validator = _mod.bracket_validator

def main() -> None:
    """
    Main function that handles command line arguments and calls
    bracket_validator.
    """
    if len(sys.argv) != 2:
        return

    try:
        s = sys.argv[1]
        result = bracket_validator(s)
        print(result)
    except Exception:
        return


if __name__ == "__main__":
    main()
