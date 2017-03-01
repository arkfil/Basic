TEMPLATE = app

QT += qml quick
CONFIG += c++14

SOURCES += main.cpp \
    txtfile.cpp \
    note.cpp \
    manager.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    txtfile.h \
    note.h \
    manager.h
