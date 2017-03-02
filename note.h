#ifndef NOTE_H
#define NOTE_H
#include <QString>

struct Note
{
public:
    static const int NOTE_ALREADY_EXISTS=-1;


    Note(QString,QString,int);
    QString getContents();
    QString getName();
    int getId();

    void setContent(QString);
    void setName(QString);
    void changeId(int);

private:
    QString content;
    QString name;
    int id;


};

#endif // NOTE_H
