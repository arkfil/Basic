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





        Flickable {
            id: flickable
            flickableDirection: Flickable.HorizontalAndVerticalFlick
            anchors.right: parent.right
            anchors.rightMargin: 8
            anchors.left: parent.left
            anchors.leftMargin: 293
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
            onExposeNote: MyScripts.showNote(noteTitle, noteContents)
            onLoadInToTheMenu: MyScripts.showNoteInTheMenu(noteTitle,noteContents,noteId)


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

            //onClicked: manager.saveNote(noteTitleTextField.text,textNote.text,-1)
            onClicked: MyScripts.saveNote(noteTitleTextField.text,textNote.text,takiseListwiev.currentIndex)


            hoverEnabled: true
            ToolTip.delay: 1
            ToolTip.visible: hovered
            ToolTip.text: qsTr("Save note")
        }

        Button {
            id: deleteButton
            onClicked: MyScripts.removeNote(takiseListwiev.currentIndex)
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
                Component.onCompleted: manager.readNotesToMemory();

                //anchors.fill: parent
                anchors.top: addNote.bottom
                anchors.topMargin: 3
                anchors.right: parent.right
                anchors.left: parent.left
                anchors.bottom: parent.bottom


                id:takiseListwiev
                highlight: Rectangle { color: "lightsteelblue"; radius: 5; anchors.left:parent.left; anchors.leftMargin: 6 }
                highlightMoveVelocity:2900
              //  highlightRangeMode: ListView.ApplyRange
                highlightRangeMode: ListView.NoHighlightRange
                highlightFollowsCurrentItem: true
                focus: true
                spacing :3
                //snapMode: ListView.SnapToItem
                model: ListModel{ id: flickableMenuArea }
                delegate: MenuItemLayout{}
            }

// --------------------------------------------TO ADD NEW NOTE -------------------------------------------------------//
                        Rectangle{
                            id: addNote
                            height: 74
                            visible: true
                            anchors.right: parent.right
                            anchors.rightMargin: 6
                            anchors.left: parent.left
                            anchors.leftMargin: 6
//                            Rectangle{
//                                id: addNoteBackground
//                                anchors.fill:parent
                                color: "#6c98dc"
                                radius: 3
                                border.width: 1
                          //      opacity: 1
 //                           }

                            Label{
                                id: addNoteLabel
                                height: 26
                                text: "Add new note"
                                horizontalAlignment: Text.AlignLeft
                                wrapMode: Text.NoWrap
                                anchors.right: parent.right
                                anchors.rightMargin: 66
                                anchors.left: parent.left
                                anchors.leftMargin: 66
                                anchors.top: parent.top
                                anchors.topMargin:24
                                font.pointSize: 15
                                color: "#ffffff"
                                visible: true
                            }

                            MouseArea{
                                anchors.fill: parent
                                hoverEnabled: true
                                onHoveredChanged: addNoteLabelTip.visible=true, cursorShape = Qt.PointingHandCursor
                                onExited: addNoteLabelTip.visible=false

                                ToolTip{
                                    id: addNoteLabelTip
                                    delay: 1
                                    visible: false
                                    text: qsTr("Click to add new note")
                                }
                                //onClicked: manager.readNote(noteId), takiseListwiev.currentIndex = index
                                onClicked: takiseListwiev.currentIndex=-1,addNote.color="#97bffc", noteTitleTextField.text="", textNote.text=""


                            }
                        }

// ----------------------------------------------TO ADD NEW NOTE ----------------------------------------------------//






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
        }
       // ------------------------------------------------------- MENU AREA END ---------------------------------------------------------------------
    }
}
