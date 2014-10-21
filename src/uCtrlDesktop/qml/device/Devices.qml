import QtQuick 2.0
import "../ui/UColors.js" as Colors

Rectangle {

    id: container

    color: Colors.get("uWhite")

    property variant model: null

    ListView {
        id: devicesList

        anchors.fill: parent

        model: parent.model

        property variant currentItem: null

        delegate: Column {
            id: column

            width: parent.width
            DeviceListItem {

                id: listItem

                item: model

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        main.activeDevice = model
                        main.currentPage = "device/Device"
                    }
                }
            }
        }
    }
}
