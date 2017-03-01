#ifndef TXTFILE_H
#define TXTFILE_H

#include <QObject>
#include <QString>

class TxtFile
{

public:
    static const QString BASE_FILE_NAME;


    TxtFile();
    ~TxtFile();
    bool saveToFile(QString, QString);
    bool addToFile(QString, QString);
    bool removeLineFromFile(QString,QString);
    bool removeFile(QString);



};

#endif // TXTFILE_H