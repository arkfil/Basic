
    var idOfCheckedElement;
    var menuOption;
    var element;
    var previousNotePosition=-82;



    function loadAnotherNote(noteTitle,noteContents,noteId){
        showNote(noteTitle,noteContents);
        showNoteInTheMenu(noteTitle,noteContents,noteId)
    }

    function showNoteInTheMenu(noteTitle,noteContents,noteId){
        menuOption = Qt.createComponent("qrc:/MenuItem.qml");
        menuOption.noteTitleLabel=noteTitle;
        menuOption.noteId=noteId;
        menuOption.noteColor="#444240";
        flickableMenuArea.append(menuOption);
    }

    function showNote(noteTitle,noteContents){
        textNote.text= noteContents;
        noteTitleTextField.text = noteTitle;
    }


    function removeNote(index){
        if(index>=0){
           manager.removeNote(flickableMenuArea.get(index).noteId)
           flickableMenuArea.remove(index);
        }
    }

    function clickNote(noteId){
        textNote.text=noteId;
    }
