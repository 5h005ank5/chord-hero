extends Node2D

var spectrum
var effect
var recording
var min = 70
var max = 410
var freq = [min,82.41,98,108,110,116,123.47,130.81,13,146.83,164.81,174.61,196,207.65,220,246.94,261.63,277.18,293.66,329.63,349.23,369.99,392,max]
var size = freq.size()
var data_max = []
var data_max_temp = []
var min_db = 60

func _process(delta):
	var data =[]
	var data_temp =[]
	for i in range(size-2):
		var low_freq = freq[i]
		var med_freq = freq[i+1]
		var high_freq = freq[i+2]
		var avg1 = (low_freq+med_freq)/2
		var avg2 = (med_freq+high_freq)/2
		var mag_temp = spectrum.get_magnitude_for_frequency_range(avg1*4,avg2*4,0).length()
		var magnitude = spectrum.get_magnitude_for_frequency_range(avg1,avg2,0).length()
		var energy_temp = clampf((min_db + linear_to_db(mag_temp)) / min_db, 0, 1)
		var energy = clampf((min_db + linear_to_db(magnitude)) / min_db, 0, 1)
		
		#if(energy>0):
		data_temp.append(energy_temp)
		data.append(energy)
		#else:
			#data[i] = 0
		
	#for i in range(size-2):
		#if data_temp[i] > data_max_temp[i]:
			#data_max_temp[i] = data_temp[i]
	for i in range(size-2):
		if data[i] > data_max[i]:
			data_max[i] = data[i]
	"""
	printraw("[")
	for i in range(size-2):
		print(*data_max)
	print("]")
	"""
	print(data_max_temp)
	print("Hi")
	print(data_max)
	print("there")
	
#func _on_emptyArray_timeout():
	## Empty the array
	#data_max.clear()
	#print("Array emptied")
	
func _ready():
	# We get the index of the "Record" bus.
	var idx = AudioServer.get_bus_index("Record")
	# And use it to retrieve its first effect, which has been defined
	# as an "AudioEffectRecord" resource.
	spectrum = AudioServer.get_bus_effect_instance(idx, 1)
	data_max.resize(size-2)
	data_max_temp.resize(size-2)
	data_max.fill(0.0)
	data_max_temp.fill(0.0)
	"""
	print("[")
	for i in range(size-2):
		print(data_max[i],",")
	print("]")
	"""


func _on_empty_array_timeout() -> void:
	#data_max.clear()
	data_max.fill(0.0)
	data_max_temp.fill(0.0)
	#print("Array emptied")
