# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    auto_correc_program.sh                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aldantas <aldantas@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/20 02:26:11 by jcluzet           #+#    #+#              #
#    Updated: 2025/02/09 19:41:31 by aldantas         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FILE="../../rendu/$2/$1"

# echo ""

tmp=""
timeout=1

cd .system/grading || exit
gcc -o source "$1"
./source "${@:3}" | cat -e > sourcexam       #TESTING
rm -f source
{
gcc -o final "$FILE"
}  2>.dev
{
./final "${@:3}" | cat -e > finalexam &       #TESTING
PID=$!
}  &>/dev/null


# loop 1 second for 20 sec
for i in {1..20}
do
    sleep 1
    # if PID is not running, then exit
    # if i is 5, 10, 15, 19 then echo "waiting..."
    if [ $i -eq 5 ] || [ $i -eq 10 ] || [ $i -eq 15 ] || [ $i -eq 19 ]; then
        echo "waiting..."
    fi
    if ! ps -p $PID > /dev/null 2>&1
    then
        timeout=0
        break
    fi
done

# Kill the process if it's still running (timeout occurred)
if [ $timeout -eq 1 ] && ps -p $PID > /dev/null 2>&1
then
    # Try graceful termination first
    kill -TERM $PID 2>/dev/null
    sleep 1
    # Force kill if still running
    if ps -p $PID > /dev/null 2>&1
    then
        kill -KILL $PID 2>/dev/null
    fi
    wait $PID 2>/dev/null || true
fi

DIFF=$(diff sourcexam finalexam)
if [ "$DIFF" != "" ] || [ $timeout -eq 1 ]
then
        touch traceback
        echo ""
        echo "----------------8<-------------[ START TEST ]"
        printf "        💻 TEST\n./a.out "
        # print all the arguments, begin by the 3rd
        for i in "${@:3}"
        do
            printf "\"$i\" "
        done
        printf "\n"
        if [ $timeout -eq 1 ]
        then
            printf "   ❌ TIMEOUT\n"
		elif [ -e final ]
		then
            printf "        🔎 YOUR OUTPUT:\n"
            cat finalexam
            printf "        🗝 EXPECTED OUTPUT:\n"
            cat sourcexam
		else
            printf "\n"
            cat .dev
            rm .dev
            printf "\n        ❌ COMPILATION ERROR\n"
		fi
        echo "----------------8<------------- END TEST ]"
        echo ""
fi
{
rm final
rm finalexam
rm sourcexam
} &>/dev/null
cd ../..