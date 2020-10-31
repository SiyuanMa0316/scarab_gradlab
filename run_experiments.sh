#!/bin/bash
#rm -r experiment_results
export PIN_ROOT=/home/siyuan/ee382n-1/gradlab/pinplay-drdebug-3.5-pin-3.5-97503-gac534ca30-gcc-linux
mkdir experiment_results
FILE_PATH="/home/siyuan/ee382n-1/gradlab/scarab/spec06_checkpoints_ref"

for path in ${FILE_PATH}/*_06
do
    mkdir experiment_results/$(basename ${path})
    name=$(basename ${path})
    for chkpt in ${path}/ref/${name}*
    do
        run_dir=experiment_results/${name}/$(basename ${chkpt})
        mkdir $run_dir
        python3 bin/scarab_launch.py --params src/PARAMS.kaby_lake --simdir ${run_dir} --checkpoint ${chkpt} --scarab_args='--inst_limit 30000000' >${run_dir}/output.out
    done
    
done