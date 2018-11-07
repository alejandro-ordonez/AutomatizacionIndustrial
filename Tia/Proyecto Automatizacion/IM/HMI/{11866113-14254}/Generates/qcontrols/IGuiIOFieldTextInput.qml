
import QtQuick 2.0

Rectangle
{
       id: qTextInput
       property string qm_TextInputDispText : ""
       property bool qm_TextInputFontBold: false
       property bool qm_TextInputFontItalic: false
       property bool qm_TextInputFontUnderLine: false
       property bool qm_TextInputFontStrikeOut: false
       property string qm_TextInputFontFamilyName: "Tohoma"
       property int qm_TextInputFontSize: 8
       property int qm_TextInputTextAlignmentHorizontal : Text.AlignLeft
       property int qm_TextInputTextAlignmentVertical : Text.AlignTop
       property int  qm_TextInputLeftMargin: 1
       property int  qm_TextInputTopMargin: 1
       property int  qm_TextInputBorderWidth: 1
       property color qm_TextInputTextColor: "#000000"
       color : "transparent"

    TextInput{
        id:qIOFieldTextInput
        x: qm_TextInputLeftMargin + qm_TextInputBorderWidth
        y: qm_TextInputTopMargin + qm_TextInputBorderWidth
        height: parent.height - (qm_TextInputTopMargin + qm_TextInputBorderWidth)
        width: parent.width - (qm_TextInputTopMargin + qm_TextInputBorderWidth)
        color: qm_TextInputTextColor
        text :qm_TextInputDispText
        antialiasing : true
        horizontalAlignment: qm_TextInputTextAlignmentHorizontal
        verticalAlignment: qm_TextInputTextAlignmentVertical
        font.bold: qm_TextInputFontBold
        font.italic: qm_TextInputFontItalic
        font.underline: qm_TextInputFontUnderLine
        font.strikeout: qm_TextInputFontStrikeOut
        font.family: qm_TextInputFontFamilyName
        font.pointSize: qm_TextInputFontSize
        cursorVisible:  false
        clip:true
        readOnly: true
        autoScroll: false

        MouseArea
        {
            id: mouseArea
            anchors.fill: parent

            onPressed: {
                 proxy.lButtonDown(qIOFieldView.objId, mouse.x, mouse.y)
                mouse.accepted = true
            }

            onReleased: {
                if(containsMouse)
                {
                   proxy.lButtonUp(qIOFieldView.objId, mouse.x, mouse.y)
                   mouse.accepted = true
                }
            }
        }

        Component.onCompleted:
        {
            qIOFieldTextInput.selectAll();
        }

    }

    function setValue(value)
    {
        qm_TextInputDispText = value
        qIOFieldTextInput.selectAll();
    }
}
