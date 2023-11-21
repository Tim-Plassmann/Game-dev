extends Camera3D

# Declare a target variable to store the reference to the spaceship
var target: Node = null
var follow_distance: float = 10.0  # Adjust this value based on the desired follow distance
var follow_height: float = 5.0  # Adjust this value based on the desired follow height

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Check if the target (spaceship) is set
	if target:
		# Get the spaceship's global position
		var target_position = target.global_transform.origin

		# Set the camera position to follow the spaceship at a certain distance and height
		global_transform.origin = target_position + Vector3(0, follow_height, -follow_distance)

		# Look at the spaceship
		look_at(target_position, Vector3(0, 1, 0))
