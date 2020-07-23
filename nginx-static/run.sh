#!/bin/sh

set -e # Do not update graphs if jmeter fails

: ${JMETER:=jmeter}
: ${GNUPLOT:=gnuplot}
export HEAP="-Xms1g -Xmx1g -XX:MaxMetaspaceSize=256m"
date="$(date +%F-%H-%M-%S)"
$JMETER -n -t nginx-static.jmx -l "results-$date.csv" -e -o "report-$date"
$GNUPLOT -e "dataset='results-$date.csv'" -e "outfile='latency-$date.png'" -p latency.gnuplot
$GNUPLOT -e "dataset='results-$date.csv'" -e "outfile='throughput-$date.png'" -p throughput.gnuplot
