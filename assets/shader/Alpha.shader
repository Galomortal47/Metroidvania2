shader_type canvas_item;

uniform vec2 input;
uniform sampler2D sprite;
uniform sampler2D alpha;

void fragment(){
	vec2 VectorOp = vec2(UV + input);
	
	vec4 color = texture(sprite, UV);
	color.a = texture(alpha, VectorOp).a;
	
	COLOR = color;
}