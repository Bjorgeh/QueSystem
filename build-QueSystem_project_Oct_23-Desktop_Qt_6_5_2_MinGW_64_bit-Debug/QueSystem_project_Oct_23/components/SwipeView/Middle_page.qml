import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQml
import "../Popups"
import "../../global_functions.js" as GF

Page{
    id: middle_page
    //    This will crash the whole program.
    //    height:parent.height
    //    width:parent.width

    property int leftListCount: leftGridView.count

    //Adds new item to left grid view
    function updateLeftGridView(){
        for(let i = 0;i< newItemsList.length; i++ ){
            GF.addItemToGrid(newItemsList[i],leftGridView)
            console.log("Updated leftGrid: " + newItemsList[i])
        }
        //Empties list
        newItemsList = []
    }

    //Left Item list
    Rectangle{
        id: left_item_list
        color: "#e5edf0" //"#399000"
        anchors.left: parent.left
        height: parent.height
        width: parent.width/4
        //Makes rectangle with text
        Rectangle{
            id: left_display_name
            anchors.top: parent.top
            height: parent.height/8
            width: parent.width
            //color: "blue"
            gradient: Gradient {
                GradientStop { position: 0.0; color: left_item_list.color }
                GradientStop { position: 0.6; color: left_item_list.color }
                GradientStop { position: 1.0; color: "gray" }
            }
            radius: 50

            //Displays text centered in parent rectangle
            Text {
                id: ldn
                text: qsTr("\nPågår")
                anchors.centerIn: parent
            }
            //Rectangle for Queued items
            Rectangle{
                id: left_list
                anchors.top: parent.bottom
                width: left_item_list.width
                height: left_item_list.height - left_display_name.height
                color: left_item_list.color

                //variabel for hovered: true false
                property bool isHovered: false
                border.color: isHovered ? "gray" : left_item_list.color

                //Sets mousearea to the whole parent rectangle
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    //sets variabel to true or false dependig on the mouse position
                    onEntered: left_list.isHovered = true
                    onExited: left_list.isHovered = false
                }

                // left Grid with list items
                GridView {
                    id: leftGridView

                    anchors.fill: parent
                    anchors.leftMargin: 8
                    anchors.topMargin: 8
                    anchors.rightMargin: 8
                    anchors.bottomMargin: 8

                    //Sets one default item for test
                    model: ListModel {
                        ListElement {
                            name: "TEST"
                            //colorCode: "grey"
                        }
                    }

                    //Sets up item blueprint
                    delegate: Item {
                        x: 5
                        height: 50
                        visible: index < 30

                        Column {
                            Rectangle {
                                width: leftGridView.width/5//50
                                height: leftGridView.height/30//30
                                color: "gray"
                                radius: 50
                                anchors.horizontalCenter: parent.horizontalCenter

                                Left_list_popup{
                                    anchors.fill: parent
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
                    cellWidth: 92
                    cellHeight: 70

                }

                //Recangle for showing message if more than 30 items in gridview
                Rectangle {
                    id: moreItemsInLeftGridView
                    width: parent.width
                    height: parent.height/8
                    color: "gray"
                    anchors.bottom: parent.bottom
                    //Visible if over 30 items im gridView
                    visible: leftGridView.count > 30 ? 1 : 0
                    Label{
                        anchors.centerIn: parent
                        text: "Mer enn 30"
                    }

                    //Animates blinking for moreItemsInLeftGrid
                    SequentialAnimation {
                        running: true
                        loops: Animation.Infinite

                        PropertyAnimation {
                            target: moreItemsInLeftGridView
                            property: "opacity"
                            from: 1
                            to: 0
                            duration: 500
                        }

                        PropertyAnimation {
                            target: moreItemsInLeftGridView
                            property: "opacity"
                            from: 0
                            to: 1
                            duration: 500
                        }
                    }
                }
            }
        }

        //Runs when parent complete
        Component.onCompleted: {

            //Sletter default
            if(leftGridView.model.get(0).name === "TEST"){
                leftGridView.model.remove(0)
            }
            itemsInLeftGrid = leftGridView.count
        }
    }

    //Middle Item list
    Rectangle{
        id: middle_item_list
        color: "#e5edf0"//"#41a400"
        anchors.left: left_item_list.right
        height: parent.height
        width: parent.width/4

        //Makes rectangle with text
        Rectangle{
            id: middle_display_name
            anchors.top: parent.top
            height: parent.height/8
            width: parent.width
            //color: "blue"
            gradient: Gradient {
                GradientStop { position: 0.0; color: middle_item_list.color }
                GradientStop { position: 0.6; color: middle_item_list.color }
                GradientStop { position: 1.0; color: "yellow" }
            }
            radius: 50

            //Displays text centered in parent rectangle
            Text {
                id: mdn
                text: qsTr("\nUnder bearbeidelse")
                anchors.centerIn: parent
            }

            //Rectangle for progressing items
            Rectangle{
                id: middle_list
                anchors.top: parent.bottom
                width: middle_item_list.width
                height: middle_item_list.height - middle_display_name.height
                color: middle_item_list.color

                //variabel for hovered: true false
                property bool isHovered_middle: false
                border.color: isHovered_middle ? "gray" : middle_item_list.color

                //Sets mousearea to the whole parent rectangle
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    //sets variabel to true or false dependig on the mouse position
                    onEntered: middle_list.isHovered_middle = true
                    onExited: middle_list.isHovered_middle = false
                }

                // middle Grid with list items
                GridView {
                    id: middleGridView
                    anchors.fill: parent
                    anchors.leftMargin: 8
                    anchors.topMargin: 8
                    anchors.rightMargin: 8
                    anchors.bottomMargin: 8


                    //Sets one default item for test
                    model: ListModel {
                        ListElement {
                            name: "TEST"
                            colorCode: "yellow"
                        }

                    }

                    //Sets up item blueprint
                    delegate: Item {
                        x: 5
                        height: 50
                        visible: index < 30
                        Column {
                            Rectangle {
                                width: middleGridView.width/4//50
                                height: middleGridView.height/30//30
                                color: "yellow"
                                radius: 50
                                anchors.horizontalCenter: parent.horizontalCenter

                                Middle_list_popup{
                                    anchors.fill: parent
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
                    cellWidth: 92
                    cellHeight: 70
                }
                //Recangle for showing message if more than 30 items in gridview
                Rectangle {
                    id: moreItemsInMiddleGridView
                    width: parent.width
                    height: parent.height/8
                    color: "gray"
                    anchors.bottom: parent.bottom
                    //Visible if over 30 items im gridView
                    visible: middleGridView.count > 30 ? 1 : 0
                    Label{
                        anchors.centerIn: parent
                        text: "Mer enn 30"
                    }

                    //Animates blinking for moreItemsInMiddleGrid
                    SequentialAnimation {
                        running: true
                        loops: Animation.Infinite

                        PropertyAnimation {
                            target: moreItemsInMiddleGridView
                            property: "opacity"
                            from: 1
                            to: 0
                            duration: 500
                        }

                        PropertyAnimation {
                            target: moreItemsInMiddleGridView
                            property: "opacity"
                            from: 0
                            to: 1
                            duration: 500
                        }
                    }
                }
            }
        }
        //Runs when parent complete
        Component.onCompleted: {


            //Sletter default
            if(middleGridView.model.get(0).name === "TEST"){
                middleGridView.model.remove(0)
            }

            itemsInMiddleGrid = middleGridView.count
        }
    }


    //Right Item list
    Rectangle{
        id: right_item_list
        color: "#e5edf0"//"#4ec500"
        anchors.left: middle_item_list.right
        height: parent.height
        width: parent.width/4

        //Makes rectangle with text
        Rectangle{
            id: right_display_name
            anchors.top: parent.top
            height: parent.height/8
            width: parent.width
            //color: "blue"
            gradient: Gradient {
                GradientStop { position: 0.0; color: right_item_list.color }
                GradientStop { position: 0.6; color: right_item_list.color }
                GradientStop { position: 1.0; color: "#37ff4a" }
            }
            radius: 50

            //Displays text centered in parent rectangle
            Text {
                id: rdn
                text: qsTr("\n Klar\nkasse 1")
                anchors.centerIn: parent
            }

            //Rectangle for ready items
            Rectangle{
                id: right_list
                anchors.top: right_display_name.bottom
                width: parent.width
                height: right_item_list.height - right_display_name.height
                //color: background.color
                color: "#e5edf0"//"#4ec500"

                //variabel for hovered: true false
                property bool isHovered_right: false
                border.color: isHovered_right ? "gray" : right_item_list.color

                //Sets mousearea to the whole parent rectangle
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    //sets variabel to true or false dependig on the mouse position
                    onEntered: right_list.isHovered_right = true
                    onExited: right_list.isHovered_right = false
                }

                // right Grid with list items
                GridView {
                    id: rightGridView
                    anchors.fill: parent
                    anchors.rightMargin: 8
                    anchors.bottomMargin: 8
                    anchors.leftMargin: 8
                    anchors.topMargin: 8

                    //Sets one default item for test
                    model: ListModel {
                        ListElement {
                            name: "TEST"
                            colorCode: "green"
                        }
                    }

                    //Sets up item blueprint
                    delegate: Item {
                        x: 5
                        height: 50
                        visible: index < 30
                        Column {
                            Rectangle {
                                width: rightGridView.width/4//50
                                height: rightGridView.height/30//30
                                color: "#37ff4a"
                                radius: 50
                                anchors.horizontalCenter: parent.horizontalCenter

                                Right_list_popup{
                                    anchors.fill: parent
                                    property GridView kasse: rightGridView
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
                    cellWidth: 92
                    cellHeight: 70
                }
                //Recangle for showing message if more than 30 items in gridview
                Rectangle {
                    id: moreItemsInRightGridView
                    width: parent.width
                    height: parent.height/8
                    color: "gray"
                    anchors.bottom: parent.bottom
                    //Visible if over 30 items im gridView
                    visible: rightGridView.count > 30 ? 1 : 0
                    Label{
                        anchors.centerIn: parent
                        text: "Mer enn 30"
                    }

                    //Animates blinking for moreItemsInrightGrid
                    SequentialAnimation {
                        running: true
                        loops: Animation.Infinite

                        PropertyAnimation {
                            target: moreItemsInRightGridView
                            property: "opacity"
                            from: 1
                            to: 0
                            duration: 500
                        }

                        PropertyAnimation {
                            target: moreItemsInRightGridView
                            property: "opacity"
                            from: 0
                            to: 1
                            duration: 500
                        }
                    }
                }
            }
        }
    }
    //Runs when parent complete
    Component.onCompleted: {

        //Sletter default
        if(rightGridView.model.get(0).name === "TEST"){
            rightGridView.model.remove(0)
        }

        itemsInRightGrid = rightGridView.count
    }

    //Right Item list
    Rectangle{
        id: right_item_list_2
        color: "#e5edf0"//"#4ec500"
        anchors.left: right_item_list.right
        height: parent.height
        width: parent.width/4

        //Makes rectangle with text
        Rectangle{
            id: right_display_name_2
            anchors.top: parent.top
            height: parent.height/8
            width: parent.width
            //color: "blue"
            gradient: Gradient {
                GradientStop { position: 0.0; color: right_item_list.color }
                GradientStop { position: 0.6; color: right_item_list.color }
                GradientStop { position: 1.0; color: "#37ff4a" }
            }
            radius: 50

            //Displays text centered in parent rectangle
            Text {
                id: rdn_2
                text: qsTr("\n Klar\nkasse 2")
                anchors.centerIn: parent
            }

            //Rectangle for ready items
            Rectangle{
                id: right_list_2
                anchors.top: right_display_name_2.bottom
                width: parent.width
                height: right_item_list_2.height - right_display_name_2.height
                //color: background.color
                color: "#e5edf0"//"#4ec500"

                //variabel for hovered: true false
                property bool isHovered_right: false
                border.color: isHovered_right ? "gray" : right_item_list_2.color

                //Sets mousearea to the whole parent rectangle
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    //sets variabel to true or false dependig on the mouse position
                    onEntered: right_list_2.isHovered_right = true
                    onExited: right_list_2.isHovered_right = false
                }

                // right Grid with list items
                GridView {
                    id: rightGridView_2
                    anchors.fill: parent
                    anchors.rightMargin: 8
                    anchors.bottomMargin: 8
                    anchors.leftMargin: 8
                    anchors.topMargin: 8

                    //Sets one default item for test
                    model: ListModel {
                        ListElement {
                            name: "TEST"
                            colorCode: "green"
                        }
                    }

                    //Sets up item blueprint
                    delegate: Item {
                        x: 5
                        height: 50
                        visible: index < 30
                        Column {
                            Rectangle {
                                width: rightGridView_2.width/4//50
                                height: rightGridView_2.height/30//30
                                color: "#37ff4a"
                                radius: 50
                                anchors.horizontalCenter: parent.horizontalCenter

                                Right_list_popup{
                                    anchors.fill: parent
                                    property GridView kasse: rightGridView_2
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
                    cellWidth: 92
                    cellHeight: 70


                }
                //Recangle for showing message if more than 30 items in gridview
                Rectangle {
                    id: moreItemsInRightGridView_2
                    width: parent.width
                    height: parent.height/8
                    color: "gray"
                    anchors.bottom: parent.bottom
                    //Visible if over 30 items im gridView
                    visible: rightGridView_2.count > 30 ? 1 : 0
                    Label{
                        anchors.centerIn: parent
                        text: "Mer enn 30"
                    }

                    //Animates blinking for moreItemsInRightGridView_2
                    SequentialAnimation {
                        running: true
                        loops: Animation.Infinite

                        PropertyAnimation {
                            target: moreItemsInRightGridView_2
                            property: "opacity"
                            from: 1
                            to: 0
                            duration: 500
                        }

                        PropertyAnimation {
                            target: moreItemsInRightGridView_2
                            property: "opacity"
                            from: 0
                            to: 1
                            duration: 500
                        }
                    }
                }
            }
        }

        //Runs when parent complete
        Component.onCompleted: {

            //Sletter default
            if(rightGridView_2.model.get(0).name === "TEST"){
                rightGridView_2.model.remove(0)
            }

            itemsInRightGrid = rightGridView_2.count + rightGridView.count
        }
    }
}

