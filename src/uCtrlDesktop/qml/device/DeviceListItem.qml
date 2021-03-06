import QtQuick 2.0

import "../ui" as UI
import "../label" as ULabel
import "../ui/UColors.js" as Colors

import DeviceEnums 1.0

Rectangle {
    id: listItem

    property variant item: null

    width: parent.width
    height: 50

    color: getColor()

    Rectangle {
        id: iconFrame

        width: 40
        height: 40
        radius: 4

        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.verticalCenter: parent.verticalCenter

        color: getStatusColor()

        DeviceIcon
        {
            deviceType: listItem.item === null ? 0 : listItem.item.type

            iconSize: 18
            iconColor: Colors.uWhite
        }
    }

    UI.UFontAwesome {
        id: itemChevron

        width: 30

        anchors.right: parent.right
        anchors.rightMargin: 5

        anchors.verticalCenter: parent.verticalCenter

        iconId: "ChevronRight"
        iconSize: 22
        iconColor: Colors.uMediumLightGrey
    }

    Rectangle
    {
        anchors.left: iconFrame.right
        anchors.leftMargin: 10

        anchors.right: itemChevron.left
        anchors.rightMargin: 10

        height: parent.height
        color: Colors.uTransparent

        Loader
        {
            anchors.fill: parent
            sourceComponent: getDescription() === "" ? nameOnly : nameAndDescription
        }
    }

    Component
    {
        id: nameAndDescription

        Rectangle
        {
            anchors.fill: parent
            color: Colors.uTransparent
            ULabel.Description {
                text: getName()

                color: Colors.uBlack

                font.bold: true
                font.pointSize: 16

                anchors.top: parent.top
                anchors.topMargin: 5
                width: parent.width
            }

            ULabel.Description {
                text: getDescription()

                color: Colors.uGrey

                font.pointSize: 11
                font.italic: true

                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5

                width: parent.width
            }
        }
    }

    Component
    {
        id: nameOnly
        Rectangle
        {
            anchors.fill: parent
            color: Colors.uTransparent
            ULabel.Description {
                text: getName()

                color: Colors.uBlack

                font.bold: true
                font.pointSize: 18

                anchors.verticalCenter: parent.verticalCenter
                width: parent.width
            }
        }
    }

    Rectangle {
        width: parent.width
        height: 1

        color: Colors.uMediumLightGrey

        anchors.bottom: parent.bottom
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent
        hoverEnabled: true
    }

    function getColor() {
        if (mouseArea.containsMouse) return Colors.uLightGrey
        else return Colors.uWhite
    }

    function getName() {
        if (item != null) return item.name
        else return "Device name"
    }

    function getDescription() {
        if (item != null) return item.description
        else return ""
    }

    function getStatusColor()
    {
        if(item !== null)
        {
            switch(item.status)
            {
            case 0:
                return Colors.uGreen; //OK
            case 1:
                return Colors.uYellow; //Disconnected
            case 2:
                return Colors.uRed; //Warning
            }
        }

        return Colors.uRed
    }
}
