extends Panel

var intensity = 0 setget set_intensity
onready var base_color = $VBoxContainer/ColorPicker.color
onready var hdr_color = $VBoxContainer/ColorPicker.color setget set_hdr_color
signal color_changed

func _ready():
	set_intensity(intensity)

func set_intensity(value):
	intensity = value
	$VBoxContainer/intensity_slider/SpinBox.value = value
	$VBoxContainer/intensity_slider/HSlider.value = value
	hdr_color = base_color * pow(2, intensity)
	for swatch in $VBoxContainer/HBoxContainer.get_children():
		var image = Image.new()
		var texture = ImageTexture.new()
		image.create(1,1,false, Image.FORMAT_RGBA8)
		var swatch_color = hdr_color * pow(2, swatch.value)
		image.fill(swatch_color)
		texture.create_from_image(image)
		swatch.texture = texture
	emit_signal("color_changed", hdr_color)

func _on_ColorPicker_color_changed(color):
	base_color = color
	set_intensity(intensity)
	emit_signal("color_changed", hdr_color)

func set_hdr_color(new_color):
	var k_MaxByteForOverexposedColor = 191
	hdr_color = new_color
	base_color = new_color
	var max_color_component = max(max(new_color.r, new_color.g), new_color.b)
	if max_color_component == 0 or \
	(max_color_component <= 1.0 and max_color_component >= 1 / 255.0):
		intensity = 0
	else:
		var scale_factor = k_MaxByteForOverexposedColor / max_color_component
		intensity = log(255.0 / scale_factor) / log(2.0)
		base_color.r = min(k_MaxByteForOverexposedColor, scale_factor * new_color.r) / 255.0
		base_color.g = min(k_MaxByteForOverexposedColor, scale_factor * new_color.g) / 255.0
		base_color.b = min(k_MaxByteForOverexposedColor, scale_factor * new_color.b) / 255.0
	set_intensity(intensity)
	$VBoxContainer/ColorPicker.color = base_color
