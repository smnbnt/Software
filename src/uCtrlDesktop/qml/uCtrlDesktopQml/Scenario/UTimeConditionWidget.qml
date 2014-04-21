import QtQuick 2.0
import ConditionEnums 1.0
import "../UI" as UI
import "../UI/ULabel" as ULabel

Rectangle {

    property bool isEditMode: false

    id: container

    width: parent ? parent.width - 30 : 0
    height: parent ? parent.height - 5 : 0

    state: UEComparisonType.InBetween.toString()

    property var setWidgetTime
    property var saveWidgetTime

    anchors.left: parent ? parent.left : undefined
    anchors.leftMargin: 30
    anchors.verticalCenter: parent ? parent.verticalCenter : undefined

    color: _colors.uTransparent

    function saveCondition() {
        conditionModel.comparisonType = parseInt(container.state)
        saveWidgetTime()

        updateConditionView()
    }

    function updateConditionView() {
        container.state = conditionModel.comparisonType.toString()
        comboSelect.selectItemByValue(container.state)

        var beginTime = Qt.formatTime(conditionModel.beginTime, "HH:mm")
        var endTime = Qt.formatTime(conditionModel.endTime, "HH:mm")

        setWidgetTime(beginTime, endTime)

        switch(container.state) {
            case UEComparisonType.InBetween.toString():
                timeLabel.text = "Between " + beginTime + " and " + endTime
                break
            case UEComparisonType.LesserThan.toString():
                timeLabel.text = "Before " + beginTime
                break
            case UEComparisonType.GreaterThan.toString():
                timeLabel.text = "After " + beginTime
                break
            case UEComparisonType.Not.toString():
                timeLabel.text = "Not between " + beginTime + " and " + endTime
                break
        }
    }

    Component.onCompleted: {
        updateConditionView()
    }

    UI.UFontAwesome {
        id: timeConditionIcon

        width: 30
        anchors.verticalCenter: parent.verticalCenter

        iconId: "Time"
        iconSize: 16
        iconColor: _colors.uBlack
        anchors.left: parent.left
    }

    Rectangle {
        id: readOnlyContent
        anchors.left: timeConditionIcon.right
        anchors.right: parent.right
        height: parent.height
        visible: !isEditMode

        color: _colors.uTransparent

        ULabel.Default {
            id: timeLabel
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    Rectangle {
        id: editContent

        anchors.left: timeConditionIcon.right
        anchors.right: parent.right
        height: parent.height
        visible: isEditMode

        color: _colors.uTransparent

        UI.UComboBox {
            id: comboSelect
            width: 130
            height: 30
            anchors.verticalCenter: parent.verticalCenter

            itemListModel: [
                { value:UEComparisonType.InBetween.toString(), displayedValue:"Between", iconId:""},
                { value:UEComparisonType.LesserThan.toString(), displayedValue:"Before", iconId:""},
                { value:UEComparisonType.GreaterThan.toString(), displayedValue:"After", iconId:""},
                { value:UEComparisonType.Not.toString(), displayedValue:"Not Between", iconId:""}
            ]

            onSelectValue: {
                container.state = selectedItem.value
            }

            Component.onCompleted: {
                selectItem(0)
            }
        }

        Rectangle {
            id: content
            anchors.left: comboSelect.right
            anchors.leftMargin: 5
            anchors.right: parent.right
            height: parent.height

            color: _colors.uTransparent

            Loader {
                id: contentLoader
                anchors.fill: parent

                sourceComponent: {
                    switch(container.state) {
                    case UEComparisonType.InBetween.toString():
                        return fromContentContainer
                    case UEComparisonType.LesserThan.toString():
                        return beforeContentContainer
                    case UEComparisonType.GreaterThan.toString():
                        return afterContentContainer
                    case UEComparisonType.Not.toString():
                        return notContentContainer
                    }
                }
            }
        }
    }

    Component {
        id: fromContentContainer

        Rectangle {
            id: fromContent
            anchors.fill: parent
            color: _colors.uTransparent
            visible: container.state === UEComparisonType.InBetween.toString()

            function setTimes(beginTime, endTime) {
                fromStartDatePicker.setCurrentValue(beginTime)
                fromEndDatePicker.setCurrentValue(endTime)
            }

            function saveTimes() {
                conditionModel.beginTime = fromStartDatePicker.currentValue
                conditionModel.endTime = fromEndDatePicker.currentValue
            }

            Component.onCompleted: {
                container.setWidgetTime = setTimes
                container.saveWidgetTime = saveTimes

                setTimes(Qt.formatTime(conditionModel.beginTime, "HH:mm"), Qt.formatTime(conditionModel.endTime, "HH:mm"))
            }

            UI.UTimePicker {
                id: fromStartDatePicker
                anchors.verticalCenter: parent.verticalCenter
            }

            ULabel.Default {
                id: fromAndLabel
                text: "and"
                anchors.left: fromStartDatePicker.right
                anchors.leftMargin: 5
                anchors.verticalCenter: parent.verticalCenter
            }

            UI.UTimePicker {
                id: fromEndDatePicker
                anchors.left: fromAndLabel.right
                anchors.leftMargin: 5
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }
    Component {
        id: beforeContentContainer

        Rectangle {
            id: beforeContent
            anchors.fill: parent
            color: _colors.uTransparent
            visible: container.state === UEComparisonType.LesserThan.toString()

            function setTimes(beginTime, endTime) {
                beforeStartDatePicker.setCurrentValue(beginTime)
            }

            function saveTimes() {
                conditionModel.beginTime = beforeStartDatePicker.currentValue
                conditionModel.endTime = "00:00"
            }

            Component.onCompleted: {
                container.setWidgetTime = setTimes
                container.saveWidgetTime = saveTimes

                setTimes(Qt.formatTime(conditionModel.beginTime, "HH:mm"), Qt.formatTime(conditionModel.endTime, "HH:mm"))
            }

            UI.UTimePicker {
                id: beforeStartDatePicker
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }

    Component {
        id: afterContentContainer

        Rectangle {
            id: afterContent
            anchors.fill: parent
            color: _colors.uTransparent
            visible: container.state === UEComparisonType.GreaterThan.toString()

            function setTimes(beginTime, endTime) {
                afterStartDatePicker.setCurrentValue(beginTime)
            }

            function saveTimes() {
                conditionModel.beginTime = afterStartDatePicker.currentValue
                conditionModel.endTime = "00:00"
            }

            Component.onCompleted: {
                container.setWidgetTime = setTimes
                container.saveWidgetTime = saveTimes

                setTimes(Qt.formatTime(conditionModel.beginTime, "HH:mm"), Qt.formatTime(conditionModel.endTime, "HH:mm"))
            }

            UI.UTimePicker {
                id: afterStartDatePicker
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }

    Component {
        id: notContentContainer

        Rectangle {
            id: notContent
            anchors.fill: parent
            color: _colors.uTransparent
            visible: container.state === UEComparisonType.Not.toString()

            function setTimes(beginTime, endTime) {
                notStartDatePicker.setCurrentValue(beginTime)
                notEndDatePicker.setCurrentValue(endTime)
            }

            function saveTimes() {
                conditionModel.beginTime = notStartDatePicker.currentValue
                conditionModel.endTime = notEndDatePicker.currentValue
            }

            Component.onCompleted: {
                container.setWidgetTime = setTimes
                container.saveWidgetTime = saveTimes

                setTimes(Qt.formatTime(conditionModel.beginTime, "HH:mm"), Qt.formatTime(conditionModel.endTime, "HH:mm"))
            }

            UI.UTimePicker {
                id: notStartDatePicker
                anchors.verticalCenter: parent.verticalCenter
            }

            ULabel.Default {
                id: notAndLabel
                text: "and"
                anchors.left: notStartDatePicker.right
                anchors.leftMargin: 5
                anchors.verticalCenter: parent.verticalCenter
            }

            UI.UTimePicker {
                id: notEndDatePicker
                anchors.left: notAndLabel.right
                anchors.leftMargin: 5
                anchors.verticalCenter: parent.verticalCenter

                color: _colors.uWhite
            }
        }
    }

    Component {
        id: emptyEndTime

        Rectangle {
            width: 0
            height: 0
        }
    }
}

