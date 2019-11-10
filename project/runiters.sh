echo 0 > $2
for i in $(seq 10 10 90); do 
    echo -n $i >> $2
    echo -n " " >> $2
    echo `./$1 -nl 1 --n=$i --minIters=$(cat $2 | tail -n1)` >> $2;
done
for i in $(seq 100 100 1000); do 
    echo -n $i >> $2
    echo -n " " >> $2
    echo `./$1 -nl 1 --n=$i --minIters=$(cat $2 | tail -n1)` >> $2;
done