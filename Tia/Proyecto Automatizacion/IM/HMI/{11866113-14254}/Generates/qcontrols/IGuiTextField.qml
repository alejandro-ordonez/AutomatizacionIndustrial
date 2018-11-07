// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 2.0
IGuiViewBitmap{

    id:viewtextfield
    property int qm_WrapMode: Text.NoWrap

    //For Dynamic loading of components
    property variant staticComponentRotationRect: undefined
    property variant staticComponentObjRotationRect: undefined

    function setWarpMode()
    {
        qm_WrapMode = Text.WordWrap
    }

    enabled: true
    Text {
        id:textfield
        clip:true

        text: qm_DisplayText
        color: qm_TextColor

        anchors.fill: parent
        font.family: qm_FontFamilyName
        font.pointSize: qm_FontSize;
        font.bold: qm_FontBold
        font.italic: qm_FontItalic
        font.underline: qm_FontUnderline
        font.strikeout: qm_FontStrikeout

        anchors.topMargin: qm_MarginTop + qm_BorderWidth
        anchors.rightMargin: qm_MarginRight  + qm_BorderWidth
        anchors.leftMargin: qm_MarginLeft + qm_BorderWidth
        anchors.bottomMargin: qm_MarginBottom + qm_BorderWidth

        horizontalAlignment:qm_ValueVarTextAlignmentHorizontal
        verticalAlignment:qm_ValueVarTextAlignmentVertical
        wrapMode: qm_WrapMode
    }

    MouseArea
    {
        id:mouseArea
        anchors.fill: parent
        onPressed: {
            proxy.lButtonDown(objId, mouse.x, mouse.y);
        }
        onReleased: {
            if(containsMouse)
            {
                proxy.lButtonUp(objId, mouse.x, mouse.y);
            }
        }
    }

    function setRotation()
    {
        staticComponentRotationRect = Qt.createComponent("IGuiUtilRotationRect.qml")
        textfield.parent = staticComponentRotationRect.createObject(viewtextfield,
                                                                             {
                                                                                 "rotation" : -qm_ValueVarTextOrientation
                                                                             })
    }
    
}


