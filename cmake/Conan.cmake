macro(qt_plugin_path)
  # Download automatically, you can also just copy the conan.cmake file
  if(NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
    message(STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
    file(DOWNLOAD "https://github.com/conan-io/cmake-conan/raw/v0.15/conan.cmake" "${CMAKE_BINARY_DIR}/conan.cmake")
  endif()

  include(${CMAKE_BINARY_DIR}/conan.cmake)

  execute_process(COMMAND ${CONAN_CMD} config home OUTPUT_STRIP_TRAILING_WHITESPACE OUTPUT_VARIABLE _CONAN_HOME)

  # VERY HARDCODED :)
  set(CONAN_QT_PLUGIN_PATH "${_CONAN_HOME}/data/qt/5.15.2/bincrafters/stable/package/1e57c658e3a0c0faf3ad909704a6bccd0eb6557c/plugins")

endmacro()



macro(run_conan)
  # Download automatically, you can also just copy the conan.cmake file
  if(NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
    message(STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
    file(DOWNLOAD "https://github.com/conan-io/cmake-conan/raw/v0.15/conan.cmake" "${CMAKE_BINARY_DIR}/conan.cmake")
  endif()

  include(${CMAKE_BINARY_DIR}/conan.cmake)

  conan_add_remote(
    NAME
    bincrafters
    URL
    https://api.bintray.com/conan/bincrafters/public-conan)

  conan_cmake_run(
    REQUIRES
    ${CONAN_EXTRA_REQUIRES}
    catch2/2.13.3
    docopt.cpp/0.6.2
    fmt/6.2.0
    spdlog/1.5.0
    OPTIONS
    ${CONAN_EXTRA_OPTIONS}
    BASIC_SETUP
    CMAKE_TARGETS # individual targets to link to
    BUILD
    missing

    GENERATORS qt
    IMPORTS "bin, *.dll -> ${CMAKE_CURRENT_BINARY_DIR}/src/bin"
    IMPORTS "bin, *.exe -> ${CMAKE_CURRENT_BINARY_DIR}/src/bin"
    IMPORTS "lib, *.dylib* -> ${CMAKE_CURRENT_BINARY_DIR}/src/bin"
    IMPORTS "plugins, * -> ${CMAKE_CURRENT_BINARY_DIR}/src/bin/plugins"
    )


endmacro()
