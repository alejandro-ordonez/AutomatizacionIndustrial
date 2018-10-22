import QtQuick 2.0

IGuiViewBitmap{
    id:qIOFieldView

    property bool qm_passwordMode: false
    property variant staticComponent: undefined
    property variant staticComponentObj: undefined

    //For Dynamic loading of components
    property variant staticComponentRotationRect: undefined
    property variant staticComponentObjRotationRect: undefined

    //For Dynamic loading of TextInput component
    property variant staticComponentTextInput: undefined
    property variant staticComponentObjTextInput: undefined

    // load edit field QML
    function startEditMode(editFieldRef, editFieldValue, editFieldType, passwordMode, highlightText)
    {
        unloadIOFieldTextInput();
        qIOFieldView.z = 1
        staticComponent = Qt.createComponent("IGuiEditfield.qml")
        staticComponentObj = staticComponent.createObject(qIOFieldView,
                                                          {
                                                                 "x": qIOFieldText.x,
                                                                 "y": qIOFieldText.y,
                                                                 "width": qIOFieldText.width,
                                                                 "height": qIOFieldText.height,
                                                                 "color" : qm_FillColor,
                                                                 "radius": qm_BorderCornerRadius,
                                                                 "qm_EditFieldText":editFieldValue,
                                                                 "qm_EditFieldFontBold": qm_FontBold,
                                                                 "qm_EditFieldFontItalic": qm_FontItalic,
                                                                 "qm_EditFieldFontUnderLine": qm_FontUnderline,
                                                                 "qm_EditFieldFontStrikeOut": qm_FontStrikeout,
                                                                 "qm_EditFieldFontFamilyName": qm_FontFamilyName,
                                                                 "qm_EditFieldFontSize": qm_FontSize,
                                                                 "qm_EditFieldTextColor":qm_TextColor,
                                                                 "qm_EditFieldPasswordMode":qm_passwordMode,
                                                                 "qm_EditFieldTextAlignmentHorizontal": qm_ValueVarTextAlignmentHorizontal,
                                                                 "qm_EditFieldTextAlignmentVertical": qm_ValueVarTextAlignmentVertical,
                                                                 "qm_EditFieldObjid":editFieldRef
                                                           }
                                                          )

        if (staticComponentObj !== undefined)
        {
            staticComponentObj.editModeOff.connect(stopEditMode)
        }
    }

    // unload edit field QML
    function stopEditMode()
    {
        if(qm_SmartFocus)
            loadIOFieldTextInput();
        qIOFieldView.z = 0
        if(staticComponentObj !== undefined)
        {
            staticComponentObj.destroy()
            staticComponent.destroy()
            staticComponent = undefined
            staticComponentObj = undefined
        }
        qIOFieldView.forceActiveFocus()
    }
    // Set text
    onQmDisplayTextChanged:{
        // setValue called for a focussed IOField
        if(staticComponentObjTextInput !== undefined)
        {
            staticComponentObjTextInput.setValue(qm_DisplayText);
        }

    }

    /// @brief Helper-function for focus
    function handleFocus()
    {
       if(false === qm_SmartFocus) // ?? what is the relevance of this, should loadIOFieldTextInput() be called before
       {
           qm_SmartFocus = true;
       }
       qIOFieldText.visible = false;
       loadIOFieldTextInput();
    }

    /// @brief Function to hadle focus loss
    function handleFocusLoss()
    {
        unloadIOFieldTextInput();
        qIOFieldText.visible = true;
        qm_SmartFocus = false;
    }

    /// @brief Function to set the transparency
    function setTransparent(value)
    {
        if(value)
        {
            enableObject(false);
            fillRect.color = "transparent";
        }
        else
        {
            enableObject(true);
            fillRect.color = qm_FillColor;
        }
    }

    Text{
        id:qIOFieldText
        color: qIOFieldView.qm_TextColor
        text :qm_DisplayText
        antialiasing : true
        anchors.fill: parent
        anchors.bottomMargin: qIOFieldView.qm_MarginBottom + qIOFieldView.qm_BorderWidth
        anchors.leftMargin: qIOFieldView.qm_MarginLeft + qIOFieldView.qm_BorderWidth
        anchors.rightMargin: qIOFieldView.qm_MarginRight + qIOFieldView.qm_BorderWidth
        anchors.topMargin: qIOFieldView.qm_MarginTop + qIOFieldView.qm_BorderWidth
        horizontalAlignment: qIOFieldView.qm_ValueVarTextAlignmentHorizontal
        verticalAlignment: qIOFieldView.qm_ValueVarTextAlignmentVertical
        font.bold: qm_FontBold
        font.italic: qm_FontItalic
        font.underline: qm_FontUnderline
        font.strikeout: qm_FontStrikeout
        font.family: qm_FontFamilyName
        font.pointSize: qm_FontSize
        clip:true
        elide : Text.ElideRight

        MouseArea
        {
            id: mouseArea
            anchors.fill: parent

            onPressed: {
                if(!qm_SmartFocus)
                 {
                    qIOFieldView.setItemFocus(true);
                 }                

                 proxy.lButtonDown(objId, mouse.x, mouse.y)

                mouse.accepted = true
            }
            onReleased: {
                if(containsMouse)
                {
                   proxy.lButtonUp(objId, mouse.x, mouse.y)
                   mouse.accepted = true
                }
            }
        }
    }

   function setRotation()
   {
       staticComponentRotationRect = Qt.createComponent("IGuiUtilRotationRect.qml")
       qIOFieldText.parent = staticComponentRotationRect.createObject(qIOFieldView,
                                                                            {
                                                                                "rotation" : -qm_ValueVarTextOrientation
                                                                            })
   }

   function loadIOFieldTextInput()
   {
       if(staticComponentObjTextInput === undefined)
       {
           staticComponentTextInput = Qt.createComponent("IGuiIOFieldTextInput.qml")
            staticComponentObjTextInput = staticComponentTextInput.createObject(qIOFieldView,
                                                                                {
                                                                                    "x": qIOFieldText.x,
                                                                                    "y": qIOFieldText.y,
                                                                                    "width": qIOFieldText.width,
                                                                                    "height": qIOFieldText.height,
                                                                                    "qm_EditFieldTextColor":qm_TextColor,
                                                                                    "radius": qIOFieldView.qm_BorderCornerRadius,
                                                                                    "qm_TextInputDispText"  : qm_DisplayText,
                                                                                    "qm_TextInputTextAlignmentHorizontal" : qIOFieldView.qm_ValueVarTextAlignmentHorizontal,
                                                                                    "qm_TextInputTextAlignmentVertical" : qIOFieldView.qm_ValueVarTextAlignmentVertical,
                                                                                    "qm_TextInputFontBold" : qIOFieldView.qm_FontBold,
                                                                                    "qm_TextInputFontItalic" : qIOFieldView.qm_FontItalic,
                                                                                    "qm_TextInputFontUnderLine": qIOFieldView.qm_FontUnderline,
                                                                                    "qm_TextInputFontStrikeOut" : qIOFieldView.qm_FontStrikeout,
                                                                                    "qm_TextInputFontFamilyName" : qIOFieldView.qm_FontFamilyName,
                                                                                    "qm_TextInputFontSize" : qIOFieldView.qm_FontSize
                                                                                })
       }
   }

   function unloadIOFieldTextInput()
   {
       if(staticComponentObjTextInput !== undefined)
       {
           staticComponentObjTextInput.destroy()
           staticComponentTextInput.destroy()
           staticComponentObjTextInput = undefined
           staticComponentTextInput = undefined
       }
   }
}
