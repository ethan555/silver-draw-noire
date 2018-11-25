//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.	
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    // Get the original color
    vec4 original = texture2D( gm_BaseTexture, v_vTexcoord );
    
    // Get the inversion of the colors
    float red = 1.0 - original.r;
    float green = 1.0 - original.g;
    float blue = 1.0 - original.b;
    float alpha = original.a;
    
    // Set the new colors
    vec4 inverted = vec4(red, green, blue, alpha);
    gl_FragColor = inverted;
}

