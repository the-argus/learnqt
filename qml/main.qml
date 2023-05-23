import QtQuick 2.0

Item {
    width: 300
    height: 115

    Text {
        id: helloWorldText
        x: 50
        y: 25
        text: "Example QML Project"
        font.family: "monospace"
        font.pixelSize: 50
    }

    Rectangle {
        id: underline
        x: 50
        y: 75
        height: 5
        width: helloWorldText.width
        color: "black"
    }
}
