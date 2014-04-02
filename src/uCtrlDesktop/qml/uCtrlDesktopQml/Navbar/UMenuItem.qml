import QtQuick 2.0
import "../UI" as UI
import QtQuick.Controls 1.0

Rectangle {
    id: container

    property string icon: "Ok"
    property bool showSeparator: true
    property string label: "UNKNOWN"
    property string path: "."
    property var model: null

    width: 100; height: 100

    color: _colors.uTransparent

    UI.UFontAwesome {
        id: icon

        anchors.centerIn: parent

        iconId: container.icon
        iconSize: 50
        iconColor: _colors.uGrey
    }

    UI.UToolTip {
        id: tooltip
        visible: false
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.right
        text: container.label
        width: 125
    }

    Rectangle {
        id: separator

        visible: showSeparator

        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right

        color: _colors.uTransparent

        height: 4

        Rectangle {
            id: darkLine

            height: 1

            anchors.top: parent.top

            anchors.left: parent.left
            anchors.leftMargin: 3

            anchors.right: parent.right
            anchors.rightMargin: 3

            color: _colors.uBlack
            opacity: 0.4

        }

        Rectangle {
            id: ligthLine

            height: 1

            anchors.top: darkLine.bottom

            anchors.left: parent.left
            anchors.leftMargin: 3

            anchors.right: parent.right
            anchors.rightMargin: 3

            color: _colors.uWhite
            opacity: 0.1

        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onHoveredChanged: {
            tooltip.visible = (containsMouse)
        }

        onClicked: {
            main.resetBreadcrumb()
            main.swap(path, container.label, model)
        }
    }
}
