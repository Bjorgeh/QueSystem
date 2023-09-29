import QtQuick
import QtQuick.Window

//Main window
Window {
    id: root
    width: 940
    height: 720
    visible: true
    title: qsTr("QueSystem Oct 23")

    //Background
    Rectangle{
        id: background
        color: "#4ec500"
        anchors.fill: parent

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
                    GradientStop { position: 1.0; color: "#7d000d" }
                }
                radius: 50

                //Displays text centered in parent rectangle
                Text {
                    id: ldn
                    text: qsTr("Queued items")
                    anchors.centerIn: parent
                }
                //Rectangle for Queued items
                Rectangle{
                    id: left_list
                    anchors.top: parent.bottom
                    width: left_item_list.width
                    height: left_item_list.height - left_display_name.height
                    color: left_item_list.color
                    border.color: "darkgray"

                     // left Grid with list items
                    GridView {
                        id: leftGridView
                        anchors.fill: parent
                        anchors.leftMargin: 8
                        anchors.topMargin: 8
                        anchors.rightMargin: 8
                        anchors.bottomMargin: 8
                        model: ListModel {
                            ListElement {
                                name: "Grey"
                                colorCode: "grey"
                            }

                            ListElement {
                                name: "Red"
                                colorCode: "red"
                            }

                            ListElement {
                                name: "Blue"
                                colorCode: "blue"
                            }

                            ListElement {
                                name: "Green"
                                colorCode: "green"
                            }
                        }
                        delegate: Item {
                            x: 5
                            height: 50
                            Column {
                                Rectangle {
                                    width: 50
                                    height: 30
                                    color: "#7d000d"
                                    radius: 50
                                    anchors.horizontalCenter: parent.horizontalCenter
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
                    GradientStop { position: 1.0; color: "#bced00" }
                }
                radius: 50

                //Displays text centered in parent rectangle
                Text {
                    id: mdn
                    text: qsTr("Progressing items")
                    anchors.centerIn: parent
                }

                //Rectangle for progressing items
                Rectangle{
                    id: middle_list
                    anchors.top: parent.bottom
                    width: middle_item_list.width
                    height: middle_item_list.height - middle_display_name.height
                    color: middle_item_list.color
                    border.color: "darkgray"

                     // middle Grid with list items
                    GridView {
                        id: middleGridView
                        anchors.fill: parent
                        anchors.leftMargin: 8
                        anchors.topMargin: 8
                        anchors.rightMargin: 8
                        anchors.bottomMargin: 8
                        model: ListModel {
                            ListElement {
                                name: "Grey"
                                colorCode: "grey"
                            }

                            ListElement {
                                name: "Red"
                                colorCode: "red"
                            }

                            ListElement {
                                name: "Blue"
                                colorCode: "blue"
                            }

                            ListElement {
                                name: "Green"
                                colorCode: "green"
                            }
                        }
                        delegate: Item {
                            x: 5
                            height: 50
                            Column {
                                Rectangle {
                                    width: 50
                                    height: 30
                                    color: "#bced00"
                                    radius: 50
                                    anchors.horizontalCenter: parent.horizontalCenter
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

        //Right Item list
        Rectangle{
            id: right_item_list
            color: background.color
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
                    text: qsTr("Ready items")
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
                    border.color: "darkgray"

                    // right Grid with list items
                    GridView {
                        id: rightGridView
                        anchors.fill: parent
                        anchors.rightMargin: 8
                        anchors.bottomMargin: 8
                        anchors.leftMargin: 8
                        anchors.topMargin: 8
                        model: ListModel {
                            ListElement {
                                name: "Grey"
                                colorCode: "grey"
                            }

                            ListElement {
                                name: "Red"
                                colorCode: "red"
                            }

                            ListElement {
                                name: "Blue"
                                colorCode: "blue"
                            }

                            ListElement {
                                name: "Green"
                                colorCode: "green"
                            }
                        }
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
    }
}
