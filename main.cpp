#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlComponent>
#include <QQuickView>
#include <QQmlContext>

#include <QDebug>
#include <QUrl>

#include "txtfile.h"
#include "manager.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;


    QQmlContext* context = engine.rootContext();

    TxtFile txtFile;

    Manager manager(txtFile);


    context->setContextProperty("manager", &manager);




    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));







    return app.exec();
}
