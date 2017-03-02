import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0
import "qrc:/scripts.js" as MyScripts

Rectangle{
    id: menuOption


    height: 74
    color: "#444240"
    visible: true
    opacity:0.8
    anchors.right: parent.right
    anchors.rightMargin: 6
    anchors.left: parent.left
    anchors.leftMargin: 6

  //  anchors.top: parent.top

   // anchors.topMargin: 8 + previousNotePosition




    Label{
        id: menuOptionLabel
        text: noteTitleLabel
        wrapMode: Text.WrapAnywhere
        anchors.right: parent.right
        anchors.rightMargin: 140
        anchors.left: parent.left
        anchors.leftMargin: 8
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 33
        anchors.top: parent.top
        anchors.topMargin:0
        font.pointSize: 13
        color: "#ffffff"
        visible: true
    }
    function getMenuOptionLabel(){
        return menuOptionLabel.text;
    }


    MouseArea{
        anchors.fill: parent
        hoverEnabled: true

        onHoveredChanged: menuOptionTip.visible=true, cursorShape = Qt.PointingHandCursor


        onExited: menuOptionTip.visible=false

        ToolTip{
            id: menuOptionTip

            delay: 1
            visible: false
            text: qsTr("Click to select this note")

        }

        onClicked: MyScripts.clickNote(index), takiseListwiev.currentIndex = index, noteTitleTextField.text=menuOptionLabel.text

    }






}
