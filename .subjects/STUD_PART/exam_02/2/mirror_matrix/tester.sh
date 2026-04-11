FILE='mirror_matrix.py'
ASSIGN='mirror_matrix'
EXDIR='.system/grading'

bash .system/auto_correc_python.sh $FILE $ASSIGN $EXDIR 2 3 1 2 3 4 5 6
if [ -e .system/grading/traceback ]; then mv .system/grading/traceback .; exit 1; fi

bash .system/auto_correc_python.sh $FILE $ASSIGN $EXDIR 3 2 1 2 3 4 5 6
if [ -e .system/grading/traceback ]; then mv .system/grading/traceback .; exit 1; fi

bash .system/auto_correc_python.sh $FILE $ASSIGN $EXDIR 1 1 7
if [ -e .system/grading/traceback ]; then mv .system/grading/traceback .; exit 1; fi

bash .system/auto_correc_python.sh $FILE $ASSIGN $EXDIR 1 4 1 2 3 4
if [ -e .system/grading/traceback ]; then mv .system/grading/traceback .; exit 1; fi

bash .system/auto_correc_python.sh $FILE $ASSIGN $EXDIR 2 2 -1 -2 -3 -4
if [ -e .system/grading/traceback ]; then mv .system/grading/traceback .; exit 1; fi

bash .system/auto_correc_python.sh $FILE $ASSIGN $EXDIR 3 3 1 2 3 4 5 6 7 8 9
if [ -e .system/grading/traceback ]; then mv .system/grading/traceback .; exit 1; fi

bash .system/auto_correc_python.sh $FILE $ASSIGN $EXDIR 2 2 100 200 300 400
if [ -e .system/grading/traceback ]; then mv .system/grading/traceback .; exit 1; fi

bash .system/auto_correc_python.sh $FILE $ASSIGN $EXDIR 4 1 1 2 3 4
if [ -e .system/grading/traceback ]; then mv .system/grading/traceback .; exit 1; fi

bash .system/auto_correc_python.sh $FILE $ASSIGN $EXDIR 2 3 0 1 2 3 0 5
if [ -e .system/grading/traceback ]; then mv .system/grading/traceback .; exit 1; fi

touch .system/grading/passed
