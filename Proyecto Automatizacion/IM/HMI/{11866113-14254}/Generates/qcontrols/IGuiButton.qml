// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 2.0

IGuiViewBitmap
{

    id: qButtonview    
    focus: qm_SmartFocus
    clip: true

    /***************************************************************************************/
    /* For Loading components
    /***************************************************************************************/
    property variant staticComponentPressed: undefined
    property variant staticComponentObjPressed: undefined
    property variant staticComponentRotationRect: undefined
    property variant staticComponentObjRotationRect: undefined

    /// @brief data for stretched image
    property bool  qm_ContentVisibility: true
    
    /// @brief function for set image
    function setContentVisibility(bVisible)
    {
        qm_ContentVisibility = bVisible;
    }

    function setZOrder(value)
    {
        z= value
    }

    Text
    {
        id: buttontext
        text: qm_DisplayText
        color: qm_TextColor
        clip: true
        visible: qm_ContentVisibility

        anchors.fill: parent
        anchors.bottomMargin: qm_MarginBottom + qm_BorderWidth
        anchors.leftMargin: qm_MarginLeft + qm_BorderWidth
        anchors.rightMargin: qm_MarginRight + qm_BorderWidth
        anchors.topMargin: qm_MarginTop + qm_BorderWidth

        horizontalAlignment: qm_ValueVarTextAlignmentHorizontal
        verticalAlignment: qm_ValueVarTextAlignmentVertical

        font.family: qm_FontFamilyName
        font.bold: qm_FontBold
        font.italic: qm_FontItalic
        font.underline: qm_FontUnderline
        font.pointSize: qm_FontSize
    }

    function setRotation()
    {
        staticComponentRotationRect = Qt.createComponent("IGuiUtilRotationRect.qml")
        buttontext.parent = staticComponentRotationRect.createObject(qButtonview,
                                                                             {
                                                                                 "rotation" : -qm_ValueVarTextOrientation
                                                                             })
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
