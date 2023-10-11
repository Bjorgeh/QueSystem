import QtQuick
import QtQuick.Window
import QtQuick.Controls
import '../../global_functions.js' as GF

Item {
    MouseArea{
        anchors.fill: parent
        onClicked: (mouse) => {
                       //Åpner popup
                       onClicked: popup_r.open()
                       //Finds element position in gridview via mouseinteraction
                       let posInGridView = Qt.point(mouse.x, mouse.y)
                       let posInContentItem = mapToItem(rightGridView.contentItem, posInGridView)
                       let index = rightGridView.indexAt(posInContentItem.x, posInContentItem.y)
                       console.log(index)
                   }
    }

    //Popup for rightGridView element edit
    Popup {
        id: popup_r
        x: parent.x + 30
        y: parent.y + 20
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
        contentItem: Rectangle {

            id: buttonRec
            anchors.fill: parent
            color: "#00000000" // transparent
            border.color: "transparent"
            Column {
                //button for element delition
                Button {
                    text: "Slett"
                    onClicked:{
                        //Sets property variabel to new item name
                        deletedItem = rightGridView.model.get(index).name

                        //Removes from middle grid
                        rightGridView.model.remove(index);

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
