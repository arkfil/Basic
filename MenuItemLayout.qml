import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0
import "qrc:/scripts.js" as MyScripts


Item{
    id: menuOption
    height: 89
    visible: true
    opacity:0.8
    anchors.right: parent.right
    anchors.rightMargin: 6
    anchors.left: parent.left
    anchors.leftMargin: 6

    Rectangle{
        anchors.fill:parent
        color: "#444240"
        radius: 3
    }

    Label{
        id: menuOptionLabel
        text: noteTitleLabel
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
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
        onClicked: manager.readNote(noteId), takiseListwiev.currentIndex = index, addNote.color="#6c98dc"
    }
}
