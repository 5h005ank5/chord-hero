extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position=get_viewport_rect().size / 2# Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


"""
func _on_area_2d_area_entered(area: Area2D) -> void:
	get_node("level1/villians/villian").global_position += 0
"""
