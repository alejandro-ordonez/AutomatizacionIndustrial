//// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 2.0
import SmartLineComponent 1.0

IGuiView
{
        id: linecomponent

        antialiasing: true
        smooth: true

        property int qm_BorderStyle: 0
        property int qm_FillStyle: 0
        property int qm_Height: 0
        property int qm_Width: 0
        property int qm_LineWidth: 0
        property int qm_LineStartArrow: 0
        property int qm_LineEndArrow: 0
        property int qm_LineEndsShape: 0

        /// @brief Line Component implemented in C++
         IGuiSmartLine {
               id : smartline
               anchors.fill: parent
               penWidth: linecomponent.qm_LineWidth
               penStyle: linecomponent.qm_BorderStyle
               backgroundcolor: linecomponent.qm_FillColor
               foregroundColor : linecomponent.qm_TextColor
               lineStartArrow: linecomponent.qm_LineStartArrow
               lineEndArrow: linecomponent.qm_LineEndArrow
               lineEndsShape: linecomponent.qm_LineEndsShape
               fillStyle: linecomponent.qm_FillStyle
        }

         function setLinePoints(startX,startY,endX,endY)
         {
              smartline.lineStartPoint.x = startX
              smartline.lineStartPoint.y = startY
              smartline.lineEndPoint .x = endX
              smartline.lineEndPoint .y = endY
              smartline.update();
         }
}

