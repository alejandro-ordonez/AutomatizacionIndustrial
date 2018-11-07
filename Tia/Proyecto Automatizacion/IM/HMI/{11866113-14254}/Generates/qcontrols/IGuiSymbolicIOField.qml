import QtQuick 2.0
import SmartSymIOComponent 1.0

IGuiViewBitmap
{
    id:qSymIOFieldView
    property int  qm_GraphicImageId: 0
    /// @brief data for Down Button image
    property string qm_DownButton : "image://QSmartImageProvider/" +
                                       qm_GraphicImageId  + "#" +       // image id
                                       2       + "#" +                  // streaching info
                                       4       + "#" +                  // horizontal alignment info
                                       128     + "#" +                  // vertical alignment info
                                       1                                // cache info
    /// @brief data is Down Button Visible or not
    property bool qm_IsDownButtonVisible:true
    /// @brief data for no of visible rows
    property int qm_NoOfVisibleRows:4
    /// @brief data for no of visible Entries
    property int qm_NoOfVisibleEntries:4
    /// @brief data for Hot Area Width
    property int qm_HotAreaWidth:0
    ///@brief data for  touchpad component and object
    property variant staticTouchComponent: undefined
    property variant staticTouchComponentObj: undefined
    ///@brief data for Symbolic IO field type
    property int qm_SymIOType :0
    ///@brief type of COMBO
    property int qm_ComboType : 0 //Default SymIO type
    ///@brief List Control properties
    property color qm_SymIOSelBackFillColor:"transparent"
    property color qm_SymIOSelForeColor:"transparent"
    property color qm_SymIOAltBackFillColor:"transparent"
    property int qm_listHeight:0
    property int qm_tableRowHeight: qDisplayText.font.pixelSize
    property int qm_NoOfSymIoTextListItems:0
    property int qm_touchpadY: 0
    property int qm_touchpadX: 0
    property var qm_TouchpadParent


     //For Dynamic loading of components
    property variant staticComponentRotationRect: undefined
    property variant staticComponentObjRotationRect: undefined

    /// load edit field QML
    function startEditMode(editFieldRef,editFieldValue, editFieldType, passwordMode, highlightText)
    {
        qSymIOFieldView.z = 255
        if(editFieldType === 1)
        {

            fillRect.color = qSymIOFieldView.qm_FillColor
            qDisplayText.color = qSymIOFieldView.qm_TextColor
            qSmartSymio.calculateListControlheight();
            qSmartSymio.calculateAndSetTouchpadPositionY();
            staticTouchComponent = Qt.createComponent("IGuiTouchpad.qml")
            staticTouchComponentObj = staticTouchComponent.createObject(qSmartSymio.qm_TouchpadParent,
                                                                        {
                                                                            "qm_TouchpadInputQml":"IGuiSymioListEdit.qml",
                                                                            "qm_TouchPadXposition":qSmartSymio.qm_touchpadX,
                                                                            "qm_TouchPadYposition":qSmartSymio.qm_touchpadY,
                                                                            "qm_TouchPadType":editFieldType,
                                                                            "qm_TouchPadWidth": qSymIOFieldView.width,
                                                                            "qm_TouchPadHeight":qSmartSymio.qm_listHeight,
                                                                            "qm_TouchPadcolor": qSymIOFieldView.qm_FillColor,
                                                                            "qm_TouchPadBorderColor":qSymIOFieldView.qm_BorderColor,
                                                                            "qm_TextColor":qSymIOFieldView.qm_TextColor,
                                                                            "qm_TextVAlign":qSymIOFieldView.qm_ValueVarTextAlignmentVertical,
                                                                            "qm_TextHAlign":qSymIOFieldView.qm_ValueVarTextAlignmentHorizontal,
                                                                            "qm_TextMarginLeft":qSymIOFieldView.qm_MarginLeft,
                                                                            "qm_TextMarginRight":qSymIOFieldView.qm_MarginRight,
                                                                            "qm_TextMarginTop":qSymIOFieldView.qm_MarginTop,
                                                                            "qm_TextMarginBottom":qSymIOFieldView.qm_MarginBottom,
                                                                            "qm_TextRowHeight":qSymIOFieldView.qm_tableRowHeight,
                                                                            "qm_TextFontFamilyName":qSymIOFieldView.qm_FontFamilyName,
                                                                            "qm_TextFontSize":qSymIOFieldView.qm_FontSize,
                                                                            "qm_TextFontBold":qSymIOFieldView.qm_FontBold,
                                                                            "qm_TextFontItalic":qSymIOFieldView.qm_FontItalic,
                                                                            "qm_TextFontNormal":qSymIOFieldView.qm_FontNormal,
                                                                            "qm_TextFontUnderline":qSymIOFieldView.qm_FontUnderline,
                                                                            "qm_TextFontFontStrikeout":qSymIOFieldView.qm_FontStrikeout,
                                                                            "qm_NoOfVisibleRows":qSmartSymio.qm_NoOfVisibleEntries,
                                                                            "qm_ListCtrlSelBackColor":qSymIOFieldView.qm_SymIOSelBackFillColor,
                                                                            "qm_ListCtrlSelForeColor":qSymIOFieldView.qm_SymIOSelForeColor,
                                                                            "qm_ListCtrlAlternateRowColor":qSymIOFieldView.qm_SymIOAltBackFillColor
                                                                        })
            staticTouchComponentObj.editModeOff.connect(doStopEditMode)
        }
    }

    /// unload edit field QML
    function doStopEditMode()
    {
        qSymIOFieldView.z = 0
        if(staticTouchComponentObj !== undefined)
        {
            staticTouchComponentObj.objectName = ""
            staticTouchComponentObj.destroy ()
            staticTouchComponentObj = undefined
            staticTouchComponent.destroy()
            staticTouchComponent = undefined
        }

        qSymIOFieldView.forceActiveFocus()
    }

    /// @brief Helper-function for focus
    function handleFocus()
    {
        //Inform backend to handle focus change
        qm_SmartFocus = true;
        if(qm_SymIOType === 1)
        {
            if(staticTouchComponentObj === undefined)
            {
                fillRect.color = qSymIOFieldView.qm_SymIOSelBackFillColor
                qDisplayText.color = qSymIOFieldView.qm_SymIOSelForeColor
            }

        }
    }

    /// @brief Function to hadle focus loss
    function handleFocusLoss()
    {
        if(qm_SymIOType === 1)
        {
            fillRect.color = qSymIOFieldView.qm_FillColor
            qDisplayText.color = qSymIOFieldView.qm_TextColor
        }
        qm_SmartFocus = false;
    }

    Text
    {
        id:qDisplayText
        anchors.fill: parent
        text:qm_DisplayText
        color: qSymIOFieldView.qm_TextColor
        anchors.bottomMargin: qSymIOFieldView.qm_MarginBottom + qSymIOFieldView.qm_BorderWidth
        anchors.leftMargin: qSymIOFieldView.qm_MarginLeft + qSymIOFieldView.qm_BorderWidth
        anchors.rightMargin:(qm_IsDownButtonVisible == false)? (qSymIOFieldView.qm_MarginRight + qSymIOFieldView.qm_BorderWidth)
                                      : (qSymIOFieldView.qm_MarginRight + qSymIOFieldView.qm_BorderWidth+qm_HotAreaWidth)
        anchors.topMargin: qSymIOFieldView.qm_MarginTop + qSymIOFieldView.qm_BorderWidth
        horizontalAlignment: qSymIOFieldView.qm_ValueVarTextAlignmentHorizontal
        verticalAlignment: qSymIOFieldView.qm_ValueVarTextAlignmentVertical
        font.bold: qm_FontBold
        font.italic: qm_FontItalic
        font.underline: qm_FontUnderline
        font.strikeout: qm_FontStrikeout
        font.family: qm_FontFamilyName
        font.pointSize: qm_FontSize
        clip:true        
    }
    IGuiSmartSymIO{
        id:qSmartSymio
        parent:qSymIOFieldView
        qm_NoOfVisibleRows:qSymIOFieldView.qm_NoOfVisibleRows
        qm_NoOfVisibleEntries:qSymIOFieldView.qm_NoOfVisibleEntries
        qm_NoOfSymIoTextListItems:qSymIOFieldView.qm_NoOfSymIoTextListItems
        qm_tableRowHeight:qSymIOFieldView.qm_tableRowHeight
        qm_MarginTop:qSymIOFieldView.qm_MarginTop
        qm_MarginBottom:qSymIOFieldView.qm_MarginBottom
        qm_SymioHeight:qSymIOFieldView.height
        qm_SymioY:qSymIOFieldView.y
        qm_ParentHeight:parent.parent.height
        qm_ComboType:qSymIOFieldView.qm_ComboType
    }

    Item
    {
        id:qDownButtonRect
        x: (qSymIOFieldView.width -(qm_HotAreaWidth +qm_BorderWidth))
        height:qSymIOFieldView.height
        width:qm_HotAreaWidth
        visible: ((qm_IsDownButtonVisible == false))? false : true
        Image
        {
            id:qDownArrowImage
            source:qm_DownButton
            anchors.centerIn: qDownButtonRect
        }
    }


    function setRotation()
    {
        staticComponentRotationRect = Qt.createComponent("IGuiUtilRotationRect.qml")
        qDisplayText.parent = staticComponentRotationRect.createObject(qSymIOFieldView,
                                                                             {
                                                                                 "rotation" : -qm_ValueVarTextOrientation
                                                                             })
    }
}



