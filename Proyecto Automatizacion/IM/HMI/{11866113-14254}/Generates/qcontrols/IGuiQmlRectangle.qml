// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 2.0

IGuiView
{
        id: rectanglcomp

        property int qm_Height: 0
        property int qm_Width: 0

        /// @brief Rectangle Component implemented in C++
        Rectangle{
            id: smartrectangle
            anchors.centerIn: parent
            height: qm_Height
            width: qm_Width
            color: qm_FillColor
            border.color: qm_TextColor
            border.width: qm_BorderWidth
       }
}

