// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 2.0

IGuiViewBitmap
{
    id: qGraphiciofieldview

    /// @brief data for image id
    property int graphicId

    /// @brief data for image
    property string qm_Graph : "image://QSmartImageProvider/" + 
                                       graphicId + "#" +                    // image id
                                       (qm_Streached ? 1 : 0) + "#" +       // streaching info                                      
                                       image.horizontalAlignment + "#" +    // horizontal alignment info
                                       image.verticalAlignment              // vertical alignment info

    /// @brief data for stretched image
    property bool  qm_Streached: false

    /// @brief data for stretched image
    property bool  qm_ContentVisibility: true

    property bool qm_Selectable: false

    ///@brief data for  touchpad component and object
    property variant staticTouchComponent: undefined
    property variant staticTouchComponentObj: undefined

    property variant staticComponentEditmode: undefined
    property variant staticComponentObjEditmode: undefined

    property bool qm_InEditMode:false

    /// @brief function for set image
   function setImage(imageid)
   {
        graphicId = imageid;
   }

   /// @brief function for set image
   function setContentVisibility(bVisible)
   {
       qm_ContentVisibility = bVisible;
   }

   /// load list control QML
   function startEditMode(editFieldRef,editFieldValue, editFieldType, passwordMode, highlightText)
   {
       staticTouchComponent = Qt.createComponent("IGuiTouchpad.qml")
       staticTouchComponentObj = staticTouchComponent.createObject(qGraphiciofieldview,
                                                                   {
                                                                       "qm_TouchpadInputQml":"IGuiGraphicioListEdit.qml",
                                                                       "qm_TouchPadYposition":qm_BorderWidth,
                                                                       "qm_TouchPadXposition":qm_BorderWidth,
                                                                       "qm_TouchPadType":editFieldType,
                                                                       "qm_TouchPadWidth": qGraphiciofieldview.width - (2*qm_BorderWidth),
                                                                       "qm_TouchPadHeight":qGraphiciofieldview.height - (2*qm_BorderWidth),
                                                                       "qm_TextVAlign":qGraphiciofieldview.qm_ValueVarTextAlignmentVertical,
                                                                       "qm_TextHAlign":qGraphiciofieldview.qm_ValueVarTextAlignmentHorizontal,
                                                                       "qm_TextMarginLeft":qGraphiciofieldview.qm_MarginLeft,
                                                                       "qm_TextMarginRight":qGraphiciofieldview.qm_MarginRight,
                                                                       "qm_TextMarginTop":qGraphiciofieldview.qm_MarginTop,
                                                                       "qm_TextMarginBottom":qGraphiciofieldview.qm_MarginBottom,
                                                                       "qm_Streached":qm_Streached
                                                                   })
       staticTouchComponentObj.editModeOff.connect(doStopEditMode)
       setEditmodeState(true);
       qm_InEditMode = true;
   }

   function doStopEditMode()
   {
       if(staticTouchComponentObj !== undefined)
       {
           staticTouchComponentObj.objectName = ""
           staticTouchComponentObj.destroy ()
           staticTouchComponentObj = undefined
           staticTouchComponent.destroy()
           staticTouchComponent = undefined
       }
       setEditmodeState(false);
       qm_InEditMode = false;
       qGraphiciofieldview.forceActiveFocus()
   }

   Image
   {
       id: image

        anchors.fill: parent
        anchors.bottomMargin: qm_MarginBottom + qm_BorderWidth
        anchors.leftMargin: qm_MarginLeft + qm_BorderWidth
        anchors.rightMargin: qm_MarginRight + qm_BorderWidth
        anchors.topMargin: qm_MarginTop + qm_BorderWidth

       // Do not show this image when the graphic iofield is in edit mode
       visible: qm_InEditMode ? false : qm_ContentVisibility
       source :  qm_Graph
              
       horizontalAlignment: qm_ValueVarTextAlignmentHorizontal
       verticalAlignment: qm_ValueVarTextAlignmentVertical

       sourceSize.width: qGraphiciofieldview.width - ((2*qm_BorderWidth) + qm_MarginLeft + qm_MarginRight)
       sourceSize.height: qGraphiciofieldview.height - ((2*qm_BorderWidth) + qm_MarginBottom + qm_MarginTop)
   }

   /// @brief function for set editmode state
   function setEditmodeState(bEdit)
   {
       if(bEdit)
       {
           staticComponentEditmode = Qt.createComponent("IGuiUtilEditmodeRect.qml")
           staticComponentObjEditmode = staticComponentEditmode.createObject(qGraphiciofieldview,
                                                             {
                                                                 "border.color":  qm_BorderColor,
                                                                 "border.width": qm_BorderWidth + 2
                                                             })
       }
       else
       {
           if (staticComponentObjEditmode !== undefined)
           {
               staticComponentObjEditmode.destroy()
               staticComponentEditmode.destroy()
               staticComponentEditmode = undefined
               staticComponentObjEditmode = undefined
           }            
       }
   }
}
