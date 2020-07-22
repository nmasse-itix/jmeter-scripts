#!/bin/sh

set -e # Do not update graphs if jmeter fails

: ${JMETER:=jmeter}
: ${GNUPLOT:=gnuplot}
HEAP="-Xms1g -Xmx1g -XX:MaxMetaspaceSize=256m"
date="$(date +%F-%H-%M-%S)"
rm -f response-time.csv tps.csv
$JMETER -n -t nginx-static.jmx -l "results-$date.csv" -e -o "report-$date"
#$GNUPLOT -p response-time.gnuplot 
