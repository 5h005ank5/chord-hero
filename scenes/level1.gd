extends Node2D

var villain_scene : PackedScene = load("res://scenes/villian.tscn")
var rng = RandomNumberGenerator.new()
#var array_timer = get_node("res://scenes/audio_stream_player.gd")
#var array = array_timer.data_max
var data_max = []

func _process(_delta: float) -> void:
	pass
	
func _ready() -> void:
	pass
	#var array_timer = get_node("res://scenes/audio_stream_player.gd")
	#var array = array_timer.data_max
	#func _on_emptyArray_timeout():
		## Empty the array
		#array.clear()
		#print("Array emptied")
	
func _on_villian_timer_timeout() -> void:
	var numberofvillians = 1
	#print("Number of villains:", numberofvillians)
	
	while numberofvillians:
		var villians = villain_scene.instantiate()  # Instantiate the villain
		$villians.add_child(villians)  # Add the villain to the parent container
		
		numberofvillians -= 1
	
	$villianTimer.start()
#func _on_emptyArray_timeout():
	## Empty the array
	#array.clear()
	#print("Array emptied")
