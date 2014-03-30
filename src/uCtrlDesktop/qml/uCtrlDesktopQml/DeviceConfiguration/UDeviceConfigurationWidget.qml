import QtQuick 2.0
import "../Device" as Device
import "../UI" as UI
import "../Scenario" as Scenario

UI.UFrame {
    property variant device: null
    property ListModel scenarios: null

    requiredModel: true

    function refresh(newDevice) {
        deviceHeader.refresh(newDevice)
        scenarioWidget.refresh(newDevice.getScenario())
        device = newDevice
    }

    contentItem: Rectangle {
        anchors.top: parent.top
        anchors.left: parent.left

        color: _colors.uWhite
        width: 500; height: 300

        Device.UHeader {
            id: deviceHeader

            device: device
        }

        Scenario.UScenarioWidget {
            id: scenarioWidget

            anchors.top: deviceHeader.bottom
            name: "Scenario #1 - Semaine de travail"
        }

        Rectangle {
            id: commandButtons

            width: 500
            height: 40
            anchors.top: scenarioWidget.bottom

            color: _colors.uUltraLightGrey

            UI.UButton {
                id: btnAdd

                objectName: "btn"
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 7
                width: 96; height: 27
                x: 10
                text: qsTr("Add")
                function execute() {
                    var pScenario = device.getScenario()
                    var pTask = pScenario.createTask()
                    pTask.setStatus("Blarg")
                    pScenario.addTask(pTask)

                    pTask = pScenario.getTaskAt(0)
                    pTask.setStatus("WORK LOL")

                }
            }

            UI.UButton {
                id: btnRemove

                objectName: "btn"
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 7
                anchors.left: btnAdd.right
                width: 96; height: 27
                text: qsTr("Delete")

                function execute() {
                    var pScenario = device.getScenario()
                    pScenario.deleteTaskAt(pScenario.taskCount() - 1)
                }

                signal qmlSignal()
            }
        }
    }
}
