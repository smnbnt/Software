import QtQuick 2.0


Rectangle {
    property string status: "UNKNOWN"
    property int delegateIndex: index

    width: parent.width
    color: "#808080"
    border.color: "black"
    border.width: 2
    height: 40 + conditionListContainer.height

    Rectangle {
        id: taskHeaderContainer
        width: parent.width
        height: 40
        color: "transparent"
        Rectangle {
            id: taskHeader
            width: parent.width - 10
            height: parent.height - 10
            anchors.centerIn: parent
            color: "transparent"

            ULabel {
                id: changeStateLabel
                text: "Changer l'état pour "
                anchors.verticalCenter: parent.verticalCenter
                font.pointSize: 14
                color: "white"
            }

            Rectangle {
                id: stateContainer
                color: "white"

                anchors.verticalCenter: parent.verticalCenter
                anchors.left: changeStateLabel.right

                width: stateLabel.width + 10
                height: parent.height - 10

                ULabel {
                    id: stateLabel
                    text: status
                    anchors.centerIn: parent
                    font.pointSize: 12
                }
            }

            ULabel {
                id: stateLabelWhen
                text: "quand:"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: stateContainer.right
                font.pointSize: 14
                color: "white"
                anchors.leftMargin: 5
            }
        }
    }

    Rectangle {
        id: dragger
        anchors.right: parent.right
        height: parent.height
        width: 40
        color: "transparent"

        Image {
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            height: 30
            width: 30
            source: "qrc:///Resources/Images/drag.png"

        }
    }

    Rectangle {
        id: conditionListContainer
        anchors.top: taskHeaderContainer.bottom
        anchors.left: parent.left
        anchors.right: dragger.left
        color: "transparent"
        height: 40 * conditionList.count

        ListView {
            id: conditionList
            anchors.fill: parent
            model: taskList.model.getTaskAt(delegateIndex)
            spacing:5
            delegate: UTimeConditionWidget {
                conditionHour: 15
                conditionMinute: 00
            }
        }
    }
}

