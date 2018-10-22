import QtQuick 2.0

Item{
    id:qGraphicIOEditList
    objectName: "qGraphicIOEditList"

    property int objId: 0
    property variant listCtrlObj

    property int qm_ImageVAlign:0
    property int qm_ImageHAlign:0
    property int qm_ImageMarginLeft:0
    property int qm_ImageMarginRight:0
    property int qm_ImageMarginTop:0
    property int qm_ImageMarginBottom:0

    property bool qm_Streached : fasle
    property int qm_NoOfVisibleColumns:1

    Component
    {
        id: listCtrlComp

        IGuiListCtrl
        {
            id: qu100
            objectName: "qu100"
            x: 0
            y: 0
            width: parent.width
            height:parent.height

            qm_tableMarginLeft: qm_ImageMarginLeft
            qm_tableMarginRight: qm_ImageMarginRight
            qm_tableMarginBottom: qm_ImageMarginBottom
            qm_tableMarginTop: qm_ImageMarginTop

            qm_tableAlternateMarginLeft: qm_MarginLeft
            qm_tableAlternateMarginRight: qm_MarginRight
            qm_tableAlternateMarginTop: qm_MarginTop
            qm_tableAlternateMarginBottom: qm_MarginBottom

            qm_tableSelectMarginLeft: qm_MarginLeft
            qm_tableSelectMarginRight: qm_MarginRight
            qm_tableSelectMarginTop: qm_MarginTop
            qm_tableSelectMarginBottom: qm_MarginBottom

            qm_tableImageAlignmentHorizontal:qm_ImageHAlign
            qm_tableImageAlignmentVertical:qm_ImageVAlign

            qm_tableBackColor : "transparent"
            qm_tableAlternateBackColor : "transparent"
            qm_tableSelectBackColor : "transparent"
            qm_tableTextColor:"transparent"

            qm_ContentStreached: qm_Streached
            qm_RowHeight: qGraphicIOEditList.height
            enabled: true

            qm_noOfColumns: qm_NoOfVisibleColumns
            qm_linesPerRow: 1
            qm_hasGridLines: false
            qm_FocusLineWidth: 0
            qm_BorderLineWidth: 0

            qm_hasVerticalScrollBar : true
            qm_hasVerticalScrolling : true

            IGuiListColumnView {
               width: parent.width
               height: parent.height
               columnType: 1
           }

            Component.onCompleted:
            {
                /// @brief Needed to set the focus to the list control once it has been loaded
                handleFocus()
            }
        }
    }

    //Dummy function for handling the Focus
    function onfocusElementChanged(objectId)
    {
    }

    function changeObjNameListCtl()
    {
        listCtrlObj.objectName = ""
    }

    Component.onDestruction: {
        listCtrlObj.destroy()
    }

    Component.onCompleted:
    {
        listCtrlObj = listCtrlComp.createObject(qGraphicIOEditList)
    }
}
