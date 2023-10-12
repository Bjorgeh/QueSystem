import QtQuick
import QtQuick.Window
import QtQuick.Controls
import "Components/SwipeView" as SW
import "./global_functions.js" as GF

Window {
    id: root
    width: 940
    height: 800
    visible: true
    title: qsTr("QueSystem Oct 23")

    //List for adding new items
    property list<string> newItemsList: []

    //List for deleting items
    property list<string> oldItemsList: []

    //Variabels for keeping track of items in grids
    property int itemsInLeftGrid: 0
    property int itemsInMiddleGrid: 0
    property int itemsInRightGrid: 0
    property int itemsInRightPage: 0
    property int itemsInGridsSum: itemsInLeftGrid + itemsInMiddleGrid + itemsInRightGrid + itemsInRightPage

    //variabel for deleted item name - intermediate storage
    property string deletedItem: ""

    //Variables for adding new Item
    property int newItemNumber:  itemsInGridsSum +1

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

        onCurrentIndexChanged: {
            middlePage.updateLeftGridView()
            rightPage.addDeletedToRightPage()
        }

        //Left Page
        SW.Left_page{
            id: leftPage
        }

        //Middle Page
        SW.Middle_page{
            id: middlePage
        }

        //Right Page
        SW.Right_page{
            id: rightPage

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
