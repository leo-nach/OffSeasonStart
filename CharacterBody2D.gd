extends CharacterBody2D
var _direction
var speed = 100

func _physics_process(delta):
	if _direction:
		var dir = _direction
		if dir.x :
			$meshHandler/mesh/AnimationPlayer.play("walk")
			if dir.x > 0 :
				$meshHandler.scale.x = 1
			else: $meshHandler.scale.x = -1
			
		else: $meshHandler/mesh/AnimationPlayer.play("idle")
		
		velocity.x = dir.x *speed
	move_and_slide()

func _on_control_input_dir(direction):
	_direction = direction
