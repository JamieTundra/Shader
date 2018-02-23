#include "VAO_Example.h"

#define DEFAULT_SCREENWIDTH 1024
#define DEFAULT_SCREENHEIGHT 720
// main that controls the creation/destruction of an application
int main(int argc, char* argv[])
{
	// explicitly control the creation of our application
	VAO_Example* app = new VAO_Example();
	app->run("VAO_Example", DEFAULT_SCREENWIDTH, DEFAULT_SCREENHEIGHT, false);

	// explicitly control the destruction of our application
	delete app;

	return 0;
}