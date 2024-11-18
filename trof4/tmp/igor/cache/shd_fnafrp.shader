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

//######################_==_YOYO_SHADER_MARKER_==_######################@~
/*
This shader is from Five Nights at Freddys' Remastered.
Created by: Clickteam
Ripped by: Rhadamus (https://gamejolt.com/@Rhadamus)
Ported to GLSL by: Murix Studios (https://gamejolt.com/@murix)
*/

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

float fPixelWidth = 0.001;
float fPixelHeight = 0.001;

//Mess with these values (KEEP it as a decimal!)
//Vertical - 0 means no and 1 means yes.
float pDir = 0.0;
//Self explanatory. Increase this value to make it stronger or weaker.
float zoom = 75.0; //originally 75
//No black edges (Keep either 0.0 or 1.0)
float noWrap = 1.0;

void main ()
{
	float fB;
	float fC;
  
	vec2 posTex;
	vec4 color = vec4(0.0, 0.0, 0.0, 1.0);
  
	if(pDir == 0.0)
	{
		fB = 1.0 - (zoom * fPixelHeight);
		fC = max(0.02, 1.0 + (fB - 1.0) * 4.0 * pow((v_vTexcoord.x - 0.5), 2.0));
    
		posTex = v_vTexcoord * vec2(1.0, fC) + vec2(0.0, (1.0 - fC) / 2.0);
    
		if(noWrap == 0.0 || (posTex.y >= 0.0 && posTex.y <= 1.0))
		{
			gl_FragColor = v_vColour * texture2D(gm_BaseTexture, posTex);
		}
	} 
	
	else
	{
		fB = 1.0 - (zoom * fPixelWidth);
		fC = max(0.05, 1.0 + (fB - 1.0) * 4.0 * pow((v_vTexcoord.y - 0.5), 2.0));
    
		posTex = v_vTexcoord * vec2(fC, 1.0) + vec2((1.0 - fC) / 2.0, 0.0);
    
		if(noWrap == 0.0 || (posTex.x >= 0.0 && posTex.x <= 1.0))
		{
			gl_FragColor = v_vColour * texture2D(gm_BaseTexture, posTex);
		}
	
	}
  
}

