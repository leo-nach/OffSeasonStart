extends CharacterBody2D

var speed = 70

func _physics_process(delta):
	var dir = Input.get_axis("ui_left","ui_right")
	if dir :
		$meshHandler/mesh/AnimationPlayer.play("walk")
		if dir > 0 :
			$meshHandler.scale.x = 1
		else: $meshHandler.scale.x = -1
		
	else: $meshHandler/mesh/AnimationPlayer.play("idle")
	
	velocity.x = dir *speed
	move_and_slide()
