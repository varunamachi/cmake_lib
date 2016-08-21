# cmake_lib

CMake macros and function tied to particular project structure:

```
project_root/
    source/
    cmake/
      cmake_lib/[this repo as submodule]
      [project_specific].cmake
    output/
      [distributables]      
    scripts/
      *.sh
      *.bash
      *.py
      .
    builds
      [build_dir]
```  

Where:<br>
* **source** has all the C++ sources
* **cmake** directory has this repo as submodule and a project specific cmake file which will define variable named 
VQ_PROJECT_DIR which points to the root of the project directory structure.
* **output** is the directory inside which cmake installs shared/static libraries, headers, binaries.
* **scripts** will have shell scripts, batch files or any other scripts
* **builds** recommended top level directory for all from where cmake is run to generate the project/make files. Atleast the 
build scripts should use this directory for generating build directories.

Example project specific cmake:
```cmake
file( TO_CMAKE_PATH "$ENV{VQ_ROOT}" VQ_ROOT )
set( PROJECT_ROOT ${VQ_ROOT} )
include( ${PROJECT_ROOT}/cmake/cmake_lib/core.cmake)
```  

Example CMakeLists.txt that defines a project 'my_project':
```cmake
project( my_project )
cmake_minimum_required(VERSION 3.1)
cmake_policy( SET CMP0020 NEW )
include( $ENV{VQ_ROOT}/cmake/vq.cmake )

vq_headers(
    #include the header files
)

vq_sources(
    #include the source files (*.cpp/*.c/*.cc etc)
)

vq_classes(
    #C++ class names
)
vq_create_sharedlib()
#vq_create_staticlib()
#vq_create_executable()
vq_install()
```

These CMake files were part of Quartz (https://github.com/varunamachi/quartz). Now separated out so that it can be used by differnt projects.
