#!/bin/bash
currentPath="$( cd "$( dirname "$0"  )" && pwd  )"
cd ../../
pwdPath="$(pwd)"

input_dir=$pwdPath/data/kaggle/subset/process
output_dir=$pwdPath/checkpoint


function execut {
/opt/conda/bin/python3 -u -m  src.example.afn.train \
    --input_dir $input_dir \
    --output_dir $output_dir \
    --epoch 1 \
    --batch_size 4 \
    --embedding_dim 4 \
    --devices '0,1' \
    --use_cuda \
    --eval_freq 5000 \
    --log_freq 100 | tee $pwdPath/log/$(date -d "today" +"%Y%m%d-%H%M%S")_afn.log
}

starttime=`date +'%Y-%m-%d %H:%M:%S'`
execut
endtime=`date +'%Y-%m-%d %H:%M:%S'`
start_seconds=$(date --date="$starttime" +%s);
end_seconds=$(date --date="$endtime" +%s);
echo '==================================================='
echo "the job execute time： "$((end_seconds-start_seconds))"s"
echo '==================================================='