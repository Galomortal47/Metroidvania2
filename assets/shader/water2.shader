shader_type canvas_item;

// Gonkee's water shader for Godot 3 - full tutorial https://youtu.be/uhMAHpV_cDg
// If you use this shader, I would prefer if you gave credit to me and my channel

uniform vec4 blue_tint : hint_color;

void fragment(){
	
	
	vec4 color;
	
	
	color = blue_tint * 0.5;

	COLOR = color;
}