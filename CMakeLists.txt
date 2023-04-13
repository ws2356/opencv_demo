cmake_minimum_required(VERSION 3.13)

project(opencv_demo)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -O0")

set(CMAKE_CXX_STANDARD_INCLUDE_DIRECTORIES ${CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES})

find_package(OpenCV REQUIRED)

set(targets opencv_demo_basic_draw opencv_demo_text opencv_demo_smooth_blur)

foreach(target IN LISTS targets)
  message(STATUS "processing target: ${target}")
  add_executable(${target} "${target}.cc")
  target_link_libraries(${target} ${OpenCV_LIBS})
endforeach()

