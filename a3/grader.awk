function average(score){
	return score/3
}

function find_top_and_low(scores){
	low=2000 # arbitrary large number for finding the max
	for (i in scores){
		if (scores[i] > top){
			top=scores[i]
			top_name=students[i]
		}
		if (scores[i] < low){
			low=scores[i]
			low_name=students[i]
		}
	}

	print "Top Score:", top_name " with " top
	print "Lowest Score:", low_name " with " low
}

BEGIN{
	FS=","
}
NR>1 {
	# SID = Key
	students[$1] = $2
	scores[$1] = $3+$4+$5
}
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
