> times.txt
echo "-----------Starting Execution------------" >> times.txt;

echo "--------------DS1 C+OpenMP---------------" >> times.txt;
for j in 1 2 4 8 16 32 48 64; 
    do for i in {0..2}; 
        do  echo "DS1 with $j threads" >> times.txt; 
        { time ./totientrange 1 15000 $j; } 2>> times.txt; 
        echo "" >> times.txt; 
    done; 
done;

echo "--------------DS2 C+OpenMP---------------" >> times.txt;
for j in 1 2 4 8 16 32 48 64; 
    do for i in {0..2}; 
        do echo "DS2 with $j threads"; 
        { time ./totientrange 1 30000 $j; } 2>> times.txt; 
    done; 
done;

echo "--------------DS3 C+OpenMP---------------" >> times.txt;
for j in 8 16 32 48 64; 
    do for i in {0..2}; 
        do echo "DS3 with $j threads"; 
        { time ./totientrange 1 60000 $j; } 2>> times.txt; 
    done; 
done;
echo "-----------Finished Execution------------" >> times.txt;
