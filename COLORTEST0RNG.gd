extends ColorRect


func _process(delta):
	randomize()
	color = Color(rand_range(0,1),rand_range(0,1),rand_range(0,1),rand_range(0,1))
