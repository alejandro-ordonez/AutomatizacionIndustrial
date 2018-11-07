import QtQuick 2.0

IGuiView{

    id: qSmartBitmapWidget

    property Rectangle fillRect : qFillcolorRect

    Rectangle{

        id : qFillcolorRect
        height: qm_FillRectHeight
        width: qm_FillRectWidth
        anchors.centerIn: parent
        z : -1

        /// @brief Assign radius of the view
        radius: qm_BorderCornerRadius

        /// @brief Background color of the view
        color: qm_FillColor
   }

    /// @brief Loading tiled bitmap image
    BorderImage {
        id: bimage
        source: "image://QSmartImageProvider/" + qm_ImageID
        anchors.fill: parent

        border.left: qm_TileLeft;
        border.top: qm_TileTop;
        border.right: qm_TileRight;
        border.bottom: qm_TileBottom;

        horizontalTileMode: BorderImage.Repeat
        verticalTileMode: BorderImage.Repeat
    }
}
