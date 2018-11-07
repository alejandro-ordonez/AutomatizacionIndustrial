import QtQuick 2.0
Item
{
    id:qpage

	property var refId	
    property int objId : 0

    Keys.onPressed:
    {
        proxy.keyHandler(qpage.objId, event.key, true, event.count);
        event.accepted = true;
    }
    z:1

    Keys.onReleased:
    {
        proxy.keyHandler(qpage.objId, event.key, false, event.count);
        event.accepted = true;
    }

//    MouseArea
//    {
//        id: qPageMouseArea
//        anchors.fill: parent

//        onPressed: {
//            proxy.lButtonDown(qpage.objId, mouse.x, mouse.y);

//        }
//        onReleased: {
//            proxy.lButtonUp(qpage.objId, mouse.x, mouse.y);

//        }

//    }
}
