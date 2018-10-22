import QtQuick 2.0
Item{
    //anchors.fill: parent
     id: root
     x : 0
     y : 0

     function setSize(newWidth,newHeight)
     {
        width = newWidth
        height = newHeight
     }

    Component.onCompleted:
    {
       proxy.setSize.connect(root.setSize);
    }
}
