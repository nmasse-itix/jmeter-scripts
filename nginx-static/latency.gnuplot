set datafile separator ','
set xdata time
set timefmt "%s" # timestamp
set format x "%H:%M:%S"
set xlabel "Time";
set ylabel "Latency (ms)";
set terminal png size 1280,1024
set output outfile
plot dataset using ($1/1000):15 with points pt 1 ps 0.5
