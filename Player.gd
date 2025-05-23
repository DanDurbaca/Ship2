extends Area2D

@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("turn_right"):
		self.rotate(0.1)
	if Input.is_action_pressed("turn_left"):
		self.rotate(-0.1)
	if Input.is_action_pressed("acc"):
		velocity.y -= 1
	if Input.is_action_pressed("break"):
		velocity.y += 1
		#test2
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	velocity = velocity.rotated(self.rotation)
	position += velocity * delta
	
	position = position.clamp(Vector2.ZERO, screen_size)
	#print(self.rotation)
