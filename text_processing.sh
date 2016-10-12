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

# convert fastq to fasta
awk '{if(NR%4==1) {printf(">%s\n",substr($0,2));} else if(NR%4==2) print;}'

# print matched row +1 after it
awk '/<pattern>/{nr[NR]; nr[NR+1]}; NR in nr'

# delete string after character
awk 'BEGIN{FS=OFS="<separator>"} NF--'

# revert newline from 60nt formatted fasta file
awk '/^>/{print s? s"\n"$0:$0;s="";next}{s=s sprintf("%s",$0)}END{if(s)print s}'

# search and replace in multiple files
find . -type f -name "taget_file" -exec sed -i '' -e 's:<from>:<to>:g' {} +


