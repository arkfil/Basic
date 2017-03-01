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
                wrapMode: TextArea.WrapAtWordBoundaryOrAnywhere
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

            onClicked: manager.saveNote("lol","lol2",-1)

                hoverEnabled: true
                ToolTip.delay: 1
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Save note")

        }

        Button {
            id: deleteButton
            //onClicked:
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
            id: noteTitle
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

            maximumLength: 33




            selectByMouse: true

            background: Rectangle{
                            width: noteTitle.width
                            height: noteTitle.height
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
//            anchors.right: flickable.left
            visible: true
            objectName:"menuArea"
//            anchors.rightMargin: 6
//            anchors.left: parent.left
//            anchors.leftMargin: 8
//            anchors.bottom: parent.bottom
//            anchors.bottomMargin: 8
//            anchors.top: parent.top
//            anchors.topMargin: 8
            opacity: 0.9



           Flickable {








                        id: flickableMenuArea
                        maximumFlickVelocity: 1555
                        anchors.fill: parent
                        interactive:true
                        contentHeight: menuArea.height
                        contentWidth: menuArea.width

                      //  height: menuArea.height
                     //   width: menuArea.width


                        //boundsBehavior: flickable.StopAtBounds
                       // flickableDirection: Flickable.HorizontalAndVerticalFlick

                       // anchors.bottomMargin: 28
                       // ScrollBar.horizontal: ScrollBar { }




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
                id: addNoteTest
                x: 167
                y: 443
                text: qsTr("addNoteTest")
                onClicked: MyScripts.loadAnotherNote(noteTitle.text,1)
            }








         }





// ------------------------------------------------------- MENU AREA ---------------------------------------------------------------------










        }


}



