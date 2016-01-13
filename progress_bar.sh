# Create ProgressBar function
# 1.1 Input is currentState($1) and totalState($2)
function ProgressBar {
# Process data
    let _progress=(${1}*100/${2}*100)/100
    let _done=(${_progress}*4)/10
    let _left=40-$_done
    let _total_number=${2}
    let _done_number=${1}
    let _time=${3}
    let _left_number=${2}-${1}
# Build progressbar string lengths
    _fill=$(printf "%${_done}s")
    _empty=$(printf "%${_left}s")

# 1.2 Build progressbar strings and print the ProgressBar line
# 1.2.1 Output example:
# 1.2.1.1 Progress : [########################################] 100%
printf "\rProgress : [${_fill// /#}${_empty// /-}] ${_time}s. ${_left_number} left (${_do     ne_number}/${_total_number})   ${_progress}%%"

}

# Variables
_start=1

# This accounts as the "totalState" variable for the ProgressBar function
_end=$1

_batch=$2

s_start_time=`date +%s`
# Proof of concept
for number in $(seq ${_start} ${_end})
do
    start_time=`date +%s`
    ./gen_hashes.py 64 1000 | ./hm_insert hometogo.ldb
    end_time=`date +%s`
    time="`expr $end_time - $start_time` ${number}/"
    ProgressBar ${number} ${_end} ${time}
done

s_end_time=`date +%s`
s_time="`expr $s_end_time - $s_start_time`"
printf "\nExecution time ${s_time}s."