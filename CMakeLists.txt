cmake_minimum_required(VERSION 3.16)

project(qml VERSION 1.0 LANGUAGES CXX)

find_package(Qt6 COMPONENTS Quick Gui REQUIRED)

qt_standard_project_setup()
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

qt_add_executable(example-qml
    cpp/main.cpp
)

qt_add_qml_module(example-qml
    URI qml
    QML_FILES
        qml/main.qml
)

target_link_libraries(example-qml PRIVATE Qt6::Gui Qt6::Quick)
