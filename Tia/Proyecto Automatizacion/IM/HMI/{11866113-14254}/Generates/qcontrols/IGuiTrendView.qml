import QtQuick 2.0
import SmartWidget 2.0
//import SmartScale 2.0

IGuiViewBitmap
{
    id:qIGuiTrendView
    clip: true
    property string rulerColor: "#000000"
    property int qm_TrendXPos: 0
    property int qm_TrendYPos: 0
    property int qm_TrendWidth: 0
    property int qm_TrendHeight: 0
    property bool rulerVisibility: false

    // @brief Function to hadle focus Gain
    function handleFocus()
    {
        staticComponentFocused = Qt.createComponent("IGuiUtilFocusedRect.qml")
        staticComponentObjFocused = staticComponentFocused.createObject(trendArea,
                                                          {
                                                             "border.color":  qm_FocusColor,
                                                             "border.width": qm_FocusWidth
                                                          })
        qm_SmartFocus = true;
    }

    /// @brief Function to hadle focus loss
    function handleFocusLoss()
    {
        if (staticComponentObjFocused !== undefined)
        {
            staticComponentObjFocused.destroy()
            staticComponentFocused.destroy()
            staticComponentFocused = undefined
            staticComponentObjFocused = undefined
        }
        qm_SmartFocus = false;
    }

    function setStatusValue(ptr)
    {
        //Function to Update Values from View to TrendArea
        trendArea.pTrendPlotingData = ptr;
    }

    // Trend Vertical Scale
    IGuiTrendScale
    {
        id:trendVerticalRScale
        color: trendArea.m_TrendForeGrndColor
        isHorizontalScale : false
        isVerticalRightScale: true
        width: parent.width
        height: parent.height
        pViewID: objId
    }
    IGuiTrendScale
    {
        id:trendVerticalLScale
        color: trendArea.m_TrendForeGrndColor
        isHorizontalScale : false
        isVerticalRightScale: false
        width: parent.width
        height: parent.height
        pViewID: objId
    }

    // Trend Horizontal Scale
    IGuiTrendScale
    {
        id:trendHorizontalScale
        color: trendArea.m_TrendForeGrndColor
        isHorizontalScale: true
        width: parent.width
        height: parent.height
        pViewID: objId
    }
    //Trend Area
    IGuiTrendArea
    {
        id: trendArea
        pViewID: objId
        //set Default Values will be changed in The Qt Code
        x:qm_TrendXPos
        y:qm_TrendYPos
        width: qm_TrendWidth;
        height: qm_TrendHeight;
        objectName: "trendArea"
        isRulerVisible: rulerVisibility
        pTrendPlotingData: 0;
        nMouseClickXPos: 0;
        m_ptrendVerticalRScale: trendVerticalRScale
        m_ptrendVerticalLScale: trendVerticalLScale
        m_ptrendHorizontalScale: trendHorizontalScale

    }
    Rectangle{
        id: trendRuler
        x: trendArea.nMouseClickXPos
        y: qm_TrendYPos
        height: trendArea.TrendHeight
        visible: trendArea.isRulerVisible
        width: 1
        color: rulerColor
    }
    MouseArea
    {
        id: trendViewMouseArea
        anchors.fill: trendArea

        onMouseXChanged:
        {
            //Y axis of the Mouse is handeled Validated QML,
            //X axis of the Mouse click is Validated in C++
            if(trendViewMouseArea.mouseY <=  qm_TrendYPos + trendArea.TrendHeight)
            {
                trendArea.nMouseClickXPos = trendViewMouseArea.mouseX
            }
            proxy.invalidatedEvent(objId);
        }

        onPressed: {
            if(false == qm_SmartFocus)
                setItemFocus(true)
            proxy.lButtonDown(qIGuiTrendView.objId, mouse.x, mouse.y);
        }
        onReleased: {
            proxy.lButtonUp(qIGuiTrendView.objId, mouse.x, mouse.y);
        }
    }
    /* Un-Commented it for Test Mouse Click Position in Trend Area*/
//    Text {
//        id: debugMouseClick
//        x:0;
//        y: parent.height - 20
//        text: qsTr("x = " + trendViewMouseArea.mouseX + " y = " + trendViewMouseArea.mouseY)
//    }

}
