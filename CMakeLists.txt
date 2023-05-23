cmake_minimum_required(VERSION 3.16)

set(PROJECT_NAME example-qml)
project(PROJECT_NAME VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Core)
qt_standard_project_setup()

qt_add_executable(PROJECT_NAME
    cpp/main.cpp
)

target_link_libraries(PROJECT_NAME PRIVATE Qt6::Core)
