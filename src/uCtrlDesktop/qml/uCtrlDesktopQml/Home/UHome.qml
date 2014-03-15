import QtQuick 2.0
import "../UI" as UI

UI.UFrame {
    anchors.horizontalCenter: parent.horizontalCenter

    Text {
        text: "Homepage"
        color: colors.uGreen
    }

    Component.onCompleted: {
        visible: true
    }
}
