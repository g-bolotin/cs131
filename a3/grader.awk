# Function to compute average score
function average(score){
	return score/3
}

# Function to calculate the lowest and highest scores
function find_top_and_low(scores){
	low=2000 # arbitrary large number for finding the max
	for (i in scores){
		if (scores[i] > top){
			top=scores[i]		# highest score
			top_name=students[i]	# student name
		}
		if (scores[i] < low){
			low=scores[i]		# lowest score
			low_name=students[i]	# student name
		}
	}

	print "Top Score:", top_name " with " top
	print "Lowest Score:", low_name " with " low
}

# Set file separator to comma
BEGIN{
	FS=","
}
# Ignoring the header, create associative arrays for student names and scores
NR>1 {
	# SID = Key
	students[$1] = $2
	scores[$1] = $3+$4+$5
}
# Print results
END {
	for (sid in students){
		print "Name:", students[sid]
		print "Total Score:", scores[sid]
		avg=average(scores[sid])
		print "Average Score:", avg
		if (avg >= 70)
			print "Pass"
		else
			print "Fail"

		print ""
	}

	find_top_and_low(scores)
}
