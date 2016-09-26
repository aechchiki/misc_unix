# syntax 
cat infile | awk '{<stuff>}' # test stdout
awk '{<stuff>}' infile > outfile # write to output

# average of $1 
awk '{ sum += $1; n++ } END { if (n > 0) print sum / n; }'

# min element of $1
awk 'BEGIN { a=1000 } { if ($1 < 0+a ) a=$1 } END { print a }'

# max element of $1
awk 'BEGIN { a=0 } { if ( $1 > 0+a ) a=$1 } END { print a }'

# sum of elements of $1
awk '{ sum += $1 } END { print sum }'

# sd of $1
awk '{ sum += $1; array[NR] = $1 } END { for ( x=1; x <= NR; x++ ){ sumsq += (( array[x] - (sum/NR))**2); } print sqrt( sumsq/NR)}'
