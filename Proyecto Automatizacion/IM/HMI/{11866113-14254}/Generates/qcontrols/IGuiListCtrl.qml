// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 2.0
import QtDataModel 1.0
import QtGridline 1.0
import SmartListView 1.0

Item {
    id : smartList

    property int objRef: 0

/*    //// BORDER STYLE ////
    0: No border should be displayed
    1: Border is solid
    2: Border is solid, 3D on
*/
    // Left Header
    property int qm_leftValueVarBorder
    property int qm_leftBorderCornerRadius
    property int qm_leftBorderWidth
    property color qm_leftBorderColor
    property color qm_leftBorderColorEx1
    property color qm_leftBorderColorEx2

    property int qm_leftImageID
    property int qm_leftTileWidth
    property int qm_leftTileHeight
    property int qm_leftTileTop
    property int qm_leftTileBottom
    property int qm_leftTileRight
    property int qm_leftTileLeft

    // Middle Header
    property int qm_middleValueVarBorder
    property int qm_middleBorderCornerRadius
    property int qm_middleBorderWidth
    property color qm_middleBorderColor
    property color qm_middleBorderColorEx1
    property color qm_middleBorderColorEx2

    property int qm_middleImageID
    property int qm_middleTileWidth
    property int qm_middleTileHeight
    property int qm_middleTileTop
    property int qm_middleTileBottom
    property int qm_middleTileRight
    property int qm_middleTileLeft

    // Right Header
    property int qm_rightValueVarBorder
    property int qm_rightBorderCornerRadius
    property int qm_rightBorderWidth
    property color qm_rightBorderColor
    property color qm_rightBorderColorEx1
    property color qm_rightBorderColorEx2

    property int qm_rightImageID
    property int qm_rightTileWidth
    property int qm_rightTileHeight
    property int qm_rightTileTop
    property int qm_rightTileBottom
    property int qm_rightTileRight
    property int qm_rightTileLeft

    // Table Header text format
    property color qm_tableHeaderTextColor
    property int qm_tableHeaderValueVarTextAlignmentHorizontal
    property int qm_tableHeaderValueVarTextAlignmentVertical
    property int qm_tableHeaderValueVarTextOrientation    // specified in degrees

    property int qm_tableHeaderMarginLeft
    property int qm_tableHeaderMarginRight
    property int qm_tableHeaderMarginBottom
    property int qm_tableHeaderMarginTop

    // All Back Colors
    property color qm_tableBackColor
    property color qm_tableSelectBackColor
    property color qm_tableAlternateBackColor
    property color qm_tableHeaderBackColor

    // Table text format
    property color qm_tableTextColor
    property int qm_tableValueVarTextAlignmentHorizontal
    property int qm_tableValueVarTextAlignmentVertical
    property int qm_tableValueVarTextOrientation    // specified in degrees

    property int qm_tableMarginLeft
    property int qm_tableMarginRight
    property int qm_tableMarginBottom
    property int qm_tableMarginTop    

    property int qm_tableImageAlignmentHorizontal: Image.AlignLeft
    property int qm_tableImageAlignmentVertical: Image.AlignTop

    // Selection text format
    property color qm_tableSelectTextColor
    property int qm_tableSelectValueVarTextAlignmentHorizontal
    property int qm_tableSelectValueVarTextAlignmentVertical
    property int qm_tableSelectValueVarTextOrientation    // specified in degrees

    property int qm_tableSelectMarginLeft
    property int qm_tableSelectMarginRight
    property int qm_tableSelectMarginBottom
    property int qm_tableSelectMarginTop

    // Alternate row text format
    property color qm_tableAlternateTextColor
    property int qm_tableAlternateValueVarTextAlignmentHorizontal
    property int qm_tableAlternateValueVarTextAlignmentVertical
    property int qm_tableAlternateValueVarTextOrientation    // specified in degrees

    property int qm_tableAlternateMarginLeft
    property int qm_tableAlternateMarginRight
    property int qm_tableAlternateMarginBottom
    property int qm_tableAlternateMarginTop

    // Gridline properties
    property int qm_gridLineStyle
    property int qm_gridLineWidth
    property color qm_gridLineColor

    /* Table font information */
    property font qm_tableFont    
    property font qm_headerFont: smartlistview.headerFont
    property font qm_tableSelectFont

    //List Ctrl Row Height
    property int qm_tableRowHeight

    //List Ctrl Header Height
    property int qm_tableHeaderHeight

    // List control adjusting properties
    property bool qm_hasHeader
    property bool qm_hasGridLines
    property bool qm_hasBorder
    property bool qm_hasDisplayFocusLine
    property bool qm_hasVerticalScrolling
    property bool qm_hasVerticalScrollBar
    property bool qm_hasHorizontalScrollBar    
    property bool qm_hasColumnOrdering
    property bool qm_hasHighLightFullRow
    property bool qm_hasVerUpDownPresent
    property bool qm_hasVerPgUpDownPresent
    property bool qm_hasHighlight
    property bool qm_hasUpDownAsPageUpDown
    property bool qm_hasLongAlarmButton
    property bool qm_hasExtraPixelForLineHeight
    property bool qm_hasRowEditable
    property bool qm_hasRowJustification
    property bool qm_hasRowJustificationBottom

    // Number of lins per row
    property int qm_linesPerRow // noOfLines

    //================================
    // Properties used during run time
    //================================
    property int adjustChildModel: 1
    property int gridLineWidth: qm_hasGridLines ? qm_gridLineWidth : 0    

    // List control header properries
    property var headerObj: undefined
    property int headerHeight: qm_hasHeader ? (qm_tableHeaderHeight + qm_tableHeaderMarginTop + qm_tableHeaderMarginBottom) : 0

    // List control model manager
    property alias modelManager: theDataModel

    // Scrol bar properties
    property int qm_scrollBarSize: smartlistview.scrollBarSize
    property var verticalScrollBarObj: undefined
    property var horizontalScrollBarObj: undefined
    property real totalContentHeight: 0
    property bool scrollWithScrollBar: false    
    property var verticalScrollBarComp: undefined

    // List control column operated properties
    property int qm_noOfColumns
    property int qm_FocusLineWidth: 1 /// @brief Default focus line iwdth for all controls
    property int qm_BorderLineWidth: 1 /// @brief Draw border for the list control
    property int totalColumnWidth: smartList.width
    property int totalRowCount: smartlistview.totalRowCount
    property point qm_moveStartIndex: Qt.point(-1, -1)
    property point qm_moveEndIndex: Qt.point(-1, -1)
    property int qm_RowHeight: ((qm_tableRowHeight + qm_tableMarginTop + qm_tableMarginBottom) * qm_linesPerRow) + gridLineWidth    
    property bool qm_ContentStreached: false    

    property variant staticComponent: undefined
    property variant staticComponentObj: undefined

    property variant scrollBarHeight: 0

    onStaticComponentObjChanged: {
        if (staticComponentObj !== undefined) {
            parent.setLoadedComponentObject(staticComponentObj)
        }
    }

    onFocusChanged: {
        if(focus)
            handleFocus()
    }

    // List control initialization from SMART-RT (invokeMethod)
    function init(refID) {
        var nRowsFit = 1;
        objRef = refID;
        if (qm_linesPerRow != 0) {
            nRowsFit = (smartList.height - headerHeight) / qm_RowHeight
        }        
        utilProxy.setPageRowsFit(objRef, Math.round(nRowsFit))
    }


    // Set / Reset the focus to list control from SMART-RT (invokeMethod)
    function setFocus() {
        if(false === smartlistview.focus)
        {
            utilProxy.handleFocusChange(parent.objId, objRef);
        }
    }

    function handleFocus()
    {        
        smartlistview.focus = true;
    }

    function handleFocusLoss()
    {        
        smartlistview.focus = false;
    }

    // Utility function required for internal list control operations
    function loadStaticComponent (componentName, rowNumber, columnNumber) {
        var cellPosition = smartlistview.getCellPosition(rowNumber, columnNumber)
        var cellSize = smartlistview.getCellSize(rowNumber, columnNumber)
        staticComponent = Qt.createComponent(componentName)
        staticComponentObj = staticComponent.createObject(smartList,
                                                          {
                                                              "x": (cellPosition.x - flickListView.contentX),
                                                              "y": cellPosition.y,
                                                              "width": cellSize.width,
                                                              "height": cellSize.height
                                                          }
                                                         )
        staticComponentObj.handleParentData(theDataModel.getCellData(rowNumber, columnNumber))
    }

    function unloadStaticComponent () {
        if(staticComponentObj !== undefined)
        {
            staticComponentObj.objectName = ""
            staticComponentObj.destroy ()
            staticComponentObj = undefined
            staticComponent.destroy()
            staticComponent = undefined
        }
    }

    // TODO: replace this method in future
    function stopEditMode () {
        // unload QML static component
        if(staticComponentObj !== undefined)
        {
            utilProxy.stopListCtrlEditMode()
        }
    }

    // Update header data in model manager from SMART-RT (invokeMethod)
    function updateHeaderData(headerData) {
        if (qm_hasHeader && (headerObj == undefined)) {
            smartList.y = smartList.y + headerHeight
            smartList.height = smartList.height - headerHeight
            headerObj = headerComp.createObject(smartList.parent,
                                        {
                                            "x": smartList.x,
                                            "y": smartList.y - headerHeight
                                        }
                                       )
        }
    }

    function setVisibleRows(visibleRowCount) {
        //var listHeight = qm_RowHeight * visibleRowCount
        //smartList.height = listHeight + headerHeight
        totalColumnWidth = smartList.width
        smartlistview.height = smartList.height = (qm_RowHeight * visibleRowCount)
        smartlistview.update()
    }

    function handleScrollBar() {        
        if (horizontalScrollBarObj !== undefined) {
            horizontalScrollBarObj.opacity = horizontalScrollBarObj.enabled = (smartlistview.focus === true)
        }
        else {
            /// @brief create horizontal scroll bar only if required
            createHorizontalScrollbar()
        }

        if (verticalScrollBarObj !== undefined) {
            verticalScrollBarObj.opacity = verticalScrollBarObj.enabled = (smartlistview.focus === true)
        }
        else {
            /// @brief create vertical scroll bar only if required
            createVerticalScrollbar()
        }
    }

    function resizeVerticalScrollBar () {
        if ((totalContentHeight <= smartList.height) && (verticalScrollBarObj != undefined)) {
            verticalScrollBarObj.destroy()
            verticalScrollBarComp.destroy()
            verticalScrollBarObj = undefined
            // if vertical scroll bar is destroyed, increase horizontal scroll bar , if exists
            if (horizontalScrollBarObj !== undefined && scrollBarHeight !== smartList.height) {
                horizontalScrollBarObj.width += 6.0
            }
        } else if (verticalScrollBarObj != undefined) {
            verticalScrollBarObj.opacity = verticalScrollBarObj.enabled = (smartlistview.focus === true)
            verticalScrollBarObj.totalContentHeight = totalContentHeight
        } else {            
            createVerticalScrollbar()
        }
    }

    function createVerticalScrollbar() {
        if (qm_hasVerticalScrollBar) {                        
            if ((totalContentHeight > smartList.height) && (verticalScrollBarComp == undefined)) {                
                verticalScrollBarComp = Qt.createComponent("IGuiScrollBar.qml");
                if (verticalScrollBarComp.status === Component.Ready) {
                    scrollBarHeight = (horizontalScrollBarObj !== undefined ) ? (smartList.height - 6) : smartList.height
                    var verticalScrollBarHeight = smartList.height
                    if (horizontalScrollBarObj !== undefined) {
                        verticalScrollBarHeight -= 6.0
                        horizontalScrollBarObj.width -= 6.0  // Resize Vertical Scroll Bar by 6 px
                    }
                    verticalScrollBarObj = verticalScrollBarComp.createObject(smartList,
                                                                          {
                                                                              "x": smartList.width - qm_scrollBarSize,
                                                                              "width": qm_scrollBarSize,
                                                                              "height": verticalScrollBarHeight,
                                                                              "opacity": (smartlistview.focus === true),
                                                                              "enabled": (smartlistview.focus === true),
                                                                              "scrollBarOrientation": Qt.Vertical,
                                                                              "totalContentHeight": totalContentHeight,
                                                                              "scrollHotZoneArea": qm_scrollBarSize
                                                                          }
                                                                         )
                }
            }            
        }
    }

    function createHorizontalScrollbar () {
        if (qm_hasHorizontalScrollBar) {
            var horizontalScrollBarComp = undefined
            if ((smartList.totalColumnWidth > smartList.width) && (horizontalScrollBarObj == undefined)) {
                horizontalScrollBarComp = Qt.createComponent("IGuiScrollBar.qml");
                if (horizontalScrollBarComp.status === Component.Ready) {                    
                    var horizontalScrollBarWidth = smartList.width
                    if (verticalScrollBarObj !== undefined) {
                        horizontalScrollBarWidth -= 6.0
                        verticalScrollBarObj.height -= 6.0  // Resize Vertical Scroll Bar by 6 px
                    }
                    horizontalScrollBarObj = horizontalScrollBarComp.createObject(smartList,
                                                                                  {
                                                                                      "width": horizontalScrollBarWidth,
                                                                                      "excludeOffset": headerHeight,
                                                                                      "opacity": (smartlistview.focus === true),
                                                                                      "enabled": (smartlistview.focus === true),                                                                                      
                                                                                      "scrollBarOrientation": Qt.Horizontal,
                                                                                      "scrollHotZoneArea": qm_scrollBarSize,
                                                                                      "totalContentWidth": smartList.totalColumnWidth
                                                                                  }
                                                                                 )
                }
            }
            else if ((smartList.totalColumnWidth <= smartList.width) && (horizontalScrollBarObj != undefined)) {
                horizontalScrollBarObj.destroy()
                horizontalScrollBarObj = undefined
                if (verticalScrollBarObj !== undefined && verticalScrollBarObj.height !== smartList.height)
                    verticalScrollBarObj.height += 6.0   // if horizontal scroll bar is destroyed, increase vertical scroll bar, if it exists and was resized earlier
            }
        }
    }

    function scrollListView (newContentPos, scrollBarOrientation, columnIndex) {
        if ((scrollBarOrientation == Qt.Vertical) && (verticalScrollBarObj !== undefined)) {
            // Disable repositioning of scroll slider
            smartList.scrollWithScrollBar = true
            // scroll bar height = list Rectangle height - 6; only if horizontalScrollBarObj is not NULL
            var denomimator = (horizontalScrollBarObj !== undefined) ? smartList.height - 6.0 : smartList.height
            var nScrollRowIndex = Math.round((newContentPos / denomimator) * totalRowCount)
            utilProxy.scrollListData(objRef, nScrollRowIndex);
            smartList.scrollWithScrollBar = false
        } else if ((scrollBarOrientation == Qt.Horizontal) && (horizontalScrollBarObj !== undefined)) {
            flickListView.contentX = newContentPos
        }
    }

    function getSelectedIndex(mousePosX, mousePosY) {
        var selectedIndex = Qt.point(-1, -1)
        selectedIndex = smartlistview.getIndexAt(mousePosX, mousePosY)
        return selectedIndex;
    }

    onTotalRowCountChanged: {
        totalContentHeight = (totalRowCount * qm_RowHeight)
        resizeVerticalScrollBar ()
    }

    clip: true
    // Data model initialization for list view
    QtDataModel {
        id: theDataModel
        objectName: "mquDataModel"

        Component.onCompleted: {
            // TODO: pass the appropriate col count
            theDataModel.InitializeSourceModel(qm_noOfColumns)
            theDataModel.HeaderDataChanged.connect(smartList.updateHeaderData)
        }
    }

    // Header component
    Component {
        id: headerComp

        Rectangle {
            id: headerItem

            width: (smartList.width < smartList.totalColumnWidth) ? smartList.width : smartList.totalColumnWidth
            height: headerHeight
            color: qm_tableHeaderBackColor
            radius: qm_leftBorderCornerRadius
            clip: true

            Row {
                id: header

                property int newContentX: flickListView.contentX

                onNewContentXChanged: {
                    header.x = -flickListView.contentX;
                }

                Repeater {
                    model: qm_noOfColumns
                    delegate:
                        Item {
                            id: headerDelegate

                            /// @breif Header Image ID
                            property int headerimageId: (index == 0) ? qm_leftImageID : ((index + 1 == qm_noOfColumns) ? qm_rightImageID : qm_middleImageID)
                            /// @brief Image source
                            property string qm_headerimageSrc: (headerimageId > 0) ? ("image://QSmartImageProvider/" + headerimageId) : ""

                            width: smartList.children[index + adjustChildModel].width
                            height: headerHeight
                            rotation: qm_tableAlternateValueVarTextOrientation

                            /// @brief Loading tiled bitmap image
                            BorderImage {
                                id: headerimage

                                anchors.fill: parent
                                source: qm_headerimageSrc
                                border.left: (index == 0) ? qm_leftTileLeft : ((index + 1 == qm_noOfColumns) ? qm_rightTileLeft : qm_middleTileLeft)
                                border.top: (index == 0) ? qm_leftTileTop : ((index + 1 == qm_noOfColumns) ? qm_rightTileTop : qm_middleTileTop)
                                border.right: (index == 0) ? qm_leftTileRight : ((index + 1 == qm_noOfColumns) ? qm_rightTileRight : qm_middleTileRight)
                                border.bottom: (index == 0) ? qm_leftTileBottom : ((index + 1 == qm_noOfColumns) ? qm_rightTileBottom : qm_middleTileBottom)
                                horizontalTileMode: BorderImage.Repeat
                                verticalTileMode: BorderImage.Repeat
                            }

                            Text {
                                id: headerData

                                //Header font properties
                                font: qm_headerFont

                                anchors.fill: parent
                                anchors.leftMargin: qm_tableHeaderMarginLeft
                                anchors.topMargin: qm_tableHeaderMarginTop
                                anchors.rightMargin: qm_tableHeaderMarginRight
                                anchors.bottomMargin: qm_tableHeaderMarginBottom
                                horizontalAlignment: qm_tableHeaderValueVarTextAlignmentHorizontal
                                verticalAlignment: qm_tableHeaderValueVarTextAlignmentVertical

                                text: theDataModel.getHeaderData(index)
                                color: qm_tableHeaderTextColor

                                wrapMode: Text.WordWrap
                                elide: Text.ElideRight
                            }
                        }
                }
            }
        }
    }

    Flickable {
        id: flickListView

        width: smartList.width
        height: smartList.height

        boundsBehavior: Flickable.StopAtBounds
        flickableDirection: Flickable.HorizontalAndVerticalFlick
        maximumFlickVelocity: 0.1
        //pressDelay: 500 // Should work for press delay to smart list view

        contentY: smartlistview.flickContentY
        contentHeight: smartlistview.flickContentHeight
        contentWidth: totalColumnWidth

        onContentXChanged: {
            if (horizontalScrollBarObj !== undefined) {
                horizontalScrollBarObj.positionSlider(contentX, Qt.Horizontal)
            }
        }

        onContentYChanged: {
            if ((verticalScrollBarObj !== undefined) && ((smartList.scrollWithScrollBar !== true) || (contentY == originY))) {
                verticalScrollBarObj.positionSlider((contentY + (smartlistview.bufferStartOffset * qm_RowHeight)), Qt.Vertical)
            }
        }

        IGuiSmartListView {
            id: smartlistview
            objectName: "mquListView"

            width: totalColumnWidth
            height: smartList.height

            onFocusChanged: {
                if(false === smartlistview.focus)
                    handleFocusLoss()
                handleScrollBar()
            }

            onBufferStartOffsetChanged: {
                if ((verticalScrollBarObj !== undefined) && ((smartList.scrollWithScrollBar !== true) /*|| (flickListView.contentY === flickListView.originY)*/)) {
                    verticalScrollBarObj.positionSlider((flickListView.contentY + (smartlistview.bufferStartOffset * qm_RowHeight)), Qt.Vertical)
                }
            }

            rowHeight: qm_linesPerRow ? qm_RowHeight : qm_tableRowHeight
            linesPerRow: qm_linesPerRow
            rowBackColor: qm_tableBackColor
            altRowBackColor: qm_tableAlternateBackColor
            selectBackColor: qm_tableSelectBackColor
            rowTextColor: qm_tableTextColor
            altRowTextColor: qm_tableAlternateTextColor
            selectTextColor: qm_tableSelectTextColor
            tableFont: qm_tableFont
            selectFont: qm_tableSelectFont
            dataModel: theDataModel
            listControlObj: smartList
            flickControlObj: flickListView            
            gridLineStyle: qm_gridLineStyle + 1
            gridLineColor: qm_gridLineColor
            gridLineWidth: smartList.gridLineWidth
            focusLineWidth: qm_FocusLineWidth
            borderLineWidth: qm_BorderLineWidth
            contentStretched: qm_ContentStreached
            contentHAlignment: [qm_tableValueVarTextAlignmentHorizontal, qm_tableAlternateValueVarTextAlignmentHorizontal, qm_tableSelectValueVarTextAlignmentHorizontal, qm_tableImageAlignmentHorizontal]
            contentVAlignment: [qm_tableValueVarTextAlignmentVertical, qm_tableAlternateValueVarTextAlignmentVertical, qm_tableSelectValueVarTextAlignmentVertical, qm_tableImageAlignmentVertical]
            contentTableMargin: [qm_tableMarginLeft, qm_tableMarginRight, qm_tableMarginTop, qm_tableMarginBottom]
            contentAltTableMargin: [qm_tableAlternateMarginLeft, qm_tableAlternateMarginRight, qm_tableAlternateMarginTop, qm_tableAlternateMarginBottom]
            contentSelectTableMargin: [qm_tableSelectMarginLeft, qm_tableSelectMarginRight, qm_tableSelectMarginTop, qm_tableSelectMarginBottom]
            columnOffset: adjustChildModel
            contentY: flickListView.contentY            

            MouseArea {
                width: flickListView.contentWidth
                height: flickListView.contentHeight

                onClicked: {                                        
                    var selectedIndex = getSelectedIndex(mouseX, mouseY)
                    utilProxy.lButtonClick(objRef, selectedIndex.x, selectedIndex.y)
                    setFocus ()
                }

                onPressed: {                    
                    var selectedIndex = getSelectedIndex(mouseX, mouseY)
                    utilProxy.lButtonDown(objRef, selectedIndex.x, selectedIndex.y)
                }

                onReleased: {                    
                    var selectedIndex = getSelectedIndex(mouseX, mouseY)
                    utilProxy.lButtonUp(objRef, selectedIndex.x, selectedIndex.y)
                }

                onDoubleClicked: {
                    var selectedIndex = getSelectedIndex(mouseX, mouseY)
                    utilProxy.lButtonDblClick(objRef, selectedIndex.x, selectedIndex.y)
                }
            }

            Keys.onPressed: {                                
                utilProxy.keyHandler(objRef, event.key, true, event.text)
                event.accepted = true
            }

            Component.onDestruction: {
                if (headerObj != undefined)
                {
                    headerObj.destroy()
                }
            }
        }

        onMovementStarted: {
            smartlistview.flickEvent = true

            // Enable repositioning of scroll slider on smooth scrolling
            smartList.scrollWithScrollBar = false
            stopEditMode()

            qm_moveStartIndex = smartlistview.getIndexAt(flickListView.contentX, flickListView.contentY)
        }

        onMovementEnded: {
            smartlistview.flickEvent = false

            // Before getting the displacement row count snap row
            smartlistview.snapListView(flickListView.contentY);

            // Get the proper index value after snapping the list view
            qm_moveEndIndex = smartlistview.getIndexAt(flickListView.contentX, flickListView.contentY)

            var nDisplacedRowCount = (qm_moveEndIndex.x - qm_moveStartIndex.x)

            if (0 !== nDisplacedRowCount) {
                utilProxy.updateListData(smartList.objRef, nDisplacedRowCount)
            }

            flickableDirection = Flickable.HorizontalAndVerticalFlick
        }

        onMovingHorizontallyChanged: {
            flickableDirection = Flickable.HorizontalFlick
        }

        onMovingVerticallyChanged: {
            flickableDirection = Flickable.VerticalFlick
        }
    }
}
