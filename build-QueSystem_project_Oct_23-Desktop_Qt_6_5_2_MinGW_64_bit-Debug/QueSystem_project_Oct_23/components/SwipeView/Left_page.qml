import QtQuick
import QtQuick.Window
import QtQuick.Controls
import "../../global_functions.js" as GF
import "../SwipeView" as SW

Page {

    //Imports the middle_page as a component with ID
    //MAKES COPY OF MIDDLEPAGE - > WONT WORK
//    Item{
//        SW.Middle_page{
//            id: mp
//        }
//    }

    Rectangle{
        //id: leftPageRec
        height:parent.height
        width:parent.width
        color: "darkblue"


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

                                //Adds added items to list
                                newItemsList.push((newItemNumber).toString())

                                //Prints list
                                console.log("List: ")
                                for(let i=0;i < newItemsList.length;i++){
                                    console.log(newItemsList[i])
                                }
                                newItemNumber++
                                //updates gridnumbers
                                updateGridNumbers(itemsInLeftGrid,itemsInMiddleGrid,itemsInRightGrid)
                            }
                        }
                    }
                }
            }
        }
    }
