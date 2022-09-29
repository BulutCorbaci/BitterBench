extends Node

var BENCHARRAY=[true,true,true,true,true,true,true,true,true,true,true]
var BENCHPASSES=[0,0,0,0,0,0,0,0,0,0,0]

func _ready():
	pass

func _change_scenes_of_test():
	if BENCHARRAY[0]==true:
		get_tree().change_scene("res://BITTERHASH.tscn")
	elif BENCHARRAY[1]==true:
		get_tree().change_scene("res://BITTERCRYPT.tscn")
	elif BENCHARRAY[2]==true:
		get_tree().change_scene("res://BITTERUI.tscn")
	elif BENCHARRAY[3]==true:
		get_tree().change_scene("res://BITTER2DPART.tscn")
	elif BENCHARRAY[4]==true:
		get_tree().change_scene("res://BITTER2DOBJ.tscn")
	elif BENCHARRAY[5]==true:
		get_tree().change_scene("res://BITTER3DPART.tscn")
	elif BENCHARRAY[6]==true:
		get_tree().change_scene("res://BITTER3DOBJ.tscn")
	elif BENCHARRAY[7]==true:
		get_tree().change_scene("res://BITTERSTR.tscn")
	elif BENCHARRAY[8]==true:
		get_tree().change_scene("res://BITTERVAR.tscn")
	elif BENCHARRAY[9]==true:
		get_tree().change_scene("res://BITTERFILE.tscn")
	elif BENCHARRAY[10]==true:
		get_tree().change_scene("res://BITTERNOISE.tscn")
	else:
		var filehandler = File.new()
		filehandler.open("user://scorestore", File.WRITE)
		filehandler.store_var(BENCHPASSES)
		filehandler.close()
		get_tree().change_scene("res://BITTERBENCH.tscn")
