QT += qml quick xml gui

CONFIG += c++11

SOURCES += src/main.cpp \
    src/notemodel.cpp \
    src/documenthandler.cpp \
    src/storageinterface.cpp \
    src/imagebaseconverter.cpp \
    src/domitem.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

DEFINES += QT_DEPRECATED_WARNINGS

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    includes/notemodel.h \
    includes/documenthandler.h \
    includes/storageinterface.h \
    includes/imagebaseconverter.h \
    includes/domitem.h
