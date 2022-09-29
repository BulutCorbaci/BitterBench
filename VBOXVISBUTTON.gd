extends VBoxContainer

var Checked
var Unchecked

func _ready():
	Checked=load("res://icons8-checked-checkbox-96.png")
	Unchecked=load("res://icons8-unchecked-checkbox-96.png")

func _physics_process(_delta):
	for c in get_children():
		if c.pressed:
			c.icon=Checked
		else:
			c.icon=Unchecked
			c.icon=Unchecked
