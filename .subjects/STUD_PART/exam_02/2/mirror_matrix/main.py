import sys
import os
import importlib.util

# Load student/solution file from same directory as this main.py
_script_dir = os.path.dirname(os.path.abspath(__file__))
_module_file = os.path.join(_script_dir, "mirror_matrix.py")
_spec = importlib.util.spec_from_file_location("mirror_matrix", _module_file)
_mod = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(_mod)
mirror_matrix = _mod.mirror_matrix

def main() -> None:
    """
    Main function that handles command line arguments and calls mirror_matrix.
    """
    if len(sys.argv) < 3:
        return

    try:
        # First argument is rows, second is cols, rest are matrix elements
        rows = int(sys.argv[1])
        cols = int(sys.argv[2])

        if len(sys.argv) != 3 + rows * cols:
            return

        # Parse matrix elements
        elements = [int(arg) for arg in sys.argv[3:]]

        # Reconstruct 2D matrix
        matrix = []
        for i in range(rows):
            row = elements[i * cols:(i + 1) * cols]
            matrix.append(row)

        result = mirror_matrix(matrix)
        print(result)

    except (ValueError, IndexError):
        return


if __name__ == "__main__":
    main()
