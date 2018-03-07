#!/bin/bash

usage="\n\n\tusage: $0 file.cor min_cor\n\n"

if [ $# -lt 2 ]; then
    echo -e $usage
    exit 1
fi

file=$1
min_cor=$2

cor=`cat $file`


# float number comparison
# from: https://stackoverflow.com/questions/11541568/how-to-do-float-comparison-in-bash
fcomp() {
    awk -v n1="$1" -v n2="$2" 'BEGIN {if (n1+0<n2+0) exit 0; exit 1}'
}


if fcomp $cor $min_cor; then
    echo -e "\n\n\tError, cor($cor) < $min_cor min correlation!  Must investigate\n\n"
    exit 2
else
    echo "correlation $min_cor is acceptable"
fi

exit 0

