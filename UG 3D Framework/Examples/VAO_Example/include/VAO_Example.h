#ifndef __VAO_Example_H_
#define __VAO_Example_H_

#include "Application.h"
#include <glm/glm.hpp>

// Derived application class that wraps up all globals neatly
class VAO_Example : public Application
{
public:

	VAO_Example();
	virtual ~VAO_Example();

protected:

	virtual bool onCreate();
	virtual void Update(float a_deltaTime);
	virtual void Draw();
	virtual void Destroy();

	
	glm::mat4	m_cameraMatrix;
	glm::mat4	m_projectionMatrix;
};

#endif // __Application_H_