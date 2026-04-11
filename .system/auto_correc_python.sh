#!/bin/bash
# **************************************************************************** #
#    auto_correc_python.sh                                                     #
#    Args: $1=student_file.py $2=assign_name $3=exercise_dir [args from $4+]  #
# **************************************************************************** #

STUDENT_FILE_NAME="$1"
ASSIGN="$2"
EX_DIR="$3"
STUDENT_FILE="rendu/$ASSIGN/$STUDENT_FILE_NAME"
SOLUTION_FILE="$EX_DIR/$STUDENT_FILE_NAME"
MAIN_PY="$EX_DIR/main.py"

timeout=1

# Run reference solution
python3 "$MAIN_PY" "${@:4}" > .system/grading/sourcexam 2>/dev/null

# Check if student file exists
if [ ! -f "$STUDENT_FILE" ]; then
    touch .system/grading/traceback
    echo ""
    echo "----------------8<-------------[ START TEST ]"
    printf "        ❌ MISSING FILE\n"
    printf "        Expected: rendu/$ASSIGN/$STUDENT_FILE_NAME\n"
    echo "----------------8<------------- END TEST ]"
    echo ""
    exit 1
fi

# Backup solution, place student file, run, restore
cp "$SOLUTION_FILE" "$SOLUTION_FILE.bak"
cp "$STUDENT_FILE" "$SOLUTION_FILE"

{
    python3 "$MAIN_PY" "${@:4}" > .system/grading/finalexam 2>.system/grading/.dev &
    PID=$!
} 

# Wait up to 10 seconds
for i in {1..10}; do
    sleep 1
    if [ $i -eq 5 ] || [ $i -eq 9 ]; then
        echo "waiting..."
    fi
    if ! ps -p $PID > /dev/null 2>&1; then
        timeout=0
        break
    fi
done

# Kill if timeout
if [ $timeout -eq 1 ] && ps -p $PID > /dev/null 2>&1; then
    kill -TERM $PID 2>/dev/null
    sleep 1
    kill -KILL $PID 2>/dev/null 2>&1
    wait $PID 2>/dev/null || true
fi

# Restore solution
mv "$SOLUTION_FILE.bak" "$SOLUTION_FILE"

DIFF=$(diff .system/grading/sourcexam .system/grading/finalexam 2>/dev/null)

if [ "$DIFF" != "" ] || [ $timeout -eq 1 ]; then
    touch .system/grading/traceback
    echo ""
    echo "----------------8<-------------[ START TEST ]"
    printf "        💻 TEST: python3 main.py "
    for arg in "${@:4}"; do
        printf "\"%s\" " "$arg"
    done
    printf "\n"
    if [ $timeout -eq 1 ]; then
        printf "   ❌ TIMEOUT\n"
    elif [ -s .system/grading/finalexam ]; then
        printf "        🔎 YOUR OUTPUT:\n"
        cat .system/grading/finalexam
        printf "        🗝 EXPECTED OUTPUT:\n"
        cat .system/grading/sourcexam
    else
        printf "\n"
        cat .system/grading/.dev 2>/dev/null
        printf "\n        ❌ RUNTIME ERROR\n"
    fi
    echo "----------------8<------------- END TEST ]"
    echo ""
fi

rm -f .system/grading/finalexam .system/grading/sourcexam .system/grading/.dev
