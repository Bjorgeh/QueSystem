import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    id: root
    width: 940
    height: 720
    visible: true
    title: qsTr("QueSystem Oct 23")

    //Swipeview for swiping left and right between 3 pages
    SwipeView{
        id: swipe
        anchors.fill: parent
        //Sets current page ("startpage") to middle page
        currentIndex: 1

        //Left Page
        Item{
            id: leftPage

        }
        //Middle Page
        Item{
            id: middlePage
            //Rectangle for background
            Rectangle {
                anchors.fill: parent

                //Loading background
                Loader {
                    source: "background.qml"
                    anchors.fill: parent
                }

                //Rectangle for middle page content
                Rectangle{
                    anchors.fill: parent

                    //Loading page content
                    Loader{
                        source: "middle_page.qml"
                        anchors.fill:parent
                    }
                }
            }
        }

        //Right Page
        Item{
            id: rightPage
        }
    }
}
