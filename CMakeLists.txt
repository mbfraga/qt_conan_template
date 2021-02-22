cmake_minimum_required(VERSION 3.15)

# PLEASE DO NOT USE THIS HORRIBLE SETUP IN PRODUCTION

project(myproject CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)



# Set up some extra Conan dependencies based on our needs before loading Conan
# NOTE: Don't change Qt version below!!!!!
set(CONAN_EXTRA_REQUIRES "qt/5.15.2@bincrafters/stable")
set(CONAN_EXTRA_OPTIONS "")

include(cmake/Conan.cmake)
run_conan()

qt_plugin_path()
configure_file(qt.conf.in qt.conf)

add_subdirectory(src)
