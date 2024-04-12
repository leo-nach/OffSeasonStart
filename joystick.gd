extends Control

var drag = false

func _ready():
	$Control.visible = false
	$Control/TextureRect2.visible =false

func _input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			position = event.position
			drag=true
			_display_UI_back()
		else : 
			$Control.visible = false
			$Control/TextureRect2.visible =false
			drag = false
	print(drag)

func _display_UI_back():
	$Control.scale = Vector2.ONE
	$Control.visible = true
	var tween = create_tween()
	tween.tween_property($Control,"scale",Vector2(.5,.5),.2)
	await tween.finished
	$Control/TextureRect2.visible =true
