import QtQuick 2.0

Rectangle
{
     id : sandglassrectangle
     x: 0
     y: 0
     z: 280

     width: 32
     height: 32

     function setPosition (x, y)
     {
         sandglassrectangle.x = x;
         sandglassrectangle.y = y;
     }

     Image
     {
         id: sandglass
         source: "./pics/sandglass.bmp"
         anchors.fill: parent
         fillMode: Image.PreserveAspectFit
     }
}
