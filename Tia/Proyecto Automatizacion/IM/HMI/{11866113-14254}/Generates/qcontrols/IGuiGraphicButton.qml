// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 2.0

IGuiViewBitmap
{
    id: qButtonview   

    /***************************************************************************************/
    /* For Loading components
    /***************************************************************************************/
    property variant staticComponentPressed: undefined
    property variant staticComponentObjPressed: undefined

    /// @brief data for image id
    property int qm_ButtonImageId

    /// @brief data for image
    property string qm_GraphInButton : "image://QSmartImageProvider/" + 
                                       qm_ButtonImageId + "#" +             // image id
                                       (qm_Streached ? 1 : 0) + "#" +       // streaching info                                      
                                       image.horizontalAlignment + "#" +    // horizontal alignment info
                                       image.verticalAlignment              // vertical alignment info

    /// @brief data for stretched image
    property bool  qm_Streached: false

    /// @brief data for stretched image
    property bool  qm_ContentVisibility: true

    /// @brief function for set image
    function setImage(imageid)
    {
       qm_ButtonImageId = imageid;
    }
    
    /// @brief function for set image
    function setContentVisibility(bVisible)
    {
        qm_ContentVisibility = bVisible;
    }

    function setZOrder(value)
    {
        z= value
    }

    Image
    { 
        id : image

        anchors.fill: parent
        anchors.bottomMargin: qm_MarginBottom + qm_BorderWidth
        anchors.leftMargin: qm_MarginLeft + qm_BorderWidth
        anchors.rightMargin: qm_MarginRight + qm_BorderWidth
        anchors.topMargin: qm_MarginTop + qm_BorderWidth
        
        visible: qm_ContentVisibility
        source :qm_GraphInButton

        horizontalAlignment: qm_ValueVarTextAlignmentHorizontal
        verticalAlignment: qm_ValueVarTextAlignmentVertical
        
        sourceSize.width: qButtonview.width - ((2*qm_BorderWidth) + qm_MarginLeft + qm_MarginRight)
        sourceSize.height: qButtonview.height - ((2*qm_BorderWidth) + qm_MarginBottom + qm_MarginTop)
    }

    /// @brief function for set image
    function setPressed(pressed)
    {
        if(pressed)
        {
            staticComponentPressed = Qt.createComponent("IGuiUtilPressedRect.qml")
            staticComponentObjPressed = staticComponentPressed.createObject(qButtonview,
                                                              {
                                                                  "radius" : qm_BorderCornerRadius,
                                                                  "border.color":  qm_BorderColor,
                                                                  "border.width": qm_BorderWidth + 2
                                                              })
        }
        else
        {
            if (staticComponentObjPressed !== undefined)
            {
                staticComponentObjPressed.destroy()
                staticComponentPressed.destroy()
                staticComponentPressed = undefined
                staticComponentObjPressed = undefined
            }
        }
    }
}
