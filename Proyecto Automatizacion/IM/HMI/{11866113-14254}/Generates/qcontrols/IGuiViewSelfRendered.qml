import QtQuick 2.0

Item{

    id : qFillcolorRect
    anchors.fill: parent
    z : -1
    property color fillcolor: parent.qm_FillColor
    property int borderWidth: parent.qm_BorderWidth
    property color borderColor: parent.qm_BorderColor
    property int radius: parent.qm_ValueVarTextOrientation

    Rectangle{
        anchors.fill: parent
        color : fillcolor
        border.width: borderWidth
        border.color: borderColor
        radius: radius
    }
}
