FILE='cryptic_sorter.py'
ASSIGN='cryptic_sorter'
EXDIR='.system/grading'

bash .system/auto_correc_python.sh $FILE $ASSIGN $EXDIR "['apple', 'cat', 'banana', 'dog', 'elephant']"
if [ -e .system/grading/traceback ]; then mv .system/grading/traceback .; exit 1; fi

bash .system/auto_correc_python.sh $FILE $ASSIGN $EXDIR "['hello', 'world', 'hi', 'test']"
if [ -e .system/grading/traceback ]; then mv .system/grading/traceback .; exit 1; fi

bash .system/auto_correc_python.sh $FILE $ASSIGN $EXDIR "[]"
if [ -e .system/grading/traceback ]; then mv .system/grading/traceback .; exit 1; fi

bash .system/auto_correc_python.sh $FILE $ASSIGN $EXDIR "['']"
if [ -e .system/grading/traceback ]; then mv .system/grading/traceback .; exit 1; fi

bash .system/auto_correc_python.sh $FILE $ASSIGN $EXDIR "['aaa', 'bbb', 'AAA', 'BBB']"
if [ -e .system/grading/traceback ]; then mv .system/grading/traceback .; exit 1; fi

bash .system/auto_correc_python.sh $FILE $ASSIGN $EXDIR "['programming', 'code', 'python', 'algorithm']"
if [ -e .system/grading/traceback ]; then mv .system/grading/traceback .; exit 1; fi

bash .system/auto_correc_python.sh $FILE $ASSIGN $EXDIR "['Hello', 'WORLD', 'test', 'CODE']"
if [ -e .system/grading/traceback ]; then mv .system/grading/traceback .; exit 1; fi

bash .system/auto_correc_python.sh $FILE $ASSIGN $EXDIR "['a', 'bb', 'ccc', 'dddd']"
if [ -e .system/grading/traceback ]; then mv .system/grading/traceback .; exit 1; fi

bash .system/auto_correc_python.sh $FILE $ASSIGN $EXDIR "['bee', 'cat', 'dog', 'eye']"
if [ -e .system/grading/traceback ]; then mv .system/grading/traceback .; exit 1; fi

bash .system/auto_correc_python.sh $FILE $ASSIGN $EXDIR "['quick', 'brown', 'jumps', 'foxes']"
if [ -e .system/grading/traceback ]; then mv .system/grading/traceback .; exit 1; fi

touch .system/grading/passed
