
    var idOfCheckedElement;
    var menuOption;
    var element;
    var previousNotePosition=-82;



    function loadAnotherNote(noteTitle,noteId){

        menuOption = Qt.createComponent("qrc:/MenuItem.qml");

        element = menuOption.createObject(flickableMenuArea.contentItem,{"x": 100, "y":100});


        element.noteId=noteId;
        element.objectName=toString(noteId);

        element.noteTitle = noteTitle;
        previousNotePosition+=82;

        element.previousNotePosition=previousNotePosition;

        if(previousNotePosition>=430){
            flickableMenuArea.contentHeight+=82;
        }

    }

    function removeNote(){

    }


    function clickNote(noteId){





    }
