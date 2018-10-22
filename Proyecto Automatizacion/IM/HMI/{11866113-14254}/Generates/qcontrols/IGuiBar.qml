
import QtQuick 2.0
import SmartBarScaleComponent 2.0
import SmartLineComponent 1.0
import SmartRectangleComponent 1.0

IGuiViewBitmap {
    id: qSmartBar

    property int objId: 0

    // Outer rectangle properties
    property color gradientcolor: "#AAAAAA"

    // Scale font properties
    property int    qm_BarFontSize: 7
    property string qm_BarFontFamilyName: "Tahoma"
    property bool   qm_BarFontNormal: true
    property bool   qm_BarFontBold: false
    property bool   qm_BarFontItalic: false
    property bool   qm_BarFontUnderline: false
    property bool   qm_BarFontStrikeout: false

    // Limit line properties
    property bool qm_BarEnableLimitLine: false
    property var upperLimitLineObj
    property var lowerLimitLineObj
    property int barlimitlinewidth: 0
    property int barlimitlineheight: 0

    // Marker properties
    property var upperLimitMarkerObj
    property int qm_UMarkerTileWidth: 0
    property int qm_UMarkerTileHeight: 0
    property int qm_UMarkerImageID: 0
    property int qm_UMarkerTileLeft: 0
    property int qm_UMarkerTileRight: 0
    property int qm_UMarkerTileTop: 0
    property int qm_UMarkerTileBottom: 0

    property var lowerLimitMarkerObj
    property int qm_LMarkerTileWidth: 0
    property int qm_LMarkerTileHeight: 0
    property int qm_LMarkerImageID: 0
    property int qm_LMarkerTileLeft: 0
    property int qm_LMarkerTileRight: 0
    property int qm_LMarkerTileTop: 0
    property int qm_LMarkerTileBottom: 0

    // Flow bar properties
    property int flowbarorientation: 0
    property real flowbaropacity: 0

    // Scale and label properties
    property var scaleObject: undefined
    property color scalelabelcolor: "#000000"
    property int barscaleplacement: -1

    // Scale details
    property point scaleposition: Qt.point(0, 0)
    property int scalewidth: 0
    property int scaleheight: 0
    property int scalerectwidth: 0
    property int scalerectheight: 0
    property int scaleorientation: 0
    property int scalepinwidth: 0
    property int scalepinheight: 0
    property int scalelabelwidth: 0
    property int scalelabelheight: 0
    property int scalelabelpntsize: 0
    property int scalemunitwidth: 0
    property real scaleinterval: 0.0
    property real scalelowvalue: 0
    property real scalehighvalue: 0
    property int scalelabellength: 0
    property int scaledecimalplaceno: 0
    property int scaleincrementlabelmark: 0
    property int scalesubdivisioncount: 0
    property int scaledetails: 0
    property int scalemeasurementunitid: 0
    property font scalefont

    // Arrow properties
    property point bararrowltsp: Qt.point(0,0)
    property point bararrowltep: Qt.point(0,0)
    property point bararrowrdsp: Qt.point(0,0)
    property point bararrowrdep: Qt.point(0,0)
    property int  bararrowtailwidth: 0

    // LImit color properties
    property color qm_BarUpperLimitColor: "transparent"
    property color qm_BarLowerLimitColor: "transparent"
    property point segmentStartPt: Qt.point(0,0)
    property point segmentNormalPt: Qt.point(0,0)
    property point segmentHighPt: Qt.point(0,0)
    property int qm_segmentBar: 0
    property int segmentHighLimitPos: 0

    function setStatusValue (dValue)
    {
        flowBarRect.qm_nFlowbarDValue = dValue
    }

    function setLimitMarker (dUValue, bUVisibility, dLValue, bLVisibility)
    {
        barScale.setDValue(dUValue, bUVisibility, dLValue, bLVisibility);
        barScale.update();
        if (qm_segmentBar)
        {
            flowBarRect.qm_nSegmentPosition = dUValue
        }
    }

    function setArrowVisibility (dLimitArrow, bVisibility)
    {
        flowBarRect.setArrowVisiblity(dLimitArrow, bVisibility);
    }

    IGuiSmartFlowBar
    {
        id: flowBarRect
        anchors.margins: qm_BorderWidth
        qm_qParent: qSmartBar
        qm_pViewID: objId
        qm_nFlowbarTextWidth: qSmartBar.scalelabelwidth
        qm_nFlowbarTextHeight: qSmartBar.scalelabelheight
        qm_qFlowBarColor: qSmartBar.qm_TextColor
        qm_bIsSegmented: qm_segmentBar
        qm_nFlowbOrientation: qSmartBar.flowbarorientation

    }
    onQm_TextColorChanged: {
        qm_flowBarColor: qSmartBar.qm_TextColor
        flowBarRect.update();
    }

    IGuiSmartBarScale {
        id: barScale
        qm_qParent: qSmartBar
        x: scaleposition.x
        y: scaleposition.y
        width: scalerectwidth
        height: scalerectheight
        visible: (qSmartBar.barscaleplacement >= 0)
        pViewID: objId

    }
}
