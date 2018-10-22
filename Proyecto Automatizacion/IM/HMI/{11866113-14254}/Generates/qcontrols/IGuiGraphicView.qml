
import QtQuick 2.0

IGuiViewBitmap{

    id: qGraphicsview

    // Graphics view properties
    property int imageid

    property string image_url: "image://QSmartImageProvider/"+ 
                                       imageid + "#" +                      // image id
                                       (imageStreched ? 1 : 0) + "#" +      // streaching info                                      
                                       image.horizontalAlignment + "#" +    // horizontal alignment info
                                       image.verticalAlignment              // vertical alignment info

    property bool imageStreched: imageStreched

    property bool  qm_ContentVisibility: true

    /// @brief function for set image
    function setContentVisibility(bVisible)
    {
        qm_ContentVisibility = bVisible;
    }

    /// @brief function for set image
   function setImage(imgid)
   {
       imageid = imgid;       
   }

    // For loading image
    Image
    {
        id: image
        source :image_url

        visible: qm_ContentVisibility
        cache: false
        
        anchors.fill: parent
        anchors.bottomMargin: qm_MarginBottom + qm_BorderWidth
        anchors.leftMargin: qm_MarginLeft + qm_BorderWidth
        anchors.rightMargin: qm_MarginRight + qm_BorderWidth
        anchors.topMargin: qm_MarginTop + qm_BorderWidth

        horizontalAlignment: qm_ValueVarTextAlignmentHorizontal
        verticalAlignment: qm_ValueVarTextAlignmentVertical

        sourceSize.width: qGraphicsview.width - ((2*qm_BorderWidth) + qm_MarginLeft + qm_MarginRight)
        sourceSize.height: qGraphicsview.height - ((2*qm_BorderWidth) + qm_MarginBottom + qm_MarginTop)

    }

}


