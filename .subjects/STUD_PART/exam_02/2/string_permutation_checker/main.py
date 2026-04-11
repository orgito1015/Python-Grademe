import sys
import os
import importlib.util

# Load student/solution file from same directory as this main.py
_script_dir = os.path.dirname(os.path.abspath(__file__))
_module_file = os.path.join(_script_dir, "string_permutation_checker.py")
_spec = importlib.util.spec_from_file_location("string_permutation_checker", _module_file)
_mod = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(_mod)
string_permutation_checker = _mod.string_permutation_checker

def main() -> None:
    """
    Main function that handles command line arguments and calls
    string_permutation_checker.
    """
    if len(sys.argv) != 3:
        return

    try:
        s1 = sys.argv[1]
        s2 = sys.argv[2]
        result = string_permutation_checker(s1, s2)
        print(result)
    except Exception:
        return


if __name__ == "__main__":
    main()
