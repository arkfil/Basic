import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0
import "qrc:/scripts.js" as MyScripts

Window {
    visible: true
    width: 960
    height: 540
    minimumHeight: 216
    minimumWidth: 900
    title: qsTr("Notebook")

    Rectangle {
        anchors.fill: parent
        id: insideWindow
        objectName: "insideWindow"
        width: 360
        height: 360
        color: "#2d2e32"
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        border.color: "black"

    Flickable {
        id: flickable
        flickableDirection: Flickable.HorizontalAndVerticalFlick
        anchors.right: parent.right
        anchors.rightMargin: 8
        anchors.left: parent.left
        anchors.leftMargin: 277
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        anchors.top: parent.top
        anchors.topMargin: 80


             TextArea.flickable: TextArea{

                id: textNote
                objectName: "textNote"
                text: qsTr("Contents")
                height:1000
               // wrapMode: TextArea.WrapAtWordBoundaryOrAnywhere
                wrapMode: TextArea.NoWrap
                textFormat: TextArea.RichText
                anchors.rightMargin: 8
                anchors.leftMargin: 277
                anchors.bottomMargin: 8
                anchors.topMargin: 80
                clip: false
                visible: true
                color:"white"
                opacity: 1
                selectByKeyboard: true
                selectByMouse: true
                background: Rectangle{
                                width: textNote.width
                                height: textNote.height
                                color:"#2d2e32"
                                border.color: "gray"
                }



            }
            ScrollBar.vertical: ScrollBar { }
            ScrollBar.horizontal: ScrollBar { }
    }

        Connections {
            target: manager
            onIncreaseOne: confirmations.text=ms
            onPushNote: MyScripts.loadAnotherNote(noteTitle,noteContents,noteId)
        }





        Button {
            id: saveButton
            x: 698
            objectName:"saveButton"
            y: 8
            width: 126
            height: 66
            text: "Save"
            anchors.right: deleteButton.left
            anchors.rightMargin: 6
            visible: true
            property var tempIdk: 0;
            onClicked: tempIdk = manager.saveNote("lol","lol2",-1)

                hoverEnabled: true
                ToolTip.delay: 1
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Save note")

        }

        Button {
            id: deleteButton
            onClicked:MyScripts.removeNote(takiseListwiev.currentIndex)
            x: 830
            y: 8
            width: 122
            height: 66
            text: "Delete"
            anchors.right: parent.right
            anchors.rightMargin: 8
            objectName: "deleteButton"
            visible: true


                hoverEnabled: true
                ToolTip.delay: 1
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Delete note")
        }

       TextField {
            id: noteTitleTextField
            y: 8
            height: 66
            objectName: "noteTitle"
            color: "white"
            text: qsTr("Title")
            font.pointSize: 22
            anchors.left: menuArea.right
            anchors.leftMargin: 6
            anchors.right: saveButton.left
            anchors.rightMargin: 6
            anchors.bottom: flickable.top
            anchors.bottomMargin: 6
            clip: true
            maximumLength: 33


            selectByMouse: true

            background: Rectangle{
                            width: noteTitleTextField.width
                            height: noteTitleTextField.height
                            color:"#2d2e32"
                            border.color: "gray"
            }
        }

// ------------------------------------------------------- MENU AREA ---------------------------------------------------------------------



       Rectangle{

           height: 907
           anchors.right: flickable.left
           anchors.rightMargin: 6
           anchors.left: parent.left
           anchors.leftMargin: 8
           anchors.bottom: parent.bottom
           anchors.bottomMargin: 8
           anchors.top: parent.top
           anchors.topMargin: 8
           id:menuArea
           color: "#262627"

            visible: true
            objectName:"menuArea"

            opacity: 0.9



            ListView{
                    anchors.fill: parent
                    id:takiseListwiev
                    onFocusChanged: MyScripts.clickNote(currentIndex-1)/*,textNote.text=MenuItemLayout.getMenuOptionLabel()*/
                    highlight: Rectangle { color: "lightsteelblue"; radius: 5; anchors.left:parent.left; anchors.leftMargin: 6 }
                    highlightMoveVelocity:9000000
                    highlightRangeMode: ListView.ApplyRange
                    focus: true
                    spacing :8
                    snapMode: ListView.SnapToItem

                    model: ListModel{

                        id: flickableMenuArea

                    }

                    delegate: MenuItemLayout{}
            }



            Label {
                id: confirmations
                y: 496
                height: 20
                text: qsTr("Successful")
                color: "white"
                anchors.right: parent.right
                anchors.rightMargin: 12
                anchors.left: parent.left
                anchors.leftMargin: 12
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 8
                font.bold: true
                font.pointSize: 12
                horizontalAlignment: Text.AlignHCenter


            }

            Button {
                property int number : 1+(90000*Math.random())
                id: addNoteTest
                x: 167
                y: 443
                text: qsTr("addNoteTest")
                //onClicked: MyScripts.loadAnotherNote(noteTitleTextField.text,"placeholder",number)
                onClicked: manager.readNote(saveButton.tempIdk)
            }








         }





// ------------------------------------------------------- MENU AREA ---------------------------------------------------------------------










        }


}



