/** Template file for Ellipse/Circle */
import QtQuick 2.0

IGuiView
{
        id: qmlCircleComponent

        property int qm_Height: 0
        property int qm_Width: 0
        property int qm_Radius: 0

        /// @brief Circle/Ellipse Component implemented in C++
        Rectangle{

            id: smartcircle
            anchors.centerIn: parent
            radius : qm_Radius
            height: qm_Height
            width: qm_Width
            color: qm_FillColor
            border.color: qm_TextColor
            border.width: qm_BorderWidth
        }
}

