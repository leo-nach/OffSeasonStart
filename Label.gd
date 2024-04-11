extends Label

func _ready():
	visible_ratio=0
	displaytext()

func displaytext():
	var tween = create_tween().set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self,"visible_ratio",1,10)


