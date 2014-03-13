import QtQuick 2.0
import "../Device" as Device
import "../UI" as UI
import "../Scenario" as Scenario

UI.UFrame {
    property variant device: null
    property ListModel scenarios: null

    function refresh(newDevice) {
        deviceHeader.refresh(newDevice)
        scenarioWidget.refresh(newDevice.getScenario())
    }

    Device.UHeader {
        id: deviceHeader
        device: device
    }

    Scenario.UScenarioWidget {
        id: scenarioWidget
        anchors.top: deviceHeader.bottom
        height: parent.height - deviceHeader.height - 80
        name: "Scenario #1 - Semaine de travail"
    }

    Rectangle {
        id: commandButtons
        width: parent.width
        height: 40
        anchors.top: scenarioWidget.bottom

        color: colors.uUltraLightGrey

        UI.UButton {
            id: simplebutton
            objectName: "btn"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 7
            width: 96; height: 27
            x: 10
            labelText: "Ajouter"

            signal qmlSignal()

            MouseArea{
                id: buttonMouseArea

                anchors.fill: parent
                onClicked: simplebutton.qmlSignal()
            }
        }
    }
}