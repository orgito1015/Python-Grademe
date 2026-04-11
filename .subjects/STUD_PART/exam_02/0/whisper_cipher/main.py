import sys
import os
import importlib.util

# Load student/solution file from same directory as this main.py
_script_dir = os.path.dirname(os.path.abspath(__file__))
_module_file = os.path.join(_script_dir, "whisper_cipher.py")
_spec = importlib.util.spec_from_file_location("whisper_cipher", _module_file)
_mod = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(_mod)
whisper_cipher = _mod.whisper_cipher

def main() -> None:
    """
    Main function that handles command line arguments and calls whisper_cipher.
    """
    if len(sys.argv) != 3:
        return

    try:
        text = sys.argv[1]
        shift = int(sys.argv[2])
        result = whisper_cipher(text, shift)
        print(result)
    except ValueError:
        return


if __name__ == "__main__":
    main()
