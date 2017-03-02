#ifndef MANAGER_H
#define MANAGER_H

#include "note.h"
#include "txtfile.h"
#include <unordered_map>
#include <QString>

class Manager : public QObject
{
    Q_OBJECT
public:
    explicit Manager(TxtFile&,QObject* parent=0);
    void readNotesToMemory();

//    bool saveNote(int);


private:
    bool checkWhetherInTheMap(int noteId);
    int getFreeId();

    std::unordered_map<int,Note> noteBase;
    TxtFile txtFile;

    int count;
    QString msg;

public slots:
  //  void write();
    int saveNote(QString,QString,int);
//    bool modifyNote(QString, QString, int noteId);
    bool removeNote(int);
    void readNote(int);

signals:
    void increaseOne(QString ms);
    void pushNote(QString noteTitle,QString noteContents,int noteId);




};

#endif // MANAGER_H
