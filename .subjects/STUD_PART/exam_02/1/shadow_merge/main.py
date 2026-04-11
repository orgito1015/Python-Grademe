import sys
import os
import importlib.util

# Load student/solution file from same directory as this main.py
_script_dir = os.path.dirname(os.path.abspath(__file__))
_module_file = os.path.join(_script_dir, "shadow_merge.py")
_spec = importlib.util.spec_from_file_location("shadow_merge", _module_file)
_mod = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(_mod)
shadow_merge = _mod.shadow_merge

def main() -> None:
    """
    Main function that handles command line arguments and calls shadow_merge.
    """
    if len(sys.argv) < 3:
        return

    try:
        # Parse arguments: len1 <list1_elements> len2 <list2_elements>
        args = sys.argv[1:]

        # Get length of first list
        len1 = int(args[0])
        if len1 < 0 or 1 + len1 >= len(args):
            return

        # Parse first list
        list1 = [int(args[i]) for i in range(1, 1 + len1)]

        # Get length of second list
        if 1 + len1 >= len(args):
            return
        len2 = int(args[1 + len1])

        # Check if we have enough arguments for second list
        if 1 + len1 + 1 + len2 != len(args):
            return

        # Parse second list
        list2 = [
            int(args[i])
            for i in range(1 + len1 + 1, 1 + len1 + 1 + len2)
        ]

        result = shadow_merge(list1, list2)
        print(result)

    except (ValueError, IndexError):
        return


if __name__ == "__main__":
    main()
