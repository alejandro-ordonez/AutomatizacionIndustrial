import QtQuick 2.0

Rectangle {
    id: tiledborderimage
    radius: smartwidget.radius
    color: smartwidget.backgroundcolor
    anchors.fill: parent
    height: smartwidget.tileHeight
    width: smartwidget.tileWidth

    BorderImage {
        id: bimage
        source: smartwidget.imageSrc
        anchors.fill: parent

        border.left: smartwidget.tileLeft;
        border.top: smartwidget.tileTop;
        border.right: smartwidget.tileRight;
        border.bottom: smartwidget.tileBottom;

        horizontalTileMode: BorderImage.Round
        verticalTileMode: BorderImage.Round

    }
}

