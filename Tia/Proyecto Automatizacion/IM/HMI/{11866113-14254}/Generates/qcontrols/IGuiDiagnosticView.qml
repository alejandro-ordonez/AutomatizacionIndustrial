import QtQuick 2.0

IGuiViewBitmap {
    id: qmDiagnosticView

    property string listObjName: "qu" + objId

    //TODO: Check with es2rt as header for diagnostic view will be removed
    property color qm_headerTextColor: "#ff000000"
    property color qm_headerBackColor: "#ababab"
    property int qm_headerValueVarTextAlignmentHorizontal: Text.AlignLeft
    property int qm_headerValueVarTextAlignmentVertical: Text.AlignVCenter
    property int qm_headerValueVarTextOrientation: 0
    property int qm_headerMarginLeft: 0
    property int qm_headerMarginRight: 0
    property int qm_headerMarginBottom: 0
    property int qm_headerMarginTop: 0
    property int qm_headerFontSize: 7
    property string qm_headerFontFamilyName: "Tahoma"
    property bool qm_headerFontBold: true
    property bool qm_headerFontItalic: false
    property bool qm_headerFontUnderline:false
    property int qm_headerTextPosX: 0
    property int qm_headerTextPosY: 0
    property int qm_headerTextWidth: 0
    property int qm_headerTextHeight: 0

    property color qm_errorLineBackColor: "#ff000000"
    property color qm_errorLineTextColor: "#ffff0000"
    property int qm_errorLineValueVarTextAlignmentHorizontal: Text.AlignLeft
    property int qm_errorLineValueVarTextAlignmentVertical: Text.AlignVCenter
    property int qm_errorLineValueVarTextOrientation: 0
    property int qm_errorLineMarginLeft: 0
    property int qm_errorLineMarginRight: 0
    property int qm_errorLineMarginBottom: 0
    property int qm_errorLineMarginTop: 0

    property int qm_diagViewToolbarPosX: 0
    property int qm_diagViewToolbarPosY: 0
    property int qm_diagViewToolbarWidth: 576
    property int qm_diagViewToolbarHeight: 30
    property color qm_toolBarBackColor: "transparent"    
    qm_FillColor: "grey"
    property real qm_diagViewCornerRadius: 0

    property variant pageObj: undefined

    property list<Component> qm_DiagnosticListComponent

    clip: true

    Rectangle {
        x: qm_diagViewToolbarPosX
        y: qm_diagViewToolbarPosY
        width: qm_diagViewToolbarWidth
        height: qm_diagViewToolbarHeight
        color: qm_toolBarBackColor
    }

    Rectangle {
        id: headerRect

        x: qm_headerTextPosX
        y: qm_headerTextPosY
        width: qm_headerTextWidth
        height: qm_headerTextHeight
        color: qm_headerBackColor
        radius: qm_diagViewCornerRadius

        Text {
            id: headerText

            anchors.fill: parent
            text:qm_DisplayText
            color: qm_headerTextColor
            horizontalAlignment: qm_headerValueVarTextAlignmentHorizontal
            verticalAlignment: qm_headerValueVarTextAlignmentVertical
            anchors.leftMargin: qm_headerMarginLeft
            anchors.topMargin: qm_headerMarginTop
            anchors.rightMargin: qm_headerMarginRight
            anchors.bottomMargin: qm_headerMarginBottom
            elide: Text.ElideRight
            wrapMode: Text.WordWrap
            font.pointSize: qm_headerFontSize
            font.family: qm_headerFontFamilyName
            font.bold: qm_headerFontBold
            font.italic: qm_headerFontItalic
            font.underline: qm_headerFontUnderline
        }
    }

    function loadConfigurationPage (pageType) {
        pageObj = qm_DiagnosticListComponent[pageType].createObject(qmDiagnosticView,
                                                                    {
                                                                        "objectName": listObjName
                                                                    }
                                                                   )
    }

    function unloadConfigurationPage () {     
        if ((pageObj !== undefined) && (pageObj !== null)) {
            if (pageObj.objectName !== undefined) {
                pageObj.objectName = ""
            }
            pageObj.visible = false
            pageObj.enabled = false
            pageObj.destroy()
        }
    }
}
