import QtQuick
import QtQuick.Window
import QtQuick.Controls
import "Components/SwipeView" as SW
import "./global_functions.js" as GF

Window {
    id: root
    width: 940
    height: 720
    visible: true
    title: qsTr("QueSystem Oct 23")

    //Variabels for keeping track of items in grids
    property int itemsInLeftGrid: 0
    property int itemsInMiddleGrid: 0
    property int itemsInRightGrid: 0
    property int itemsInRightPage: 0
    property int itemsInGridsSum: itemsInLeftGrid + itemsInMiddleGrid + itemsInRightGrid + itemsInRightPage

    //Variables for adding new Item
    property int newItemNumber: itemsInGridsSum+1

    //Function for updating number of items in grids Left, Middle, Right
    function updateGridNumbers(l,m,r){
        itemsInLeftGrid = l
        itemsInMiddleGrid = m
        itemsInRightGrid = r
    }

    //Swipeview for swiping left and right between 3 pages
    SwipeView{
        id: swipe
        anchors.fill: parent
        //Sets current page ("startpage") to middle page
        currentIndex: 1

        property string deletedItem: "None"

        //Left Page
        SW.Left_page{
            id: leftPage

            //            //Rectangle for background
            //            Rectangle {
            //                anchors.fill: parent

            //                //                //Loading background
            //                //                Loader {
            //                //                    source: "background.qml"
            //                //                    anchors.fill: parent
            //                //                }
            //            }
            //            //Rectangle for middle page content
            //            Rectangle{
            //                id: itemRecLeft
            //                anchors.fill: parent
            //                //color: parent.color

            //                //                //Loading page content
            //                //                Loader{
            //                //                    source: "left_page.qml"
            //                //                    anchors.fill:parent
            //                //                }
            //            }
        }

        //Middle Page
        SW.Middle_page{
            id: middlePage
            //            //Rectangle for background
            //            Rectangle {
            //                id: itemRecMiddle
            //                anchors.fill: parent

            //                //Loading background
            ////                Loader {

            ////                    source: "background.qml"
            ////                    anchors.fill: parent
            ////                }

            //                //Rectangle for middle page content
            //                Rectangle{
            //                    anchors.fill: parent

            //                    //                    //Loading page content
            //                    //                    Loader{
            //                    //                        source: "middle_page.qml"
            //                    //                        anchors.fill:parent
            //                    //                    }
            //                }
            //            }

        }

        //Right Page
        SW.Right_page{
            id: rightPage
            //            Rectangle {
            //                anchors.fill: parent
            //                //Loading background
            ////                Loader {
            ////                    source: "background.qml"
            ////                    anchors.fill: parent
            ////                }
            //                //Rectangle for right page content
            //                Rectangle{
            //                    anchors.fill: parent

            ////                    //Loading page content
            ////                    Loader{
            ////                        source: "right_page.qml"
            ////                        anchors.fill:parent
            ////                    }
            //                }
            //            }
            //        }
        }
    }

    //PageIndicator bottom
    PageIndicator {
        id: botSwipeInd
        interactive: true
        count: swipe.count
        currentIndex: swipe.currentIndex

        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }

}
