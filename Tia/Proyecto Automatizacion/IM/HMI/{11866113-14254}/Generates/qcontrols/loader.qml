import QtQuick 2.0
Item{
    width: 640
    height: 480

    Rectangle{
        x: 200
        y: 60
        width: 150
        height: 50
        color: "green"
     Text{
         font.pointSize: 16
         text: "Start RT"
     }
     MouseArea{
         hoverEnabled: true
         anchors.fill: parent

         onPressed: {
             loader_plugin.startRT();
         }
     }

    }

   /* Rectangle{
        x: 10
        y: 60
        width: 150
        height: 50
        color: "red"
     Text{
         font.pointSize: 16
         text: "Stop RT"
     }
     MouseArea{
         hoverEnabled: true
         anchors.fill: parent

         onPressed: {
             loader_plugin.stopRT();
         }
     }
    }*/

}
