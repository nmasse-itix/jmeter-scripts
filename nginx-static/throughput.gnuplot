set datafile separator ','
set xlabel "Time";
set ylabel "Transactions per second";
set terminal png size 1280,1024
set output outfile

# Aggregate transactions over a second
binwidth=1000
bin(x,width)=width*floor(x/width)

plot dataset using (bin($1,binwidth)):(1.0) smooth freq with boxes
