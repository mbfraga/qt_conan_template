# Generic test that uses conan libs

add_executable(app main.cpp)

if (UNIX) 
  target_compile_options(app PRIVATE -fPIC)
endif(UNIX)

target_link_libraries(
  app
  PRIVATE CONAN_PKG::fmt
          CONAN_PKG::qt)
