echo 0 > $2
for i in $(seq $3 $4 $5); do 
    echo -n $i >> $2
    echo -n " " >> $2
    echo `./$1 -nl 1 --n=$i --minIters=$(cat $2 | tail -n1)` >> $2;
done
