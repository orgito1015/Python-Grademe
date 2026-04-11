# Python ExamShell

A practice exam system for Python — based on the Grademe-edu examshell, rebuilt entirely for Python exercises.

## How to run

```bash
make
```

Then from the interactive shell, choose **Student** → **Exam Rank 02**.

---

## Exam structure

| Level | Exercises | Difficulty |
|-------|-----------|------------|
| 0 | echo_validator, whisper_cipher, pattern_tracker | Easy |
| 1 | shadow_merge, string_sculptor, twist_sequence | Medium |
| 2 | bracket_validator, string_permutation_checker, mirror_matrix | Medium-Hard |
| 3 | cryptic_sorter, number_base_converter | Hard |

Each level is worth 25 points. Pass all 4 levels to reach 100/100.

---

## Shell commands

| Command | Action |
|---------|--------|
| `grademe` | Grade your current exercise |
| `status` | Show current exam status and score |
| `help` | List all available commands |
| `finish` | Exit the exam |

---

## How to submit an exercise

1. The shell tells you the exercise name, e.g. `echo_validator`
2. Create your file in the `rendu/` folder:
   ```
   rendu/echo_validator/echo_validator.py
   ```
3. Type `grademe` to test your solution

The subject description is always available in `subjects/subject.en.txt`.

---

## Adding your own exercises

Each exercise lives under:
```
.subjects/STUD_PART/exam_02/<level>/<exercise_name>/
    README.md               ← shown to student at start
    attachment/
        subject.en.txt      ← shown in subjects/ folder
    <exercise_name>.py      ← reference/correct solution
    main.py                 ← entry point (handles args, calls function)
    tester.sh               ← test cases
```

### tester.sh format

```bash
FILE='your_exercise.py'
ASSIGN='your_exercise'
EXDIR='.system/grading'   # always this path

bash .system/auto_correc_python.sh $FILE $ASSIGN $EXDIR "test_arg1"
if [ -e .system/grading/traceback ]; then mv .system/grading/traceback .; exit 1; fi

bash .system/auto_correc_python.sh $FILE $ASSIGN $EXDIR "test_arg2"
if [ -e .system/grading/traceback ]; then mv .system/grading/traceback .; exit 1; fi

touch .system/grading/passed
```

### main.py format

```python
import sys
import os
import importlib.util

# Load student/solution file from same directory as this main.py
_script_dir = os.path.dirname(os.path.abspath(__file__))
_module_file = os.path.join(_script_dir, "your_exercise.py")
_spec = importlib.util.spec_from_file_location("your_exercise", _module_file)
_mod = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(_mod)
your_function = _mod.your_function

def main() -> None:
    if len(sys.argv) != 2:
        return
    text = sys.argv[1]
    result = your_function(text)
    print(result)

if __name__ == "__main__":
    main()
```

---

## Requirements

- `g++` and `libreadline-dev` (for compiling the shell itself)
- `python3` (for running exercises)

On Ubuntu/Debian:
```bash
sudo apt-get install g++ libreadline-dev python3
```
