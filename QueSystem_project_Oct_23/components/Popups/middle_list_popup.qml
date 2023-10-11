import QtQuick
import QtQuick.Window
import QtQuick.Controls
import '../../global_functions.js' as GF

Item {
    MouseArea{
        anchors.fill: parent
        onClicked: (mouse) => {
                       //Åpner popup
                       onClicked: popup_m.open()
                       //Finds element position in gridview via mouseinteraction
                       let posInGridView = Qt.point(mouse.x, mouse.y)
                       let posInContentItem = mapToItem(middleGridView.contentItem, posInGridView)
                       let index = middleGridView.indexAt(posInContentItem.x, posInContentItem.y)
                       //console.log(index)
                   }
    }

    //Popup for middleGridView element edit
    Popup {
        id: popup_m
        x: parent.x + 30
        y: parent.y + 20
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
        contentItem: Rectangle {
            id: buttonRec
            anchors.fill: parent
            color: "#00000000" // Makes rectangle transparent
            border.color: "transparent"

            Column {
                //moves element to rightGridView
                Button {
                    text: "Flytt til 'klar'"
                    onClicked: {
                        //Adds element to rightgridview
                        rightGridView.model.append({name: middleGridView.model.get(index).name});
                        //Removes element from middleGridView
                        middleGridView.model.remove(index)
                        //Updates gridnumbers
                        updateGridNumbers(leftGridView.count,middleGridView.count,rightGridView.count)

                    }
                }
                //Removes element from middleGridView
                Button {
                    text: "Slett"
                    onClicked:{
                        //Sets property variabel to new item name
                        deletedItem = middleGridView.model.get(index).name

                        //Removes from middle grid
                        middleGridView.model.remove(index)

                        //Updates gridnumbers
                        updateGridNumbers(leftGridView.count,middleGridView.count,rightGridView.count)

                        //Swipes to the item log page.
                        swipe.currentIndex = 2
                    }
                }
            }
        }
    }
}
