shader_type canvas_item;

// Gonkee's water shader for Godot 3 - full tutorial https://youtu.be/uhMAHpV_cDg
// If you use this shader, I would prefer if you gave credit to me and my channel

uniform vec4 blue_tint : hint_color;

uniform vec2 sprite_scale;
uniform vec2 player_position;
uniform float scale_x = 0.67;

float rand(vec2 coord){
	return fract(sin(dot(coord, vec2(1, 1))));
}

float noise(vec2 coord){
	vec2 i = floor(coord);
	vec2 f = fract(coord);

	// 4 corners of a rectangle surrounding our point
	float a = rand(i);
	float b = rand(i + vec2(1.0, 0.0));
	float c = rand(i + vec2(0.0, 1.0));
	float d = rand(i + vec2(1.0, 1.0));

	vec2 cubic = f * f * (3.0 - 2.0 * f);

	return mix(a, b, cubic.x) + (c - a) * cubic.y * (1.0 - cubic.x) + (d - b) * cubic.x * cubic.y;
}

uniform vec2 input;
uniform sampler2D sprite;
uniform sampler2D alpha;

void fragment(){
	
	vec2 noisecoord1 = UV * sprite_scale * scale_x * 1.0;
	
	vec2 motion1 = vec2(TIME , TIME );
	
	vec2 distort1 = vec2(noise(noisecoord1 + motion1), noise(noisecoord1  + motion1));
	
	vec2 distort_sum = (distort1) / 60.0;
	
	vec4 color;
	
	vec2 uv = SCREEN_UV;
	uv.y *= -1.0;
	uv.y -= player_position.y;
	vec2 offsset = (vec2(0.0,0.333));
	vec4 relection = textureLod(SCREEN_TEXTURE, uv + offsset, 0.0);
	vec4 screen  = textureLod(SCREEN_TEXTURE, SCREEN_UV + (distort_sum * 2.0), 0.0);
	
	color = mix(color, blue_tint, 0.3);
	color.rgb = mix(vec3(0.5), color.rgb, 1.4);
	
	float y = UV.y + (distort_sum.y * 10.0);
	float near_top = (y) + (0.66);
	near_top = clamp(near_top, 0.0, 1.0);
	near_top = (1.0 - near_top);
	
	float y2 = UV.y + (distort_sum.y * 1.0);
	float near_top2 = (y) + (0.5);
	near_top2 = clamp(near_top2, 0.0, 1.0);
	near_top2 = 1.0 - near_top2;
	
	relection = mix(blue_tint, relection, near_top2 * 2.0);
	
	vec4 disto = mix(relection, screen, 0.66);
	
	color = disto;
	
	color = mix(color, vec4(1.0), near_top);

	if(near_top > 0.1){
		color.a = 0.0;
	}
	
	COLOR = color;
//	COLOR.rg = UV;
}