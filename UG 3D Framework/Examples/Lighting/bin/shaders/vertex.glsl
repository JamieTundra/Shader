#version 150

in vec4 Position;
in vec4 Colour;
in vec4 Normal;
in vec2 Tex1;

out vec4 vPos;
out vec4 vNormal;
out vec4 vColour; 
out vec2 vUV;

uniform mat4 ProjectionView; 
uniform mat4 Model;
uniform mat4 NormalMatrix;

void main() 
{ 
	vPos = Model * Position;
	vNormal = NormalMatrix * Normal;
	vColour = Colour;
	vUV = Tex1;
	gl_Position = ProjectionView * Model * Position;
}