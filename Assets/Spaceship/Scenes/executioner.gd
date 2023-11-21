extends Node3D

#* Declare variables for movement speed and rotation speed
var speed: float = 0.0
var rotation_speed: float = 2.0
var acceleration: float = 200.0
var max_speed: float = 10000.0
var damping: float = 0.9


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Get input from the player
	var direction = Vector3()  # Initialize a vector to store movement direction

	if Input.is_action_pressed("throttle_up"):
		speed += acceleration * delta
		speed = min(speed, max_speed)
		direction.z -= speed # Move forward
	else:
		# Apply damping to gradually slow down when no input is detected
		speed *= pow(damping, delta)

	if Input.is_action_pressed("throttle_down"):
		speed -= acceleration * delta
		speed = max(speed, 0.0)
		direction.z += speed  # Move backward

	#if Input.is_action_pressed("Roll_left"):
		#direction.x -= 1  # Strafe left

	#if Input.is_action_pressed("Roll_right"):
		#direction.x += 1  # Strafe right

	#Normalize the direction vector to ensure consistent movement speed in all directions
	direction = direction.normalized()

	# Move the spaceship
	translate(direction * speed * delta)

	# Rotate the spaceship based on input
	rotate_y(-Input.get_action_strength("Yaw_right") * rotation_speed * delta)
	rotate_y(Input.get_action_strength("Yaw_left") * rotation_speed * delta)
	
	rotate_z(-Input.get_action_strength("Roll_right") * rotation_speed * delta)
	rotate_z(Input.get_action_strength("Roll_left") * rotation_speed * delta)
	
	rotate_x(-Input.get_action_strength("Pitch_down") * rotation_speed * delta)
	rotate_x(Input.get_action_strength("Pitch_up") * rotation_speed * delta)
	
	# Reference to the camera node
#var camera_node: Camera = $/root/executioner/Camera3D  # Adjust the node path based on your scene structure

# Set the camera's target to the spaceship
#camera_node.target = self

	
