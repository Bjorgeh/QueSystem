import QtQuick
import QtQuick.Window
import QtQuick.Controls

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
                        middleGridView.model.append({name: leftGridView.model.get(index).name});
                        //Removes element from leftGridView
                        leftGridView.model.remove(index)
                        //Updates gridnumbers
                        updateGridNumbers(leftGridView.count,middleGridView.count,rightGridView.count)

                    }
                }
                //moves element to rightGridView
                Button { text: "Flytt til 'Klar'"
                    onClicked: {
                        //Adds element to rightgridview
                        rightGridView.model.append({name: leftGridView.model.get(index).name});
                        //Removes element from leftGridView
                        leftGridView.model.remove(index)
                        //Updates gridnumbers
                        updateGridNumbers(leftGridView.count,middleGridView.count,rightGridView.count)

                    }
                }

                //Removes element from leftGridView
                Button {
                    text: "Slett"
                    onClicked:{
                        leftGridView.model.remove(index)
                        //Updates gridnumbers
                        updateGridNumbers(leftGridView.count,middleGridView.count,rightGridView.count)
                    }

                }
            }
        }
    }
}
