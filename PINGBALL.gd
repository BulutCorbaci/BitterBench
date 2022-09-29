extends KinematicBody2D

var VEL=Vector2(400, 400)
var scrpt
var reproduce = false

func _ready():
	randomize()
	scrpt = load("res://PINGBALL.gd")
	$RPCTIMER.start()
	set_meta("pinball", true)
	VEL=Vector2(400+rand_range(0,50),400+rand_range(0,50))

func _process(delta):
	move_and_slide(VEL)
	if position.y>1074:
		
		VEL=Vector2(VEL.x+rand_range(0,50),-400+rand_range(0,50))
		if reproduce:
			var dupe = duplicate()
			dupe.set_script(scrpt)
			get_parent().add_child(dupe)
			reproduce=false
			$RPCTIMER.start()
	elif position.y<0:
		
		VEL=Vector2(VEL.x+rand_range(0,50),400+rand_range(0,50))
		if reproduce:
			var dupe = duplicate()
			dupe.set_script(scrpt)
			get_parent().add_child(dupe)
			reproduce=false
			$RPCTIMER.start()
	if position.x>1920:
		
		VEL=Vector2(-400+rand_range(0,50),VEL.y+rand_range(0,50))
		if reproduce:
			var dupe = duplicate()
			dupe.set_script(scrpt)
			get_parent().add_child(dupe)
			reproduce=false
			$RPCTIMER.start()
	elif position.x<0:
		
		VEL=Vector2(400+rand_range(0,50),VEL.y+rand_range(0,50))
		if reproduce:
			var dupe = duplicate()
			dupe.set_script(scrpt)
			get_parent().add_child(dupe)
			reproduce=false
			$RPCTIMER.start()


func _on_RPCTIMER_timeout():
	reproduce=true
