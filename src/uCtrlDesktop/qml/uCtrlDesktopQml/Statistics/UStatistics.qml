import QtQuick 2.0
import "../UI" as UI

UI.UFrame {
    id: statsFrame
    name: "Statistics"

    Text {
        text: "Hello World !"
        color: colors.uGreen

        MouseArea {
            anchors.fill: parent
            onClicked: swap()
        }
    }
}

