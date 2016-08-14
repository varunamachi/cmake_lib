if( DEFINED VQ_PROJECT_DEFINED )
    message( FATAL_ERROR
             "Container is trying to be a project, which it should not do. "
             "Check if both quartz.cmake and container.cmake are included in "
             "a single CMakeLists.txt" )
endif()
set( VQ_IS_PROJECT_CONTAINER ON )

# file( TO_CMAKE_PATH "$ENV{PROJECT_ROOT}" PROJECT_ROOT )

# file( TO_CMAKE_PATH "$ENV{${VQ_PROJECT_NAME}_ROOT}" PROJECT_ROOT )

set( VQ_BUILD_DIR       ${PROJECT_ROOT}/builds )
set( VQ_OUTPUT_DIR      ${PROJECT_ROOT}/output )
set( VQ_SRC_DIR         ${PROJECT_ROOT}/source )
set( VQ_TEST_DIR        ${PROJECT_ROOT}/tests )

set( CMAKE_INSTALL_PREFIX ${VQ_OUTPUT_DIR} )
set( SUBPROJECTS "" )

macro( add_project MODULE_NAME )
    add_subdirectory( ${MODULE_NAME} )
    set_property( GLOBAL APPEND PROPERTY "SUBPROJECTS"  ${MODULE_NAME} )
endmacro()

