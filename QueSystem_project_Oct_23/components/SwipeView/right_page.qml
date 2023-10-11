import QtQuick
import QtQuick.Window
import QtQuick.Controls
import "../../global_functions.js" as GF
import QtQml

Page {

    id: right_page

    function addDeletedToRightPage(){

        if(deletedItem.length > 0){
            logGridView.model.append({name: deletedItem})
            deletedItem = ""
            swipe.currentIndex = 2
        }
    }

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
            model: ListModel {
                ListElement {
                    name: "TEST"
                    colorCode: "red"
                }
            }

            //Sets up item blueprint
            delegate: Item {
                x: 5
                height: 50
                Column {
                    Rectangle {

                        width: 50
                        height: 30
                        color: "red"
                        radius: 50
                        anchors.horizontalCenter: parent.horizontalCenter

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

        //        Component.onCompleted: {
        //            if(swipe.deletedItem !== "None"){
        //                logGridView.model.append({name: swipe.deletedItem})
        //                //swipe.deletedItem = "None"
        //            }
        //            itemsInRightPage = logGridView.count
        //            console.log("Current: " + swipe.deletedItem)

        //        }
        Component.onCompleted: {

            //Sletter default
            if(logGridView.model.get(0).name === "TEST"){
                logGridView.model.remove(0)
            }
            itemsInRightPage = logGridView.count
        }
    }
}
