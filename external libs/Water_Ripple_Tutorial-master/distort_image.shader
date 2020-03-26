shader_type canvas_item;

// create uniform with the texture to be distorted (GODOT icon)
uniform sampler2D image;


void fragment()
{
	vec2 ps = TEXTURE_PIXEL_SIZE;
	float dx = 0.5 * ( texture( TEXTURE, UV + vec2( ps.x, 0.0 ) ).r + texture( TEXTURE, UV + vec2( -ps.x, 0.0 ) ).r - 1.0 );
	float dy = 0.5 * ( texture( TEXTURE, UV + vec2( 0.0, ps.y ) ).r + texture( TEXTURE, UV + vec2( 0.0, -ps.y ) ).r - 1.0 );
	COLOR = texture( image, UV + vec2( dx, dy ) ).rgba;
}