extends Node2D

# Declare target_position and speed as instance variables
var target_position : Vector2 = Vector2(100,10)  # Default target position
var speed = 100  # Speed of movement

func _ready():
	# This will confirm that the target_position is initialized correctly
	print("Villain target_position:", target_position)

func _process(delta):
	# Move the villain towards the target position
	position = position.move_toward(target_position, speed * delta)
