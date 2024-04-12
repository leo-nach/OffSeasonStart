extends Control

var drag = false
var touchpos :Vector2
signal input_dir(direction)
var direction

func _ready():
	$Control.visible = false
	$Control/TextureRect2.visible =false

func _input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			position = event.position
			drag=true
			$Control2/TextureRect.visible = true
			_display_UI_back()
		else : 
			$Control.visible = false
			$Control/TextureRect2.visible =false
			$Control2/TextureRect.visible = false
			drag = false
			touchpos = Vector2.ZERO
			direction = 0
	if drag==true:touchpos = event.position

func _display_UI_back():
	$Control.scale = Vector2.ONE
	$Control.visible = true
	var tween = create_tween()
	tween.tween_property($Control,"scale",Vector2(.5,.5),.2)
	await tween.finished
	$Control/TextureRect2.visible =true

func _process(delta):
	$Control2.global_position = touchpos
	direction = Vector2(touchpos-position).normalized()
	input_dir.emit(direction)
