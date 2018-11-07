/** Template file for Ellipse/Circle */

import QtQuick 2.0
import SmartEllipseComponent 1.0

IGuiView
{
        id: ellipsecomponent

        antialiasing: true        

        property int qm_BorderStyle: 0
        property int qm_FillStyle: 0
        property int qm_Height: 0
        property int qm_Width: 0

        /// @brief Circle/Ellipse Component implemented in C++
        IGuiSmartEllipse{

            id: smartellipse
            anchors.fill: parent
            anchors.centerIn: parent

            penWidth: ellipsecomponent.qm_BorderWidth
            penStyle: ellipsecomponent.qm_BorderStyle
            vectheight : qm_Height
            vectwidth : qm_Width
            foregroundColor: ellipsecomponent.qm_TextColor
            backgroundcolor: ellipsecomponent.qm_FillColor
            fillStyle: ellipsecomponent.qm_FillStyle
        }
}

