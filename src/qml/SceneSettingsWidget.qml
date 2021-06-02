import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15

Item
{
    id: sceneSettingsWidget
    width: 174
    height: 276

    property string caption: "Scene settings"
    property string choosenImageFile: project.property("backgroundImageFile") === "" ? "" : settingsManager.workDirectory() + "/" + project.property("backgroundImageFile")

    Rectangle
    {
        id: rectangle
        anchors.fill: parent
        radius: 2
        color: "#444444"

        MouseArea
        {
            id: mouseArea
            height: 28
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right

            drag.target: sceneSettingsWidget
            drag.axis: Drag.XandYAxis

            drag.minimumX: applicationWindow.childWidgetsArea().x
            drag.maximumX: applicationWindow.childWidgetsArea().width - sceneSettingsWidget.width
            drag.minimumY: applicationWindow.childWidgetsArea().y
            drag.maximumY: applicationWindow.childWidgetsArea().height - sceneSettingsWidget.height
        }

        Text
        {
            color: "#ffffff"
            text: sceneSettingsWidget.caption
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideMiddle
            anchors.left: parent.left
            anchors.right: parent.right
            font.family: "Roboto"
            topPadding: 8
        }

        Button
        {
            id: closeButton
            width: 25
            height: 25
            anchors.top: parent.top
            anchors.topMargin: 3
            anchors.right: parent.right

            bottomPadding: 0
            topPadding: 0
            rightPadding: 0
            leftPadding: 0

            background: Rectangle {
                    color: "#444444"
                    opacity: 0
                }

            Image
            {
                source: "qrc:/utilityCloseButton"
            }

            onClicked:
            {
                applicationWindow.isPatchEditorOpened = false
                patchScreen.deviceLibWidget.setActive(true)
                patchScreen.deviceListWidget.setActive(true)
                patchScreen.groupListWidget.setActive(true)
                sceneSettingsWidget.destroy()
            }
        }

        Rectangle
        {
            id: workArea1

            height: 70
            anchors.topMargin: 28
            anchors.leftMargin: 8
            anchors.rightMargin: 8

            anchors
            {
                top: parent.top
                left: parent.left
                right: parent.right
            }

            radius: 2
            color: "#222222"

            Text
            {
                x: 7
                y: 5
                width: 70
                height: 17
                color: widthField.isActiveInput ? "#27AE60" : "#ffffff"
                text: qsTr("Scene frame")
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideMiddle
                font.family: "Roboto"
            }

            TextField
            {
                id: widthField
                x: 8
                y: 43
                width: 50
                height: 18
                text: project.property("sceneFrameWidth")
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                padding: 0
                leftPadding: -2
                font.pointSize: 8

                //                property bool isActiveInput: true
                //                property string lastSelectedText

                //                validator: RegExpValidator { regExp: /[0-9]+/ }
                //                maximumLength: 2

                background: Rectangle
                {
                    color: "#000000"
                    radius: 2
                }

                onFocusChanged:
                {

                }
            }

            TextField {
                id: heightField
                x: 86
                y: 43
                width: 50
                height: 18
                color: "#ffffff"
                text: project.property("sceneFrameHeight")
                horizontalAlignment: Text.AlignHCenter
                leftPadding: -2
                font.pointSize: 8
                background: Rectangle {
                    color: "#000000"
                    radius: 2
                }
                padding: 0
            }

            Text {
                id: quantityText1
                x: 0
                y: 27
                width: 44
                height: 17
                color: widthField.isActiveInput ? "#27AE60" : "#ffffff"
                text: qsTr("Width")
                elide: Text.ElideMiddle
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "Roboto"
                font.pixelSize: 10
            }

            Text {
                id: quantityText2
                x: 85
                y: 27
                width: 34
                height: 17
                color: widthField.isActiveInput ? "#27AE60" : "#ffffff"
                text: qsTr("Height")
                elide: Text.ElideMiddle
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "Roboto"
                font.pixelSize: 10
            }

            Text {
                id: quantityText3
                x: 56
                y: 44
                width: 20
                height: 17
                color: widthField.isActiveInput ? "#27AE60" : "#ffffff"
                text: qsTr("m")
                elide: Text.ElideMiddle
                font.pixelSize: 10
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "Roboto"
            }

            Text {
                id: quantityText4
                x: 135
                y: 44
                width: 20
                height: 17
                color: widthField.isActiveInput ? "#27AE60" : "#ffffff"
                text: qsTr("m")
                elide: Text.ElideMiddle
                font.pixelSize: 10
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "Roboto"
            }
        }

        Rectangle
        {
            id: workArea2

            anchors.margins: 8
            anchors
            {
                top: workArea1.bottom
                left: parent.left
                right: parent.right
                bottom: setButton.top
            }

            radius: 2
            color: "#222222"

            Text
            {
                x: 7
                y: 5
                width: 70
                height: 17
                color: widthField.isActiveInput ? "#27AE60" : "#ffffff"
                text: qsTr("Image")
                horizontalAlignment: Text.AlignHRight
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideMiddle
                font.family: "Roboto"
            }

            Rectangle
            {
                width: 140
                height: 90
                x: 9
                y: 30

                radius: 2
                color: "#000000"

                Image
                {
                    id: placeholderImage
                    x: (parent.width - width) / 2
                    y: 20
                    source: "qrc:/imagePlaceholder"
                }


                Text {
                    id: buttonText
                    anchors.topMargin: 56
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter

                    color: "#888888"
                    text: qsTr("Click on the area\nto load the image")
                    elide: Text.ElideMiddle
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Roboto"
                    font.pixelSize: 10
                }

                Image
                {
                    id: previewImage
                    anchors.fill: parent
                    source: sceneSettingsWidget.choosenImageFile === "" ? "" : "file:///" + sceneSettingsWidget.choosenImageFile
                }

                MouseArea
                {
                    anchors.fill: parent

                    onClicked:
                    {
//                        fileDialog.open()
                        sceneSettingsWidget.choosenImageFile = project.selectBackgroundImageDialog();
                    }
                }
            }
        }

        MfxButton
        {
            id: setButton

            color: "#2F80ED"
            anchors.margins: 8
            anchors
            {
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }

            enabled: Number(widthField.text) > 0 && Number(heightField.text) > 0

            text: qsTr("Apply")

            onClicked:
            {
                project.setProperty("sceneFrameWidth", Number(widthField.text) - Number(widthField.text) * 0.1)
                project.setProperty("sceneFrameHeight", Number(heightField.text) - Number(widthField.text) * 0.1)
                if(project.property("sceneImageWidth") === 0 || !project.property("sceneImageWidth"))
                {
                    project.setProperty("sceneImageWidth", Number(widthField.text))
                }

                if(sceneSettingsWidget.choosenImageFile !== "")
                {
                    project.setBackgroundImage(sceneSettingsWidget.choosenImageFile)
                    sceneWidget.backgroundImage.source = "file:///" + settingsManager.workDirectory() + "/" + project.property("backgroundImageFile")
                }
                sceneFrameItem.restorePreviousGeometry()
                sceneFrameItem.visible = true
                applicationWindow.isPatchEditorOpened = false
                sceneSettingsWidget.destroy();
            }
        }

    }

    Component.onCompleted:
    {
        applicationWindow.isPatchEditorOpened = true
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:2}D{i:17}
}
##^##*/
