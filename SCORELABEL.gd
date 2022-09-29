extends Label


func _physics_process(delta):
	var scoretotal = 0
	for aint in Testglobal.BENCHPASSES:
		scoretotal += int(aint)
	text = "CURRENT SCORE: " + str(scoretotal)
