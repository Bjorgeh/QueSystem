import QtQuick
import QtQuick.Window
import QtQuick.Controls

Item{
    id: middle_page
    height:parent.height
    width:parent.width

    //Left Item list
    Rectangle{
        id: left_item_list
        color: "#399000"
        anchors.left: parent.left
        height: parent.height
        width: parent.width/3
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
                text: qsTr("Pågår")
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
                            name: "Grey"
                            colorCode: "grey"
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
                                color: "gray"
                                radius: 50
                                anchors.horizontalCenter: parent.horizontalCenter

                                Loader{
                                    anchors.fill: parent
                                    source: "left_list_popup.qml"
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
                    cellWidth: 70
                    cellHeight: 70
                }
            }
        }
        Component.onCompleted: {
            itemsInLeftGrid = leftGridView.count
        }
    }

    //Middle Item list
    Rectangle{
        id: middle_item_list
        color: "#41a400"
        anchors.left: left_item_list.right
        height: parent.height
        width: parent.width/3

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
                text: qsTr("Under bearbeidelse")
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
                            name: "Yellow"
                            colorCode: "yellow"
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
                                color: "yellow"
                                radius: 50
                                anchors.horizontalCenter: parent.horizontalCenter

                                Loader{
                                    anchors.fill: parent
                                    source: "middle_list_popup.qml"
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
                    cellWidth: 70
                    cellHeight: 70
                }
            }
        }
        Component.onCompleted: {
            itemsInMiddleGrid = middleGridView.count
        }
    }

    //Right Item list
    Rectangle{
        id: right_item_list
        color: "#4ec500"
        anchors.left: middle_item_list.right
        height: parent.height
        width: parent.width/3

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
                text: qsTr("Klar")
                anchors.centerIn: parent
            }

            //Rectangle for ready items
            Rectangle{
                id: right_list
                anchors.top: right_display_name.bottom
                width: parent.width
                height: right_item_list.height - right_display_name.height
                //color: background.color
                color: "#4ec500"

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
                            name: "1"
                            colorCode: "green"
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
                                color: "#37ff4a"
                                radius: 50
                                anchors.horizontalCenter: parent.horizontalCenter
                                Loader{
                                    anchors.fill: parent
                                    source: "right_list_popup.qml"
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
                    cellWidth: 70
                    cellHeight: 70
                }
            }
        }
    }
    Component.onCompleted: {
        itemsInRightGrid = rightGridView.count
    }
}
