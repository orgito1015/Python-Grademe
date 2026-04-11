import sys
import os
import importlib.util

# Load student/solution file from same directory as this main.py
_script_dir = os.path.dirname(os.path.abspath(__file__))
_module_file = os.path.join(_script_dir, "number_base_converter.py")
_spec = importlib.util.spec_from_file_location("number_base_converter", _module_file)
_mod = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(_mod)
number_base_converter = _mod.number_base_converter

def main() -> None:
    """
    Main function that handles command line arguments and calls
    number_base_converter.
    """
    if len(sys.argv) != 4:
        print("ERROR")
        return

    try:
        number = sys.argv[1]
        from_base = int(sys.argv[2])
        to_base = int(sys.argv[3])

        result = number_base_converter(number, from_base, to_base)
        print(result)
    except ValueError:
        print("ERROR")


if __name__ == "__main__":
    main()
