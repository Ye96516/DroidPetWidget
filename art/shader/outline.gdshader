shader_type canvas_item;

uniform vec4 outline_color:source_color=vec4(1,0.3,0,1);

void fragment() {
	vec4 color=texture(TEXTURE,UV);
	if (abs(color.a - 1.0) < 0.0001 && abs(color.r-0.184)<0.01)  {
		COLOR=outline_color;

	}
}


