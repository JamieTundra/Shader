#version 150

#define USE_BLINN 1

in vec4 vPos;
in vec4 vNormal;
in vec4 vColour;
in vec2 vUV;

out vec4 FragColor;

uniform vec4 cameraPosition;
uniform vec4 lightDirection;

uniform sampler2D DiffuseTexture;
 

 struct Light{
 vec4 ambient;
 vec4 diffuse;
 vec4 specular;
 };

 uniform vec4  modelAmbient;
 uniform vec4  modelDiffuse;
 uniform vec4  modelSpecular;

 const Light sceneLight = Light(vec4( 0.25, 0.25,0.25,1.0), vec4(1.f,1.f,1.f,1.f), vec4(1.f,0.0f,0.0f,1.f));
 const float specularTerm = 32.f;

void main()
{

	vec4 albedo = texture(DiffuseTexture, vUV);

	//Phong ambient color
	vec4 ambient = sceneLight.ambient * modelAmbient;
	
	//Phong Diffuse
	vec4 diffuse = max(0,dot(vNormal,-lightDirection))* sceneLight.diffuse * modelDiffuse;

	vec4 eyeDir = normalize( cameraPosition - vPos);
	vec4 specular;
	#ifdef USE_BLINN
		vec4 halfDir = normalize(eyeDir-lightDirection);
		specular = pow(max(0,dot(halfDir, vNormal)),specularTerm)*sceneLight.specular*modelSpecular;
	#else
		//Phong Specular
		
		vec4 reflection = reflect(lightDirection, vNormal);
		specular = pow(max(0.f,dot(reflection, eyeDir)),specularTerm)*sceneLight.specular*modelSpecular;
	#endif
	vec3 linearColour = ambient.xyz + diffuse.xyz + specular.xyz; 
	//gamma correction
	vec3 gammaCorrected = pow(linearColour, vec3(1.0/2.2));
	FragColor = vec4(gammaCorrected * albedo.xyz, 1.0f);
}
