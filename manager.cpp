#include "manager.h"
#include <iostream>
#include <utility>
#include <QTextStream>
#include <QTemporaryFile>

Manager::Manager(TxtFile& txtFile_p, QObject *parent) : txtFile(txtFile_p), QObject(parent), count(0), msg("%1 Save Hits")
{}

void Manager::readNotesToMemory()
{
    /*
     * 1) Reading notes from files and inserting it to noteBase
     * 2) Pusching Notes to the GUI
     */

    QString contentsOfBase = txtFile.readWholeFileContents(TxtFile::BASE_FILE_NAME);

    QStringList idFileTitles = contentsOfBase.split("\n");

    idFileTitles.pop_back();


    for(auto idFileTitle : idFileTitles){

        int noteId = idFileTitle.toInt();

        QString noteTitle = txtFile.readFirstLineOfFileOnly(idFileTitle);
        QString noteContents = txtFile.readEverythingExceptFirstLineOfFile(idFileTitle);

        Note note(noteTitle,noteContents,noteId);
        noteBase.insert(std::make_pair(noteId,note));

        emit loadInToTheMenu(noteTitle, noteContents, noteId);
    }
}

void Manager::readNote(int noteId)
{
    // Not implemented yet
    std::cout << " BBBBBBBBBBBBBBBBBBBBBBBBB "<< noteId;
    QString noteName = noteBase.at(noteId).getName();
    QString noteContents = noteBase.at(noteId).getContents();;
    emit exposeNote(noteName, noteContents);
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
    int newId=noteId;

    if(noteId==Note::NOTE_DOESNT_EXIST){
        newId = this -> getFreeId();
        Note note(noteName,noteContents,newId);
        QString idAsQString = QString::number(newId);


        noteBase.insert(std::make_pair(newId,note));
        txtFile.saveToFile(noteName,noteContents,idAsQString);
        txtFile.addToFile(TxtFile::BASE_FILE_NAME, idAsQString);
        emit pushNote(noteName, noteContents, newId);
    }else{
        noteBase.at(noteId).setContent(noteContents);
        noteBase.at(noteId).setName(noteName);
        QString idAsQString = QString::number(noteId);
        txtFile.saveToFile(noteName,noteContents,idAsQString);

    }

    std::cout << " Id w c++ w metodzie Managera saveNote() "<<newId;


//    emit pushNote(noteName, noteContents, newId);

    ++count;
    emit increaseOne(msg.arg(count));
    return newId;
}

bool Manager::removeNote(int noteId)
{

    std::cout << " Id w c++ w metodzie Managera removeNote():    " <<noteId;
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
