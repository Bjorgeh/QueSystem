import QtQuick
import QtQuick.Window
import QtQuick.Controls
import "../../global_functions.js" as GF

Page {

    Rectangle{
        //id: leftPageRec
        height:parent.height
        width:parent.width
        color: "darkblue"

        //unComment for test
        //Properties for calculation gridItems in middle_page
//        property int gridL: parseInt(itemsInLeftGrid)
//        property int gridM: parseInt(itemsInMiddleGrid)
//        property int gridR: parseInt(itemsInRightGrid)
        //property int gridSum: gridL + gridM + gridR

        Rectangle{
            id: buttonColumn
            anchors.centerIn: parent
            height: parent.height - 100
            width: parent.width - 100
            color: "blue"

            Rectangle{
                id: middleOfLeftPage
                anchors.centerIn: parent

                Column{
                    Label{
                        id: addLabel
                        text: "Add Nr: "
                    }
                    //Addbutton for new items
                        Button{
                            id: addButton
                            width: buttonColumn.width / 10
                            height: buttonColumn.height / 10
                            text: newItemNumber ? newItemNumber.toString() : "1"//leftPage.gridSum ? (leftPage.gridSum + 1).toString() : "1"
                            onClicked: {
                                  //unComment for numbers test
//                                console.log("Left Grid: " + leftPage.gridL)
//                                console.log("Middle Grid: " + leftPage.gridM)
//                                console.log("Right Grid: " + leftPage.gridR)
//                                console.log("sum: " + leftPage.gridSum)3

                                //Does not work yet
                                //swipe.middlePage.leftGridView.model.append({name: addButton.text})

                                updateGridNumbers(itemsInLeftGrid,itemsInMiddleGrid,itemsInRightGrid)
                            }
                        }
                    }
                }
            }
        }
    }
