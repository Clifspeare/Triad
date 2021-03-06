import QtQuick 2.7
import QtQuick.Controls 2.1
import net.spencerb.model 1.0

ApplicationWindow {
    id: root
    visible: true
    width: 640
    height: 480
    title: qsTr("Triad")

    NoteBrowser {
        id: view
        anchors.left: parent.left
        height: parent.height
        width: parent.width / 3
        notemodel: notemodel
    }

    NotePage {
        id: notepage
        focus: true
        anchors.right: parent.right
        height: parent.height
        width: parent.width - view.width
        nModel: notemodel
        Connections {
            target: view
            onModelSelectionIndexChanged: {
                notepage.storageif.parentIndex = newIndex
            }
            onModelSelectionDepthChanged: {
                notepage.storageif.parentDepth = newDepth
            }
        }
    }

    NoteModel {
        id: notemodel
    }
}
