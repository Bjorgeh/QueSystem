import QtQuick
import QtQuick.Window

//Main window
Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("QueSystem Oct 23")

    //Background
    Rectangle{
        id: background
        color: "green"
        anchors.fill: parent

        //Left Item list
        Rectangle{
            id: left_item_list
            color: "red"
            anchors.left: parent.left
            height: parent.height
            width: parent.width/3
            //Makes rectangle with text
            Rectangle{
                id: left_display_name
                anchors.top: parent.top
                height: parent.height/8
                width: parent.width
                color: "blue"
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
                }
            }
        }

        //Middle Item list
        Rectangle{
            id: middle_item_list
            color: "yellow"
            anchors.left: left_item_list.right
            height: parent.height
            width: parent.width/3

            //Makes rectangle with text
            Rectangle{
                id: middle_display_name
                anchors.top: parent.top
                height: parent.height/8
                width: parent.width
                color: "blue"
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
                color: "blue"
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
                    color: background.color

                }
            }
        }
    }
}
