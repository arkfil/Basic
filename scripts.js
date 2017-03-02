
    var idOfCheckedElement;
    var menuOption;
    var element;
    var previousNotePosition=-82;



    function loadAnotherNote(noteTitle,noteContents,noteId){


        menuOption = Qt.createComponent("qrc:/MenuItem.qml");

        //element = menuOption.createObject(flickableMenuArea.contentItem,{"x": 100, "y":100});

        menuOption.noteTitleLabel=noteTitle;
        menuOption.noteId=noteId;
        previousNotePosition+=82;
        menuOption.previousNotePosition=previousNotePosition;
        menuOption.noteColor="#444240";

        showNote(noteTitle,noteContents);
        flickableMenuArea.append(menuOption);

    }

    function showNote(noteTitle,noteContents){
        textNote.text= noteContents;
        noteTitleTextField.text = noteTitle;
    }


    function removeNote(index){
        if(index>=0){
           flickableMenuArea.remove(index);

        }
    }

    function clickNote(noteId){
        textNote.text=noteId;
    }


