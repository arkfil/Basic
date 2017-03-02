#include "manager.h"

#include <utility>

Manager::Manager(TxtFile& txtFile_p, QObject *parent) : txtFile(txtFile_p), QObject(parent), count(0), msg("%1 Save Hits")
{
    this->readNotesToMemory();
}

void Manager::readNotesToMemory()
{
    // Not implemented yet

}
/*
void pushNote(QString noteName,QString noteContents,int noteId)
{

}
*/

void Manager::readNote(int noteId)
{
    // Not implemented yet
  /*
    QString noteName = noteBase.at(noteId).getName();
    QString noteContents = noteBase.at(noteId).getContents();;
  */
     QString noteName = "heheszki";
     QString noteContents = "placeholder";

    emit pushNote(noteName, noteContents, noteId);



}

int Manager::saveNote(QString noteName,QString noteContents, int noteId)
{
    // jeżeli to całkowicie nowa notatka:
    //  - dodaje do mapy
    //  - dorzucam nowy plik
    //  - dorzucam do pliku - bazy danych

    // jeżeli to aktualizacja istniejącej notatki
    //  - podmieniam wpis w mapie
    //  - nadpisuje plik
    //  - podmieniam wpis w pliku - bazie


    // Poor implementation

    if(noteId==Note::NOTE_ALREADY_EXISTS){
        int newId = this -> getFreeId();
        Note note(noteName,noteContents,newId);
        QString idAsQString = QString::number(newId);


        noteBase.insert(std::make_pair(newId,note));
        txtFile.saveToFile(idAsQString,noteContents);
        txtFile.addToFile(TxtFile::BASE_FILE_NAME, ""+idAsQString);
    }else{
        noteBase.at(noteId).setContent(noteContents);
        noteBase.at(noteId).setName(noteName);
        QString idAsQString = QString::number(noteId);
        txtFile.saveToFile(idAsQString,noteContents);
    }




    ++count;
    emit increaseOne(msg.arg(count));
    return noteId;
}



bool Manager::removeNote(int noteId)
{
    // Poor implementation


    QString idAsQString = QString::number(noteId);
    noteBase.erase(noteId);
    txtFile.removeLineFromFile(TxtFile::BASE_FILE_NAME,idAsQString);


    txtFile.removeFile(idAsQString);







    return true;
}












int Manager::getFreeId(){
     srand(time(NULL));
     int id = (std::rand()%1000000)+1;
     while(checkWhetherInTheMap(id))
        id = (std::rand()%1000000)+1;
     return id;
}


bool Manager::checkWhetherInTheMap(int noteId){
    bool inTheNotes = false;
    for(auto i : noteBase){
        if(i.first == noteId)
            inTheNotes = true;
    }
    return inTheNotes;
}







