


    var menuOption;
    var element;
    var previousNotePosition=-82;
    function loadAnotherNote(noteTitle,noteId){
        menuOption = Qt.createComponent("qrc:/MenuItem.qml");

        element = menuOption.createObject(flickableMenuArea.contentItem,{"x": 100, "y":100});

        element.noteId=noteId;

        //flickableMenuArea.update()

        element.noteTitle = noteTitle;
        previousNotePosition+=82;
        element.previousNotePosition=previousNotePosition;

        if(previousNotePosition>=500){
            menuArea.height+=82;
            flickableMenuArea.contentHeight+=82;
        }

    }

    function removeNote(){

    }


    function clickNote(){
        //parent.color == "#444240" ? parent.color = "#6d6965" : parent.color = "#444240"
    }
