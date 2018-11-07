// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 2.0
import SmartRectangleComponent 1.0

IGuiView
{
        id: rectanglcomp

        antialiasing: true
        smooth: true

        property int qm_BorderStyle: 0
        property int qm_FillStyle: 0
        property int qm_Height: 0
        property int qm_Width: 0
        property int qm_RectangleRadiusHorizontal: 0
        property int qm_RectangleRadiusVertical: 0

        /// @brief Rectangle Component implemented in C++
        IGuiSmartRectangle{

            id: smartrectangle
            anchors.fill: parent

            anchors.centerIn: parent

            penWidth: rectanglcomp.qm_BorderWidth
            penStyle: rectanglcomp.qm_BorderStyle
            vectheight : qm_Height
            vectwidth : qm_Width
            foregroundColor: rectanglcomp.qm_TextColor
            backgroundcolor: rectanglcomp.qm_FillColor
            fillStyle: rectanglcomp.qm_FillStyle
            cornerradiushor: rectanglcomp.qm_RectangleRadiusHorizontal
            cornerradiusver: rectanglcomp.qm_RectangleRadiusVertical
        }
}

