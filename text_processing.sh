# average of $1 
awk '{ sum += $1; n++ } END { if (n > 0) print sum / n; }'

# median of $1 (on sort -n file)
awk ' { a[i++]=$1; } END { print a[int(i/2)]; }'

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

# sum of sequences in fastq
awk '/@/{getline; print}' | tr -d '\n' | wc -c

# print matched row +1 after it
awk '/<pattern>/{nr[NR]; nr[NR+1]}; NR in nr'

# delete string after character
awk 'BEGIN{FS=OFS="<separator>"} NF--'

# revert newline from 60nt formatted fasta file
awk '/^>/{print s? s"\n"$0:$0;s="";next}{s=s sprintf("%s",$0)}END{if(s)print s}'

# get fasta sequence length from multifasta file
awk '/^>/ {if (seqlen){print seqlen}; print ;seqlen=0;next; } { seqlen += length($0)}END{print seqlen}'

# search and replace in multiple files
find . -type f -name "taget_file" -exec sed -i '' -e 's:<from>:<to>:g' {} +

# "grep" pattern on $1
awk '{if ($1 == "<pattern>") print $0;}'

# duplicate count on $1
awk '{print $1}' | sort | uniq -dc

# print non-duplicate elements in $1
awk '!seen[$1]++'

# calculate how many characters per row in $1
awk '{ print length($1); }'

# text replacement in $1 if value bigger than <threshold_value> with <replacement_value>
awk '{ if ($1 > <threshold_value>){$1 = <replacement_value>}}'

# move last line of file to top (header)
sed '1h;1d;$!H;$!d;G'

# replace pattern1 with pattern2
sed 's/<pattern1>/<pattern2>/g'

# length of $1
awk '{print length($1)}'

# replace item greater than threshold value with replacement value
awk '{ if ($1><threshold>) {$1=<replacement>}}'

# cut the first field of a string
cut -d'<separator>' -f1

# cut last field of a string
rev | cut -d'<separator>' -f1 | rev

# replace values in $1 with arithmetic combinations of other columns (e.g, 1/$2)
awk '{$1= ($1=='<value_to_replace>' ? 1/$2 : $1)}1'

# split to files by column content (e.g, rows with the same value in $1 will be printed to separated files)
awk '{print > 'outfile_'$1}'
