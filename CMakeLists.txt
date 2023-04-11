cmake_minimum_required(VERSION 3.13)

project(opencv_demo)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -O0")

set(CMAKE_CXX_STANDARD_INCLUDE_DIRECTORIES ${CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES})

find_package(OpenCV REQUIRED)


add_executable(opencv_demo_basic_draw opencv_demo_basic_draw.cc)
target_link_libraries(opencv_demo_basic_draw ${OpenCV_LIBS})


add_executable(opencv_demo_text opencv_demo_text.cc)
target_link_libraries(opencv_demo_text ${OpenCV_LIBS})

