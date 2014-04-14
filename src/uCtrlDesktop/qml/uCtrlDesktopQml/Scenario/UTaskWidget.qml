import QtQuick 2.0
import ConditionEnums 1.0
import "../UI" as UI
import "../UI/ULabel" as ULabel

Item {
    property var taskModel: taskList.model.getTaskAt(index)
    property bool isEditMode: false
    property bool showButtons: true
    property bool isAddingCondition: false

    function canMoveUp() {
        return !(index === 0 || index === taskList.count - 1)
    }
    function canMoveDown() {
        return !(index === taskList.count - 1 || index === taskList.count - 2)
    }

    property var cancelEditTaskFunc: function(){}

    property bool isOtherwiseTask : false

    Component.onCompleted: {
        isOtherwiseTask = (index == taskList.count - 1)
        stateLabelWhen.text = (isOtherwiseTask ? "otherwise" : "when:")
    }

    Component.onDestruction: {
        conditionList.cancelEditConditions()
    }

    function cancelEditTask() {
        cancelEditTaskFunc()
    }

    id: taskWidget

    width: parent.width
    height: 70 + conditionsContainer.adjustedHeight() + addTaskComboBox.height

    Rectangle {
        id: scenarioFrame

        x:0
        y:0

        width: parent.width
        height: parent.height -1

        Rectangle {
            id: taskHeader
            z:1

            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: 10

            width: parent.width - anchors.leftMargin
            height: 40

            ULabel.Default {
                id: changeStateLabel
                text: qsTr("Set to")
                anchors.verticalCenter: parent.verticalCenter
                font.pointSize: 14
                color: _colors.uDarkGrey
            }

            Rectangle {
                id: stateContainer
                color: _colors.uTransparent

                anchors.verticalCenter: parent.verticalCenter
                anchors.left: changeStateLabel.right
                anchors.leftMargin: 5

                width: statusTaskLoader.width + 5
                height: statusTaskLoader.height

                radius: 10

                property string tmpValue: taskModel.status

                Loader {
                    id: statusTaskLoader
                    sourceComponent: getSourceComponent()

                    function getSourceComponent() {
                        if (!isEditMode)
                            return statusLabelContainer

                        if (taskModel.scenario.device.isTriggerValue) {
                            return statusSwitch
                        }

                        return statusTextBox
                    }
                }

                Component {
                    id: statusLabelContainer

                    ULabel.UInfoBoundedLabel {
                        id: statusLabel
                        height: changeStateLabel.height

                        text: taskModel.status + " " + taskModel.scenario.device.unitLabel
                    }
                }

                Component {
                    id: statusSwitch

                    UI.USwitch
                    {
                        anchors.centerIn: parent
                        state: taskModel.status

                        onStateChanged: {
                            stateContainer.tmpValue = state
                        }
                    }
                }

                // TODO: Validate stuff with min max values + format with precision??
                Component {
                    id: statusTextBox

                    UI.UTextbox {
                        width: 100
                        text: taskModel.status

                        onTextChanged: {
                            stateContainer.tmpValue = text
                        }
                    }
                }
            }

            ULabel.Default {
                id: stateLabelWhen

                anchors.verticalCenter: parent.verticalCenter
                anchors.left: stateContainer.right

                font.pointSize: 14
                color: _colors.uDarkGrey
            }

            Loader {
                anchors.verticalCenter: changeStateLabel.verticalCenter
                anchors.right: parent.right
                sourceComponent: getSourceComponent()

                function getSourceComponent() {
                    if (showButtons && !isEditMode)
                        return taskButtons

                    if (isEditMode)
                        return taskEditButtons

                    return emptyTaskButtonsComponent
                }
            }

            Component {
                id: emptyTaskButtonsComponent

            Rectangle {
                    width:0
                    height:0
                }
            }

            Component {
                id: taskEditButtons

                UI.USaveCancel {
                    height: changeStateLabel.height
                    width: height*2.5

                    onSave: saveTask()
                    onCancel: cancelEditTask()

                    function saveTask() {
                        taskModel.status = stateContainer.tmpValue
                        isEditMode = false

                        conditionList.saveConditions()
                    }


                    Component.onCompleted: {
                        cancelEditTaskFunc = cancelEditTask
                    }

                    function cancelEditTask() {
                        if(!isEditMode)
                            return

                        stateContainer.tmpValue = taskModel.status
                        isEditMode = false

                        conditionList.cancelEditConditions()
                        isAddingCondition = false
                    }
                }
            }

            Component {
                id: taskButtons
                Rectangle {
                    anchors.fill: parent

                    UI.UButton {
                        id: editTaskButton

                        buttonColor: _colors.uTransparent
                        buttonHoveredColor: _colors.uMediumLightGrey
                        buttonTextColor : _colors.uBlack

                        anchors.verticalCenter: parent.verticalCenter

                        iconId: "Pencil"
                        iconSize: 12

                        width: 20
                        height: 20

                        anchors.right: moveUp.left
                        anchors.rightMargin: 10

                        onClicked: {
                            isEditMode = true
                        }
                    }

                    UI.UButton {
                        id: moveUp

                        buttonColor: _colors.uTransparent
                        buttonHoveredColor: _colors.uMediumLightGrey
                        buttonTextColor : _colors.uBlack
                        buttonDisabledColor: _colors.uTransparent
                        buttonDisabledTextColor: _colors.uMediumLightGrey

                        anchors.verticalCenter: parent.verticalCenter

                        iconId: "Upload"
                        iconSize: 12

                        state: isOtherwiseTask ? "DISABLED" : "ENABLED"

                        width: 20
                        height: 20

                        anchors.right: moveDown.left
                        anchors.rightMargin: 10

                        onClicked: {
                            if(!canMoveUp())
                                return

                            var pScenario = taskModel.scenario
                            pScenario.moveTask(index, index - 1)
                        }
                    }


                    UI.UButton {
                        id: moveDown

                        buttonColor: _colors.uTransparent
                        buttonHoveredColor: _colors.uMediumLightGrey
                        buttonTextColor : _colors.uBlack
                        buttonDisabledColor: _colors.uTransparent
                        buttonDisabledTextColor: _colors.uMediumLightGrey

                        anchors.verticalCenter: parent.verticalCenter

                        iconId: "Download"
                        iconSize: 12

                        state: isOtherwiseTask ? "DISABLED" : "ENABLED"

                        width: 20
                        height: 20

                        anchors.right: deleteBtn.left
                        anchors.rightMargin: 10

                        onClicked: {
                            if(!canMoveDown())
                                return

                            var pScenario = taskModel.scenario
                            pScenario.moveTask(index, index + 1)
                        }
                    }

                    UI.UButton {
                        id: deleteBtn

                        buttonColor: _colors.uTransparent
                        buttonHoveredColor: _colors.uMediumLightGrey
                        buttonTextColor : _colors.uBlack
                        buttonDisabledColor: _colors.uTransparent
                        buttonDisabledTextColor: _colors.uMediumLightGrey

                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right

                        iconId: "Remove"
                        iconSize: 12

                        width: 20
                        height: 20

                        state: isOtherwiseTask ? "DISABLED" : "ENABLED"

                        onClicked: {
                            var pScenario = taskModel.scenario
                            pScenario.deleteTaskAt(index)
                        }
                    }
                }
            }

            Component {
                id: taskSaveButtons

                UI.USaveCancel {
                    height: changeStateLabel.height

                    onSave: saveTask()
                    onCancel: cancelEditTask()

                    function saveTask() {
                        taskModel.status = stateContainer.tmpValue
                        isEditMode = false

                        conditionList.saveConditions()
                    }


                    Component.onCompleted: {
                        cancelEditTaskFunc = cancelEditTask
                    }

                    function cancelEditTask() {
                        if(!isEditMode)
                            return

                        stateContainer.tmpValue = taskModel.status
                        isEditMode = false

                        conditionList.cancelEditConditions()
                        isAddingCondition = false
                    }
                }
            }
        }

        Rectangle {
            z:2

            id: conditionsContainer
            height: 40 * conditionList.count
            width: parent.width

            x:0
            y: taskHeader.height

            color: _colors.uTransparent

            function adjustedHeight(){
                return visible? height: 0
            }

            ListView {
                id: conditionList
                anchors.fill: parent
                model: taskModel
                spacing:5
                interactive:false

                property var newConditions: []

                delegate: UTaskConditionWidget {
                    z: 100000 - index
                    isEditMode: taskWidget.isEditMode

                    Component.onCompleted: {
                        conditionModel.conditionParent = taskModel
                    }
                }

                function saveConditions() {
                    for(var i = 0; i < taskModel.conditionCount(); i++) {
                        conditionList.currentIndex = i
                        conditionList.currentItem.saveCondition()
                    }

                    newConditions = []
                }

                function cancelEditConditions() {
                    var count = taskModel.conditionCount()

                    for(var i = count - 1; i >= 0 ; i--) {
                        conditionList.currentIndex = i

                        if (newConditions.indexOf(conditionList.model.getConditionAt(i)) !== -1) {
                            taskModel.deleteConditionAt(i)
                            continue
                        }

                        conditionList.currentItem.cancelEditCondition()
                    }
                }
            }
        }

        Rectangle {
            z:1
            id: addTaskComboBox

            anchors.top: conditionsContainer.bottom
            anchors.left: conditionsContainer.left
            anchors.leftMargin: 30

            width: conditionsContainer.width
            height: isAddingCondition ? 30 : 0

            visible: isAddingCondition && isEditMode

            UI.UComboBox {
                height: parent.height

                itemListModel: [
                    { value:"",         displayedValue:"Select condition type", iconId:"" },
                    { value:"Date",     displayedValue:"Date",                  iconId:"Calendar"},
                    { value:"Time",     displayedValue:"Time",                  iconId:"Time"},
                    { value:"Weekdays", displayedValue:"Week Days",             iconId:"CalendarEmpty"}
                ]

                selectedItem: { "value":"", "displayedValue":"Select condition type", "iconId":"" }

                onSelectValue: {
                    if (newValue === "")
                        return

                    createCondition(newValue)
                    selectItem(0)
                }

                function createCondition(newValue) {
                    var newCondition

                    switch(newValue) {
                    case "Time":
                        newCondition = taskModel.createCondition(UEConditionType.Time)
                        break
                    case "Date":
                        newCondition = taskModel.createCondition(UEConditionType.Date)
                        break
                    case "Weekdays":
                        newCondition = taskModel.createCondition(UEConditionType.Day)
                        break
                    default:
                        return
                    }

                    taskModel.addCondition(newCondition)
                    conditionList.newConditions.push(newCondition)
                    isAddingCondition = false
                }
            }
        }

        Rectangle {
            anchors.top: conditionsContainer.bottom
            anchors.left: conditionsContainer.left
            anchors.leftMargin: 27

            width: conditionsContainer.width
            height: 30

            visible: !isAddingCondition && isEditMode && !(index == taskList.count - 1)

            UI.UButton {
                anchors.topMargin: 5
                anchors.bottomMargin: 5

                width: 125
                height: 20

                iconId: "PlusSign"
                iconSize: 16

                buttonColor: _colors.uWhite
                buttonTextColor: _colors.uGreen
                buttonHoveredColor: _colors.uMediumLightGrey

                text: "Add condition"

                onClicked: {
                    isAddingCondition = true
                }
            }
        }
    }
}
