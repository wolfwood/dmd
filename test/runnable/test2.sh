#!/bin/bash

dir=${RESULTS_DIR}/runnable
output_file=${dir}/test2.sh.out

rm -f ${output_file}

a[0]=''
a[1]='-debug'
a[2]='-debug=1'
a[3]='-debug=2 -debug=bar'

for x in "${a[@]}"; do
    echo "executing with args: %x" >> ${output_file}

    $DMD $x -unittest -od${dir} -of${dir}/test2 runnable/extra-files/test2.d >> ${output_file}
    if [ $? -ne 0 ]; then
        cat ${output_file}
        rm -f ${output_file}
        exit 1
    fi

    ./${dir}/test2 >> ${output_file}
    if [ $? -ne 0 ]; then
        cat ${output_file}
        rm -f ${output_file}
        exit 1
    fi

    rm ${dir}/{test2.o,test2}

    echo >> ${output_file}
done