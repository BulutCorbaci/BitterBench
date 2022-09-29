extends KinematicBody

var VEL=Vector3(2, 2, 0)
var scrpt
var reproduce = false

func _ready():
	randomize()
	scrpt = load("res://PINGBALL3D.gd")
	$RPCTIMER.start()
	set_meta("pinball", true)

func _process(delta):
	move_and_slide(VEL)

func _on_RPCTIMER_timeout():
	reproduce=true


func _on_AREACOLL_area_entered(area):
	if area.get_meta("bottomarea"):
		VEL=Vector3(VEL.x+rand_range(0,0.5),2+rand_range(0,0.5), 0)
		if reproduce:
			var dupe = duplicate()
			dupe.set_script(scrpt)
			get_parent().add_child(dupe)
			reproduce=false
			$RPCTIMER.start()
	elif area.get_meta("uparea"):
		VEL=Vector3(VEL.x+rand_range(0,0.5),-2+rand_range(0,0.5), 0)
		if reproduce:
			var dupe = duplicate()
			dupe.set_script(scrpt)
			get_parent().add_child(dupe)
			reproduce=false
			$RPCTIMER.start()
	if area.get_meta("rightarea"):
		VEL=Vector3(-2+rand_range(0,0.5),VEL.y+rand_range(0,0.5), 0)
		if reproduce:
			var dupe = duplicate()
			dupe.set_script(scrpt)
			get_parent().add_child(dupe)
			reproduce=false
			$RPCTIMER.start()
	elif area.get_meta("leftarea"):
		VEL=Vector3(2+rand_range(0,0.5),VEL.y+rand_range(0,0.5), 0)
		if reproduce:
			var dupe = duplicate()
			dupe.set_script(scrpt)
			get_parent().add_child(dupe)
			reproduce=false
			$RPCTIMER.start()
