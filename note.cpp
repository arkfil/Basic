#include "note.h"




Note::Note(QString noteName, QString noteContent, int noteId)
{
    this->name = noteName;
    this->content = noteContent;
    this->id = noteId;
}

QString Note::getContent()
{
    return content;
}

QString Note::getName()
{
    return name;
}

int Note::getId()
{
    return id;
}

void Note::setContent(QString newContent)
{
    this->content = newContent;
}

void Note::setName(QString newName)
{
    this->name = newName;
}

void Note::changeId(int newId)
{
    this->id=newId;
}
