extends Node2D

signal health_changed(player_hearts)
enum{
	ALIVE,
	DEAD
}
var state:int = ALIVE
const max_health:int = 5
var health :float=max_health
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position=get_viewport_rect().size / 2# Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


#func _on_area_2d_area_entered(area: Area2D) -> void:
	#get_node("level1/villians/villian").global_position += 0


func _on_area_2d_area_entered(area: Area2D) -> void:
	health-=1 # Replace with function body.
	emit_signal("health_changed",health)
	if health==0:
		state=DEAD
