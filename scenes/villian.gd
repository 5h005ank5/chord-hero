extends Node2D

 # Preloaded scene for the villains
var audio = AudioServer.get_bus_effect_instance(2,1)
#var magni = audio.get_magnitude_for_frequency_range(80,85,1)
var player_position
# = Vector2(636,336)  # To store the player's position
@export var spawn_radius = 750.0  # Radius of the spawn circle
@export var villain_speed = 0.15  # Speed of villains
@export var spawn_interval = .5  # Interval in seconds for spawning villains
@export var freq_E2=82.41
@export var freq_A2=110.00
@export var freq_D3=146.83
@export var freq_G3=196.0
@export var freq_B3=246.94
@export var freq_E4=329.63
@export var tollerance = .05
var rng = RandomNumberGenerator.new()
func _ready() -> void:
	var angle = rng.randf_range(0.5,2.50)* 2*PI  # TAU = 2π
	if((angle>29 and angle<151)or(angle>209 and angle<331)):
		villain_speed *= abs(648/cos(angle))
	else:
		villain_speed *= abs(310/sin(angle))
	if(villain_speed>90):
		villain_speed=90;
	player_position = $"../../player".global_position
	var spawn_position = player_position + Vector2(cos(angle), sin(angle)) * spawn_radius
	global_position = spawn_position
	  # Make the villain face the player


func _process(delta):
	# Assuming the player is in the scene tree and called "Player"
	"""
	var E2 = audio.get_magnitude_for_frequency_range(freq_E2-tollerance*freq_E2,freq_E2+tollerance*freq_E2,1)
	var A2 = audio.get_magnitude_for_frequency_range(freq_A2-tollerance*freq_A2,freq_A2+tollerance*freq_A2,1)
	var D3 = audio.get_magnitude_for_frequency_range(freq_D3-tollerance*freq_D3,freq_D3+tollerance*freq_D3,1)
	var G3 = audio.get_magnitude_for_frequency_range(freq_G3-tollerance*freq_G3,freq_G3+tollerance*freq_G3,1)
	var B3 = audio.get_magnitude_for_frequency_range(freq_B3-tollerance*freq_B3,freq_B3+tollerance*freq_B3,1)
	var E4 = audio.get_magnitude_for_frequency_range(freq_E4-tollerance*freq_E4,freq_E4+tollerance*freq_E4,1)
	"""
	#print("Magnitude for E2 : ",E2.length())
	#print("Magnitude for A2 : ",A2.length())
	#print(villain_speed)
	
	#look_at(player_position)
	var direction = (player_position - global_position).normalized()
	global_position += direction * villain_speed * delta


func _on_area_2d_area_entered(area: Area2D) -> void:
	villain_speed = 0
