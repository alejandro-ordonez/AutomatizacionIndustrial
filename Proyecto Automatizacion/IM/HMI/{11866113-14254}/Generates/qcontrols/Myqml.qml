
import QtQuick 2.0
import MyHello 2.0

MyHello
{
    id:smartwidget
       width: 30
       height: 30
       property int borderwidth: 4
       property int radius: 3
       property color gradientcolor :"#888888"
       property color gradientdarkcolor :"#444444"
       property color textcolor : "white"
       property string iofieldtext: ""
       property bool antialiasing : true

       function setValue(value)
       {
           iofieldtext = value
       }

       Rectangle
       {
           id: outerBorderRect
           smooth: antialiasing
           anchors.fill: parent
           radius: smartwidget.radius

           gradient: Gradient {
               GradientStop { position: 0.0; color: gradientcolor }
               GradientStop { position: 1.0; color: gradientdarkcolor }
           }
           border.width: 1
           border.color: gradientdarkcolor
           Rectangle{
               id: innerBorderRect
               x: parent.x + borderwidth - 1
               y: parent.y + borderwidth - 1
               width: parent.width - 2 * (borderwidth )
               height: parent.height - 2 * (borderwidth)
               color: gradientdarkcolor
               border.color: gradientdarkcolor
               border.width: 1
           }
           TextInput
           {
               x: parent.x + borderwidth
               y: parent.y + borderwidth
               width: parent.width - 2 * borderwidth - 1
               height: parent.height - 2 * borderwidth
               color: textcolor
               text : iofieldtext
               focus: true
           }
       }
}
