FILE='shadow_merge.py'
ASSIGN='shadow_merge'
EXDIR='.system/grading'

bash .system/auto_correc_python.sh $FILE $ASSIGN $EXDIR 3 1 3 5 3 2 4 6
if [ -e .system/grading/traceback ]; then mv .system/grading/traceback .; exit 1; fi

bash .system/auto_correc_python.sh $FILE $ASSIGN $EXDIR 3 1 2 3 3 4 5 6
if [ -e .system/grading/traceback ]; then mv .system/grading/traceback .; exit 1; fi

bash .system/auto_correc_python.sh $FILE $ASSIGN $EXDIR 1 1 3 2 3 4
if [ -e .system/grading/traceback ]; then mv .system/grading/traceback .; exit 1; fi

bash .system/auto_correc_python.sh $FILE $ASSIGN $EXDIR 0 3 1 2 3
if [ -e .system/grading/traceback ]; then mv .system/grading/traceback .; exit 1; fi

bash .system/auto_correc_python.sh $FILE $ASSIGN $EXDIR 3 1 1 2 3 1 3 3
if [ -e .system/grading/traceback ]; then mv .system/grading/traceback .; exit 1; fi

bash .system/auto_correc_python.sh $FILE $ASSIGN $EXDIR 0 0
if [ -e .system/grading/traceback ]; then mv .system/grading/traceback .; exit 1; fi

bash .system/auto_correc_python.sh $FILE $ASSIGN $EXDIR 3 1 5 9 3 2 6 8
if [ -e .system/grading/traceback ]; then mv .system/grading/traceback .; exit 1; fi

bash .system/auto_correc_python.sh $FILE $ASSIGN $EXDIR 4 -3 -1 2 7 2 -2 4
if [ -e .system/grading/traceback ]; then mv .system/grading/traceback .; exit 1; fi

touch .system/grading/passed
