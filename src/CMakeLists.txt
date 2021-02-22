# Generic test that uses conan libs

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_set_vs_runtime()
conan_set_libcxx()
conan_output_dirs_setup()
conan_basic_setup(KEEP_RPATHS)

find_package(Qt5Core CONFIG REQUIRED)
find_package(Qt5Widgets CONFIG REQUIRED)



set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)

add_executable(app main.cpp test_widget.cpp test_widget.h)
target_link_libraries(app PRIVATE CONAN_PKG::fmt Qt5::Core Qt5::Widgets)
