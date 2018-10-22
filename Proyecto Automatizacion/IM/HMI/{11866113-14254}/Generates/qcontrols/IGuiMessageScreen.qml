import QtQuick 2.0

/// Background screen
Rectangle
{

    id:qMessageScreen
    objectName: "messagescreen"
    width : 0
    height : 0
    color : "white"

    // text
    Text{
        id: qMessageText
        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: "black"
    }
	
    //Set the text
    function setValue(value)
    {
        qMessageText.text = value;
    }

    function setSize(newWidth,newHeight)
    {
       qMessageScreen.width = newWidth
       qMessageScreen.height = newHeight
    }
}



