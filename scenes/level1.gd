extends Node2D

var villain_scene :PackedScene= load("res://scenes/villian.tscn")
var rng=RandomNumberGenerator.new()

func _on_villian_timer_timeout() -> void:
	var numberofvillians=rng.randi_range(1,4)
	print(numberofvillians)
	while numberofvillians:
		var villain = villain_scene.instantiate()
		$villians.add_child(villain)
		numberofvillians-=1
	$villianTimer.start()
	
