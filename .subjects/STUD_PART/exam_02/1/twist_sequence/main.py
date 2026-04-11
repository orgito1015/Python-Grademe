import sys
import os
import importlib.util

# Load student/solution file from same directory as this main.py
_script_dir = os.path.dirname(os.path.abspath(__file__))
_module_file = os.path.join(_script_dir, "twist_sequence.py")
_spec = importlib.util.spec_from_file_location("twist_sequence", _module_file)
_mod = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(_mod)
twist_sequence = _mod.twist_sequence

def main() -> None:
    """
    Main function that handles command line arguments and calls twist_sequence.
    """
    if len(sys.argv) < 3:
        return

    try:
        # Parse arguments: len <array_elements> k
        args = sys.argv[1:]

        # Get length of array
        arr_len = int(args[0])
        if arr_len < 0 or 1 + arr_len >= len(args):
            return

        # Parse array elements
        arr = [int(args[i]) for i in range(1, 1 + arr_len)]

        # Get k value
        if 1 + arr_len >= len(args):
            return
        k = int(args[1 + arr_len])

        # Check if we have exactly the right number of arguments
        if 1 + arr_len + 1 != len(args):
            return

        result = twist_sequence(arr, k)
        print(result)

    except (ValueError, IndexError):
        return


if __name__ == "__main__":
    main()
