.PHONY : clean

trimmed.csv : raw.csv
	cut -d, -f1,3,5 raw.csv > trimmed.csv

clean.csv : trimmed.csv
	awk 'BEGIN{FS=","} {for (i=1; i<=NF; i++) if ($$i == "") nextline=1} !nextline {print} {nextline=0}' trimmed.csv > clean.csv


clean :
	rm -f trimmed.csv
