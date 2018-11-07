/** Template file for Ellipse/Circle */

import QtQuick 2.0
import SmartCircleEllipseComponent 1.0

IGuiView
{
        id: ellipsecomponent

        property size objsize: Qt.size(0,0)
        property int borderwidth: 0
        property int borderStyle: 0
        property int fillStyle: 0

        antialiasing: true

        /// @brief Circle/Ellipse Component implemented in C++
        IGuiSmartCircleEllipse{

            id: smartcircleellipse
            anchors.fill: parent

            penWidth: ellipsecomponent.borderwidth
            penStyle: ellipsecomponent.borderStyle
            size: ellipsecomponent.objsize
            foregroundColor: ellipsecomponent.textcolor
            backgroundcolor: ellipsecomponent.backgroundcolor
            fillStyle: ellipsecomponent.fillStyle
        }

        Component.onCompleted: {
            proxy.initProxy(ellipsecomponent,ellipsecomponent.objId)
            proxy.GetVectorGraphicData(objId);

        }

}

