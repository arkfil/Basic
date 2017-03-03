#include "txtfile.h"
#include <iostream>
#include <QFile>
#include <QTextStream>
#include <QDebug>

const QString TxtFile::BASE_FILE_NAME="index";




TxtFile::TxtFile()
{
    qDebug("eeee");
}



TxtFile::~TxtFile()
{
    qDebug("hhhhhhh");
}

bool TxtFile::saveToFile(QString name, QString contents, QString fileName)
{
    QFile file("Notes/"+fileName);

        if (file.open(QIODevice::WriteOnly | QFile::Text))
            file.resize(0);

        QTextStream stream(&file);
        stream<<name << "\n" << contents;
        stream.flush();

        file.close();


   return true;
}

bool TxtFile::addToFile(QString name, QString contents)
{
    QFile file("Notes/"+name);
    if (!file.open(QIODevice::WriteOnly | QIODevice::Append))
    {
        qDebug() << "FAIL FILE NOT EXIST***";
        return false;
    }else{
        QTextStream stream(&file);
        stream<<contents<<"\n";
        stream.flush();
        file.close();
        return true;
    }
}


bool TxtFile::removeLineFromFile(QString name, QString linesContents)
{

    QFile file("Notes/"+name);

    if (!file.open(QIODevice::ReadWrite| QIODevice::Append))
    {
        qDebug() << "FAIL FILE NOT EXIST***";
        //file.close();
        return false;
    }else{

        QTextStream out(&file);

        QString newFileContents="";

        while(!out.atEnd()) {
            QString line = out.readLine();
            if(line!=linesContents){
                newFileContents.append(line+"\n");
            }
        }

        file.resize(0);
        out << newFileContents;
        out.flush();
        file.close();
        return true;
    }


}

bool TxtFile::removeFile(QString name)
{
    QFile file("Notes/"+name);
    file.remove();

    return true;
}

QString TxtFile::readWholeFileContents(QString name)
{
    QFile file("Notes/"+name);

    if (!file.open(QIODevice::ReadOnly | QIODevice::Append))
    {
        qDebug() << "FAIL FILE NOT EXIST***";
        //file.close();
        return "NULL";
    }else{
        //file.open(QIODevice::ReadOnly | QIODevice::Text);
        QTextStream in(&file);
        QString fileContents = in.readAll();
        file.close();
        return fileContents;
    }
}
