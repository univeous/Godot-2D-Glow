tool
extends TextureRect

export(int) var value = 0 setget set_value

func set_value(new_value):
	value = new_value
	if not has_node("Label"):
		return
	if value == 0:
		$Label.text = ""
		return
	var text = str(value) if value < 0 else "+" + str(value)
	$Label.text = text

func _on_swatch_gui_input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			$"../../..".intensity += value 
