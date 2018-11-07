import QtQuick 2.0

Rectangle
{
    id:qSimpleSymIO

    property int qm_objID : 0
    property string qm_DisplayText:"ABC"
    objectName: "qSimpleSymioObj"
    border.color:"black"
    property int qm_NoOfVisibleRows:3
    ///@brief data for  touchpad component and object
    property variant staticTouchComponent: undefined
    property variant staticTouchComponentObj: undefined
    ///@brief List Control properties
    property color qm_ListCtrlSelBackColor:"black"
    property color qm_ListCtrlSelForeColor:"red"
    property color qm_ListCtrlAlternateRowColor:"white"
    property int qm_listHeight:0
    property int qm_tableRowHeight: qDisplayText.font.pixelSize
    /// @brief text color
    property color qm_TextColor: "black"
    /// @brief horizontal alignment
    property int qm_ValueVarTextAlignmentHorizontal: Text.AlignLeft
    /// @brief vertical alignment
    property int qm_ValueVarTextAlignmentVertical: Text.AlignHCenter
    /// @brief text margin left
    property int qm_MarginLeft: 2
    /// @brief text margin right
    property int qm_MarginRight: 2
    /// @brief text margin top
    property int qm_MarginTop: 2
    /// @brief text margin bottom
    property int qm_MarginBottom:2
    /// @brief: To store the font family name
    property string qm_FontFamilyName: "Tahoma"
    /// @brief: Sets whether the font weight is bold.
    property bool qm_FontBold: false
    /// @brief: Sets whether the font has an italic style.
    property bool qm_FontItalic: false
    /// @brief: Sets whether the text is underlined.
    property bool qm_FontUnderline: false
    /// @brief: default text style
    property bool qm_FontNormal: false
    /// @brief: Sets whether the font has a strikeout style.
    property bool qm_FontStrikeout: false
    /// @brief: To store the font size
    property int qm_FontSize: 8
    /// @brief data for background color
    property color qm_FillColor : "white"    
    /// @brief Image ID for sym IO
    property string qm_SymIOImagePath : "pics/Down.png"
    property int qm_touchpadY: 0
    property int qm_pageHeight : 0
    property int qm_viewYPosition: 0
    property int qm_listCtrlPosition : 0

    signal editModeOff();
    function init(objid)
    {
       qSimpleSymIO.qm_objID = objid
    }

    function setFocus()
    {
        qSimpleSymIO.forceActiveFocus()
        qSimpleSymIO.focus = true
    }
    function handleParentData(symIOData)
    {
        qm_DisplayText = symIOData
    }

    /// load edit field QML
    function startEditMode(editFieldRef,editFieldValue, editFieldType, passwordMode, highlightText)
    {
        qSimpleSymIO.z = 256
        staticTouchComponent = Qt.createComponent("IGuiTouchpad.qml")
        calculateListControlheight()
        calculateAndSetTouchpadPositionY()
        staticTouchComponentObj = staticTouchComponent.createObject(qSimpleSymIO.parent.parent.parent.parent, // Creating touchpad with page as the parent, this avoids clipping of touchpad
                                                                    {
                                                                        "qm_TouchpadInputQml":"IGuiSymioListEdit.qml",
                                                                        "qm_TouchPadXposition": qSimpleSymIO.parent.parent.parent.x + qSimpleSymIO.parent.parent.x + qSimpleSymIO.parent.x+qSimpleSymIO.x,
                                                                        "qm_TouchPadYposition": qSimpleSymIO.parent.parent.parent.y + qSimpleSymIO.parent.parent.y + qSimpleSymIO.parent.y + qSimpleSymIO.y + qm_touchpadY,
                                                                        "qm_TouchPadType":editFieldType,
                                                                        "qm_TouchPadWidth": qSimpleSymIO.width,
                                                                        "qm_TouchPadHeight":qm_listHeight,
                                                                        "qm_TouchPadcolor": qSimpleSymIO.qm_FillColor,
                                                                        "qm_TouchPadBorderColor":qSimpleSymIO.border.color,
                                                                        "qm_TextColor":qSimpleSymIO.qm_TextColor,
                                                                        "qm_TextVAlign":qSimpleSymIO.qm_ValueVarTextAlignmentVertical,
                                                                        "qm_TextHAlign":qSimpleSymIO.qm_ValueVarTextAlignmentHorizontal,
                                                                        "qm_TextMarginLeft":qSimpleSymIO.qm_MarginLeft,
                                                                        "qm_TextMarginRight":qSimpleSymIO.qm_MarginRight,
                                                                        "qm_TextMarginTop":qSimpleSymIO.qm_MarginTop,
                                                                        "qm_TextMarginBottom":qSimpleSymIO.qm_MarginBottom,
                                                                        "qm_TextRowHeight":qSimpleSymIO.qm_tableRowHeight,
                                                                        "qm_TextFontFamilyName":qSimpleSymIO.qm_FontFamilyName,
                                                                        "qm_TextFontSize":qSimpleSymIO.qm_FontSize,
                                                                        "qm_TextFontBold":qSimpleSymIO.qm_FontBold,
                                                                        "qm_TextFontItalic":qSimpleSymIO.qm_FontItalic,
                                                                        "qm_TextFontNormal":qSimpleSymIO.qm_FontNormal,
                                                                        "qm_TextFontUnderline":qSimpleSymIO.qm_FontUnderline,
                                                                        "qm_TextFontFontStrikeout":qSimpleSymIO.qm_FontStrikeout,
                                                                        "qm_NoOfVisibleRows":qSimpleSymIO.qm_NoOfVisibleRows,
                                                                        "qm_ListCtrlSelBackColor":qSimpleSymIO.qm_ListCtrlSelBackColor,
                                                                        "qm_ListCtrlSelForeColor":qSimpleSymIO.qm_ListCtrlSelForeColor,
                                                                        "qm_ListCtrlAlternateRowColor":qSimpleSymIO.qm_ListCtrlAlternateRowColor
                                                                    })
            staticTouchComponentObj.editModeOff.connect(doStopEditMode)
        }

    ///Function to calculate list control height:
    function calculateListControlheight()
    {
        var qm_NoOfRows = qm_NoOfVisibleRows
        var qm_linesPerRow = 1
        var qm_gridLineWidth = 1
        /// height calculation of list control
        qm_listHeight = ((qDisplayText.font.pixelSize + qSimpleSymIO.qm_MarginTop + qSimpleSymIO.qm_MarginBottom)
                         * qm_linesPerRow + qm_gridLineWidth) * qm_NoOfRows
    }
    /// Calculates the touchpad Y position and sets it
    function calculateAndSetTouchpadPositionY()
    {
        qm_pageHeight = parent.parent.parent.parent.height
        qm_viewYPosition = parent.parent.parent.y
        qm_listCtrlPosition = parent.parent.y
        qm_touchpadY =qSimpleSymIO.height
        var qm_currentY = qm_viewYPosition + qm_listCtrlPosition + qSimpleSymIO.y
        var qm_NoOfRows
        var qm_linesPerRow = 1
        var qm_gridLineWidth = 1

        //If List Control Height is More than Page height which accomadate below
        if((qm_currentY + qSimpleSymIO.height + qm_listHeight) > qm_pageHeight)
        {
            //Check if Area Above SYMIO is more
            if(qm_currentY > (qm_pageHeight - (qm_currentY + qSimpleSymIO.height)))
            {  
                // Paint list above SymIO if Area above is more
                qm_touchpadY = -qm_listHeight
                //Check If we need resize List Control height
                if(qm_listHeight > (qm_currentY))
                {
                    qm_NoOfRows = Math.floor(((qm_currentY)/((qm_tableRowHeight + qSimpleSymIO.qm_MarginTop + qSimpleSymIO.qm_MarginBottom)
                                                      * qm_linesPerRow + qm_gridLineWidth)))
                    qm_listHeight = ((qm_tableRowHeight+ qSimpleSymIO.qm_MarginTop + qSimpleSymIO.qm_MarginBottom)
                                     * qm_linesPerRow + qm_gridLineWidth) * qm_NoOfRows
                    qm_touchpadY = -qm_listHeight
                    qm_NoOfVisibleRows = qm_NoOfRows
                }
            }
            else//if Area Below SYMIO is more
            {
                //Check If we need resize List Control height
                if(qm_listHeight > (qm_pageHeight - (qm_currentY +qSimpleSymIO.height)))
                {
                    qm_NoOfRows = Math.floor((qm_pageHeight - (qm_currentY +qSimpleSymIO.height))/((qm_tableRowHeight + qSimpleSymIO.qm_MarginTop + qSimpleSymIO.qm_MarginBottom)
                                                      * qm_linesPerRow + qm_gridLineWidth))
                    qm_listHeight = ((qm_tableRowHeight + qSimpleSymIO.qm_MarginTop + qSimpleSymIO.qm_MarginBottom)
                                     * qm_linesPerRow + qm_gridLineWidth) * qm_NoOfRows
                    qm_touchpadY =  qSimpleSymIO.height
                    qm_NoOfVisibleRows = qm_NoOfRows
                }
            }
        }
    }

    /// unload edit field QML
    function doStopEditMode()
    {
        qSimpleSymIO.z = 0

        if(staticTouchComponentObj !== undefined)
        {
            staticTouchComponentObj.objectName = ""
            staticTouchComponentObj.destroy ()
            staticTouchComponentObj = undefined
            staticTouchComponent.destroy()
            staticTouchComponent = undefined
        }
        qSimpleSymIO.forceActiveFocus()
        qSimpleSymIO.editModeOff()
    }
    //Function to unload simple symio
    function doStopSimpleSymIO()
    {
        qSimpleSymIO.z = 0

        if(staticTouchComponentObj !== undefined)
        {
            staticTouchComponentObj.objectName = ""
            staticTouchComponentObj.destroy ()
            staticTouchComponentObj = undefined
            staticTouchComponent.destroy()
            staticTouchComponent = undefined
        }
        qSimpleSymIO.forceActiveFocus()
    }

    ///Function to set the Value of the text
    function setValue(text)
    {
        qm_DisplayText = text;
    }


    Rectangle
    {
        id:qDownButtonRect
        x: (0.8 * qSimpleSymIO.width)
        height:qSimpleSymIO.height
        width:(qSimpleSymIO.width) - (0.8 * qSimpleSymIO.width)
        color:"transparent"
        border.color: "transparent"

        Image
        {
            id:qDownArrowImage
            source: qm_SymIOImagePath
            anchors.centerIn: qDownButtonRect
        }

        MouseArea{
            anchors.fill: qDownButtonRect
            onPressed: {
                utilProxy.lButtonDown(qm_objID, mouse.x, mouse.y);
                mouse.accepted = true;
            }
            onReleased: {
                if(containsMouse)
                {
                    utilProxy.lButtonDown(qm_objID, mouse.x, mouse.y);
                }
                mouse.accepted = true;
            }

        }
    }

    TextInput
    {
        id:qDisplayText
        height:qSimpleSymIO.height
        width:(0.8 * qSimpleSymIO.width)
        text:qm_DisplayText

        color: qSimpleSymIO.qm_TextColor
        anchors.bottomMargin: qSimpleSymIO.qm_MarginBottom + qSimpleSymIO.qm_BorderWidth
        anchors.leftMargin: qSimpleSymIO.qm_MarginLeft + qSimpleSymIO.qm_BorderWidth
        anchors.rightMargin:qSimpleSymIO.qm_MarginRight + qSimpleSymIO.qm_BorderWidth
        anchors.topMargin: qSimpleSymIO.qm_MarginTop + qSimpleSymIO.qm_BorderWidth
        horizontalAlignment: qSimpleSymIO.qm_ValueVarTextAlignmentHorizontal
        verticalAlignment: qSimpleSymIO.qm_ValueVarTextAlignmentVertical
        font.bold: qm_FontBold
        font.italic: qm_FontItalic
        font.underline: qm_FontUnderline
        font.strikeout: qm_FontStrikeout
        font.family: qm_FontFamilyName
        font.pointSize: qm_FontSize
        cursorVisible: false
        clip:true
        readOnly: true        
        autoScroll: false
    }
    MouseArea
    {
        anchors.fill: parent
        onPressed: {
            utilProxy.lButtonDown(qm_objID, mouse.x, mouse.y);
            mouse.accepted = true;
        }
        onReleased: {
            if(containsMouse)
            {
                utilProxy.lButtonUp(qm_objID, mouse.x, mouse.y);
            }
            mouse.accepted = true;
        }
    }
    Keys.onPressed:
    {
        utilProxy.keyHandler(qm_objID, event.key, true, event.text);
        event.accepted = true;
    }

    Keys.onReleased:
    {
        utilProxy.keyHandler(qm_objID, event.key, false, event.text);
        event.accepted = true;
    }
    Component.onCompleted: {
      qSimpleSymIO.forceActiveFocus();
    }

}
