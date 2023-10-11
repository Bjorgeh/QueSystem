import QtQuick
import QtQuick.Window
import QtQuick.Controls
import '../../global_functions.js' as GF

Item {

    MouseArea{
        anchors.fill: parent
        onClicked: (mouse) => {
                       //Åpner popup
                       onClicked: popup_l.open()
                       //Finds element position in gridview via mouseinteraction
                       let posInGridView = Qt.point(mouse.x, mouse.y)
                       let posInContentItem = mapToItem(leftGridView.contentItem, posInGridView)
                       let index = leftGridView.indexAt(posInContentItem.x, posInContentItem.y)
                       console.log(index)

                   }
    }

    //Popup for leftgridView element edit
    Popup {
        id: popup_l
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
                //Moves element to middleGridView
                Button {
                    text: "Flytt til 'Under bearbeidelse'"
                    onClicked: {
                        //Adds element to middlegridview
                        //middleGridView.model.append({name: leftGridView.model.get(index).name});
                        GF.addItemToGrid(leftGridView.model.get(index).name,middleGridView)

                        //Removes element from leftGridView
                        //leftGridView.model.remove(index)
                        GF.removeItem(index, leftGridView)

                        //Updates gridnumbers
                        updateGridNumbers(leftGridView.count,middleGridView.count,rightGridView.count)
                    }
                }

                //moves element to rightGridView
                Button { text: "Flytt til 'Klar'"
                    onClicked: {
                        //Adds element to rightgridview
                        //rightGridView.model.append({name: leftGridView.model.get(index).name});
                        GF.addItemToGrid(leftGridView.model.get(index).name,rightGridView)

                        //Removes element from leftGridView
                        //leftGridView.model.remove(index)
                        GF.removeItem(index, leftGridView)

                        //Updates gridnumbers
                        updateGridNumbers(leftGridView.count,middleGridView.count,rightGridView.count)
                    }
                }

                //Removes element from leftGridView
                Button {

                    id: leftListDeleteButton
                    text: "Slett"
                    onClicked:{

                        deletedItem = leftGridView.model.get(0).name
                        //Removes item from left grid
                        GF.removeItem(index,leftGridView)

                        //Updates gridnumbers
                        updateGridNumbers(leftGridView.count,middleGridView.count,rightGridView.count)


                    }
                }
            }
        }
    }
}
