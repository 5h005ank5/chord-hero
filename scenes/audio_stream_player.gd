extends Node2D

var spectrum
var effect
var recording
var min = 70
var max = 410
var freq = [min,82.41,98,110,123.47,130.81,146.83,164.81,174.61,196,207.65,220,246.94,261.63,277.18,329.63,349.23,369.99,392,max]
var size = freq.size()
var data_max = []
var min_db = 30

func _process(delta):
	var data =[]
	for i in range(size-2):
		var low_freq = freq[i]
		var med_freq = freq[i+1]
		var high_freq = freq[i+2]
		var avg1 = (low_freq+med_freq)/2
		var avg2 = (med_freq+high_freq)/2
		var magnitude = spectrum.get_magnitude_for_frequency_range(avg1,avg2,0).length()
		var energy = clampf((min_db + linear_to_db(magnitude)) / min_db, 0, 1)
		
		#if(energy>0):
		data.append(energy)
		#else:
			#data[i] = 0
		
	for i in range(size-2):
		if data[i] > data_max[i]:
			data_max[i] = data[i]
	"""
	printraw("[")
	for i in range(size-2):
		print(*data_max)
	print("]")
	"""
	print(data_max)
func _ready():
	# We get the index of the "Record" bus.
	var idx = AudioServer.get_bus_index("Record")
	# And use it to retrieve its first effect, which has been defined
	# as an "AudioEffectRecord" resource.
	spectrum = AudioServer.get_bus_effect_instance(idx, 1)
	data_max.resize(size-2)
	data_max.fill(0.0)
	"""
	print("[")
	for i in range(size-2):
		print(data_max[i],",")
	print("]")
	"""
