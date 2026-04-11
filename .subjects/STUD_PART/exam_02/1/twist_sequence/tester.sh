FILE='twist_sequence.py'
ASSIGN='twist_sequence'
EXDIR='.system/grading'

bash .system/auto_correc_python.sh $FILE $ASSIGN $EXDIR 5 1 2 3 4 5 2
if [ -e .system/grading/traceback ]; then mv .system/grading/traceback .; exit 1; fi

bash .system/auto_correc_python.sh $FILE $ASSIGN $EXDIR 3 1 2 3 1
if [ -e .system/grading/traceback ]; then mv .system/grading/traceback .; exit 1; fi

bash .system/auto_correc_python.sh $FILE $ASSIGN $EXDIR 4 1 2 3 4 0
if [ -e .system/grading/traceback ]; then mv .system/grading/traceback .; exit 1; fi

bash .system/auto_correc_python.sh $FILE $ASSIGN $EXDIR 3 1 2 3 5
if [ -e .system/grading/traceback ]; then mv .system/grading/traceback .; exit 1; fi

bash .system/auto_correc_python.sh $FILE $ASSIGN $EXDIR 0 3
if [ -e .system/grading/traceback ]; then mv .system/grading/traceback .; exit 1; fi

bash .system/auto_correc_python.sh $FILE $ASSIGN $EXDIR 5 10 20 30 40 50 1
if [ -e .system/grading/traceback ]; then mv .system/grading/traceback .; exit 1; fi

bash .system/auto_correc_python.sh $FILE $ASSIGN $EXDIR 4 -1 -2 -3 -4 2
if [ -e .system/grading/traceback ]; then mv .system/grading/traceback .; exit 1; fi

bash .system/auto_correc_python.sh $FILE $ASSIGN $EXDIR 1 42 7
if [ -e .system/grading/traceback ]; then mv .system/grading/traceback .; exit 1; fi

touch .system/grading/passed
