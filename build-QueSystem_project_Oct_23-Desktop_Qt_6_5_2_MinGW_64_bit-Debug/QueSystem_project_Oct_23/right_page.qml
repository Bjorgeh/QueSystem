import QtQuick
import QtQuick.Window
import QtQuick.Controls

Page {

    Rectangle{
        anchors.fill: parent
        color: "green"

        Rectangle{
            id: topLogo
            anchors.top: parent.top
            x: parent.width /2

            Label{
                text: "Item Log"
            }
        }
        GridView {
            id: logGridView
            anchors.fill: parent
            anchors.leftMargin: 8
            anchors.topMargin: 8
            anchors.rightMargin: 8
            anchors.bottomMargin: 8
            anchors.top: topLogo.bottom

            //Sets one default item for test
//            model: ListModel {
//                ListElement {
//                    name: "Grey"
//                    colorCode: "grey"
//                }
//            }

            //Sets up item blueprint
            delegate: Item {
                x: 5
                height: 50
                Column {
                    Rectangle {
                        width: 50
                        height: 30
                        color: "gray"
                        radius: 50
                        anchors.horizontalCenter: parent.horizontalCenter

                        Loader{
                            anchors.fill: parent
                            source: "left_list_popup.qml"
                        }
                        Text {
                            //id: objName
                            text: qsTr(name)
                            anchors.centerIn: parent
                        }
                    }

                    Text {
                        x: 5
                        //text: name
                        font.bold: true
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    spacing: 5
                }
            }
            cellWidth: 70
            cellHeight: 70
        }

        Component.onCompleted: {
            if(swipe.deletedItem !== "None"){
                logGridView.model.append({name: swipe.deletedItem})
                swipe.deletedItem = "None"
            }
            itemsInRightPage = logGridView.count
            console.log("Current: " + swipe.deletedItem)
        }
    }
}
