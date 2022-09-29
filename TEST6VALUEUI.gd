extends SpinBox


func _process(delta):
	randomize()
	value = randi() % 100
