# CMakeLists.txt(For Android and iOS !!!)
# Sets the minimum version of CMake required to build your native library.
# This ensures that a certain set of CMake features is available to
# your build.
if(CMAKE_SYSTEM_NAME STREQUAL "iOS" OR TARGET_SYSTEM_NAME STREQUAL "macOS")
cmake_minimum_required(VERSION 3.15)
else()
cmake_minimum_required(VERSION 3.10)
endif()

# set project name
project(flutter_jsc)

# Specifies a path to native header files.
include_directories(include/)

# Specifies a path to native source files and stores it in the variable ${SOURCE_SRC}.
aux_source_directory(src/ SOURCE_SRC)

# Specifies a library name, specifies whether the library is STATIC or
# SHARED, and provides relative paths to the source code. You can
# define multiple libraries by adding multiple add_library() commands,
# and CMake builds them for you. When you build your app, Gradle
# automatically packages shared libraries with your APK.
add_library(${PROJECT_NAME} SHARED ${SOURCE_SRC})

# (only for android)!!!
if(CMAKE_SYSTEM_NAME STREQUAL "Android")
get_filename_component(ANDROID_PROJECT_DIR ${CMAKE_HOME_DIRECTORY}/../android ABSOLUTE)
endif()
# (only for macos)!!!
if(TARGET_SYSTEM_NAME STREQUAL "macOS")
message(DEBUG ${TARGET_SYSTEM_NAME})
endif()
# (for ios or macos)!!!
if(CMAKE_SYSTEM_NAME STREQUAL "iOS" OR TARGET_SYSTEM_NAME STREQUAL "macOS")
target_link_libraries(${PROJECT_NAME} PUBLIC "-framework JavaScriptCore")
# normal iOS IDENTIFIER
string(REPLACE "_" "-" IDENTIFIER "com.sankuai.${PROJECT_NAME}")
# wrap in ${PROJECT_NAME}.framework 
set_target_properties(${PROJECT_NAME}
  PROPERTIES
  FRAMEWORK TRUE
  FRAMEWORK_VERSION A
  MACOSX_FRAMEWORK_IDENTIFIER ${IDENTIFIER}
)
# install ${PROJECT_NAME}.framework 
install(TARGETS ${PROJECT_NAME} DESTINATION lib)
endif()
