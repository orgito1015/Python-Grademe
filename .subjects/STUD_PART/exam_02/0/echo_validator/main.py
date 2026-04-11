import sys
import os
import importlib.util

# Load student/solution file from same directory as this main.py
_script_dir = os.path.dirname(os.path.abspath(__file__))
_module_file = os.path.join(_script_dir, "echo_validator.py")
_spec = importlib.util.spec_from_file_location("echo_validator", _module_file)
_mod = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(_mod)
echo_validator = _mod.echo_validator

def main() -> None:
    """
    Main function that handles command line arguments and calls echo_validator.
    """
    if len(sys.argv) != 2:
        print("false")
        return

    text = sys.argv[1]
    result = echo_validator(text)
    print("true" if result else "false")


if __name__ == "__main__":
    main()
