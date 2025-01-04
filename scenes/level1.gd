extends Node2D

var villain_scene : PackedScene = load("res://scenes/villian.tscn")
var rng = RandomNumberGenerator.new()

func _ready() -> void:
	pass
	
func _on_villian_timer_timeout() -> void:
	var numberofvillians = 1
	#print("Number of villains:", numberofvillians)
	
	while numberofvillians:
		var villians = villain_scene.instantiate()  # Instantiate the villain
		$villians.add_child(villians)  # Add the villain to the parent container
		
		numberofvillians -= 1
	
	$villianTimer.start()
