gcc -c -fpic ring_opengl42.c -I $PWD/../../../language/include
gcc -shared -o $PWD/../../../lib/libring_opengl42.so ring_opengl42.o -L $PWD/../../lib -lring -L /usr/lib/i386-linux-gnu -lGL -lGLU -lglut

 


