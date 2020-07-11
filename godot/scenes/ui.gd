extends CanvasLayer

onready var current_button = $HBoxContainer/necklace
var player_material

func _ready():
	player_material = $"../player/Sprite".material
	set_texture(player_material.get_shader_param("necklace_color"), 
	$HBoxContainer/necklace)
	set_texture(player_material.get_shader_param("attack_color"), 
	$HBoxContainer/attack)
	$hdr_color_picker.hdr_color = \
		player_material.get_shader_param("necklace_color")

func _on_necklace_pressed():
	current_button = $HBoxContainer/necklace
	$hdr_color_picker.hdr_color = \
		player_material.get_shader_param("necklace_color")

func _on_attack_pressed():
	current_button = $HBoxContainer/attack
	$hdr_color_picker.hdr_color = \
		player_material.get_shader_param("attack_color")

func set_texture(color, button = current_button):
	if not button:
		return
	var image = Image.new()
	var texture = ImageTexture.new()
	image.create(1,1,false, Image.FORMAT_RGBA8)
	image.fill(color)
	texture.create_from_image(image)
	button.texture_focused = texture
	button.texture_normal = texture
	button.texture_hover = texture
	button.texture_pressed = texture

func _on_hdr_color_picker_color_changed(color):
	set_texture(color)
	if not player_material:
		return
	if current_button == $HBoxContainer/necklace:
		player_material.set_shader_param("necklace_color", color) 
	else:
		player_material.set_shader_param("attack_color", color)
