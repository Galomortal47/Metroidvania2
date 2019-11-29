shader_type canvas_item;

// Gonkee's water shader for Godot 3 - full tutorial https://youtu.be/uhMAHpV_cDg
// If you use this shader, I would prefer if you gave credit to me and my channel

uniform vec4 blue_tint : hint_color;
uniform float ofsset = 1;
uniform vec2 inveter = vec2(1,-1);

void fragment(){
	
	vec2 uv = SCREEN_UV * vec2(1,-1);
	vec2 distort_sum = vec2(0,0.5);
	vec4 color = textureLod(SCREEN_TEXTURE, uv + distort_sum, 0.0);
	
	COLOR = color;
}