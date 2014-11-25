import QtQuick 2.0

import "../../ui" as UI
import "../../label" as ULabel
import "../../ui/UColors.js" as Colors

import jbQuick.Charts 1.0
import "../../jbQuick/Charts/QChartGallery.js" as ChartsData

Rectangle {
    id: container

    property var model: null

    color: Colors.uTransparent
    anchors.fill: parent

    Rectangle {
        id: updateContainer

        color: Colors.uTransparent

        anchors.left: container.left
        anchors.right: container.right

        anchors.top: container.top
        height: 35

        UI.UFontAwesome {
            id: updateIcon

            iconId: "earth"
            iconSize: 12
            iconColor: Colors.uGrey

            anchors.left: updateContainer.left
            anchors.leftMargin: 10
            anchors.verticalCenter: updateContainer.verticalCenter
        }

        ULabel.Default {
            id: updateLabel

            text: "Last detection : " + getLastUpdatedText()

            font.bold: false
            font.pixelSize: 11

            color: Colors.uGrey

            anchors.left: updateIcon.right
            anchors.leftMargin: 15

            anchors.verticalCenter: updateContainer.verticalCenter
        }
    }

    Rectangle {
        id: graphContainer

        color: Colors.uTransparent

        anchors.left: container.left
        anchors.right: container.right

        anchors.top: updateContainer.bottom
        anchors.bottom: container.bottom

        Rectangle {
            id: graphHeader

            color: Colors.uTransparent

            anchors.left: graphContainer.left
            anchors.right: graphContainer.right
            anchors.top: graphContainer.top

            height: 25

            UI.UFontAwesome {
                id: statsIcon
                iconId: "stats"
                iconSize: 12
                iconColor: Colors.uGrey
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
            }

            ULabel.Default {
                id: statsText
                text: "Statistics"
                anchors.left: statsIcon.right
                anchors.leftMargin: 15
                color: Colors.uGrey
                anchors.verticalCenter: parent.verticalCenter
                font.bold: false
                font.pixelSize: 11
            }

            UI.UCombobox {
                id: periodCombo

                property var periods: [
                    { value: "today",     displayedValue: "Today", iconId: ""},
                    { value: "week",   displayedValue: "This week", iconId: ""},
                    { value: "month",   displayedValue: "This month", iconId: ""},
               ]

                itemListModel: periods

                anchors.right: parent.right

                itemColor: Colors.uTransparent
                itemTextColor: Colors.uGreen

                dropdownColor: Colors.uGreen
                dropdownTextColor: Colors.uWhite

                selectedItemColor: Colors.uDarkGreen
                selectedItemTextColor: Colors.uWhite
                selectedItemHoverColor: Colors.uWhite
                selectedItemHoverTextColor: Colors.uGreen

                hoverColor: Colors.uDarkGreen
                hoverTextColor: Colors.uWhite

                height: parent.height;
                width: 150

                Component.onCompleted: selectItem(0)

                z: 3
            }
        }

        Rectangle {
            id: graph

            color: Colors.uTransparent

            anchors.left: graphContainer.left
            anchors.right: graphContainer.right
            anchors.top: graphHeader.bottom
            anchors.bottom: carouselContainer.top

            clip: true

            UI.UChart {
                id: stateChart
                chartAnimated: false
                chartName: "Number of detection"
                chartData: {
                               "labels": ["06:10am","07:10am","08:10am","09:10am","10:10am","11:10am","12:10am"],
                               "axisY": [0, 25, 50, 75, 100],
                               "datasets": [{
                                   fillColor: Colors.uGreen,
                                   strokeColor: Colors.uDarkGreen,
                                   pointColor: Colors.uGreen,
                                   pointStrokeColor: Colors.uGreen,
                                   data: [0, 55, 15, 75, 100, 0, 50],
                               }]
                           }
                width: graph.width
                height: graph.height
                chartType: Charts.ChartType.BAR
            }

            UI.UChart {
                id: powerChart
                chartAnimated: false
                chartName: "Power consumption"
                chartData: {
                               "labels": ["06:10am","07:10am","08:10am","09:10am","10:10am","11:10am","12:10am"],
                               "axisY": [0, 25, 50, 75, 100],
                               "datasets": [{
                                   fillColor: "rgba(237,237,237,0.5)",
                                   strokeColor: Colors.uMediumLightGrey,
                                   pointColor: Colors.uGreen,
                                   pointStrokeColor: Colors.uGreen,
                                   data: [0, 15, 20, 23, 25, 60, 67]
                               }]
                           }
                width: graph.width
                height: graph.height
                chartType: Charts.ChartType.LINE
            }
        }

        Rectangle {
            id: carouselContainer
            width: parent.width
            height: 30
            anchors.bottom: parent.bottom

            UI.UCarousel {
                carouselItems:  [stateChart, powerChart]
                carouselIcons: ["info", "lightning"]
                onChangeItem: {
                    statsText.text = "Statistics : " + item.chartName
                }
            }
        }
    }

    function getLastUpdatedText() {
        if (model !== null && model.lastUpdate !== undefined) return model.lastUpdate
        else return " A second ago."
    }
}