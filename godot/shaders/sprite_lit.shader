shader_type canvas_item;

void fragment(){
	COLOR = texture(TEXTURE, UV);
	if(!AT_LIGHT_PASS){
		COLOR = vec4(0.0, 0.0, 0.0, texture(TEXTURE, UV).a);
	}
}

void light(){
	LIGHT = LIGHT;
}