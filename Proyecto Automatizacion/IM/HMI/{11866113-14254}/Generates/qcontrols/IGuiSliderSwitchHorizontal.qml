import QtQuick 2.0

IGuiSwitchBitMap{

    id: qSliderSwitchView

    // Function to set the Switch value
    function setStatusValue(value )
    {
        slidertimer.stop();
        // If new value is Switch ON value
        if(value === qm_SwitchOnValue)
        {
            if(qm_SwichOnSide === true)
            {
                sliderRect.x = 0
                qm_SwitchStatus = false;
            }
            else
            {
                sliderRect.x = qSliderSwitchView.width/2;
                qm_SwitchStatus = true;
            }
            fillRect.color = qm_SliderRectOnFillColor;
        }
        else// If new value is Switch OFF value
        {
            if(qm_SwichOnSide === true)
            {
                sliderRect.x = qSliderSwitchView.width/2;
                qm_SwitchStatus = true
            }
            else
            {
                sliderRect.x = 0
                qm_SwitchStatus = false;
            }
            fillRect.color = qm_SliderRectOffFillColor;
        }
    }


    //Function to reset the Slider position in Drag area.
    function setSliderPosition(newx,newy)
    {
        var sliderCurrentState = false;
        //If Slider in right area of Drag area
        if(sliderRect.x >=(qSliderSwitchView.width - 4)/3 )
        {
            sliderRect.x = qSliderSwitchView.width/2;
            sliderCurrentState = true;
        }
        else //Slider in Left area of Drag area
        {
            sliderRect.x = 0
            sliderCurrentState = false;
        }

        if(sliderCurrentState != qm_SwitchStatus)
        {
            //Slider postion is changed so send the Event as Button pressed
            proxy.lButtonDown(objId, newx, newy);
            slidertimer.running = true;
        }
        if(!qm_SmartFocus)
            setItemFocus(true);
    }

    //Function to check and reset the slider position after timer expires
    function checkAndResetSlider()
    {
        //IF slider in left side then move it to right
        if(qm_SwitchStatus)
        {
            sliderRect.x = qSliderSwitchView.width/2;

        }
        else    //Slider is in right side so move it to left
        {
            sliderRect.x = 0
        }
    }

    //timer to check for Slider position to reset or not
    Timer {
        id: slidertimer
        interval: 500
        triggeredOnStart: false
        onTriggered: {
            checkAndResetSlider();
        }
    }

    //Text element  Rectangle for Switch ON
    Rectangle{
        id:textLeftRect
        height:qSliderSwitchView.height
        width:qSliderSwitchView.width/2 + qSliderSwitchView.qm_BorderWidth
        color: "transparent"
        border.color: "transparent"
        radius: qm_BorderCornerRadius
        //Text element  for Switch ON
        Text {
            id:textElementLeft
            anchors.fill: parent
            parent : qSliderRotationRect1
            text: (qm_SwichOnSide === true)? qm_SwitchOffText:qm_SwitchOnText
            color: qSliderSwitchView.qm_TextColor
            anchors.bottomMargin: qSliderSwitchView.qm_MarginBottom + qSliderSwitchView.qm_BorderWidth
            anchors.leftMargin: qSliderSwitchView.qm_MarginLeft + qSliderSwitchView.qm_BorderWidth
            anchors.rightMargin: qSliderSwitchView.qm_MarginRight + qSliderSwitchView.qm_BorderWidth
            anchors.topMargin: qSliderSwitchView.qm_MarginTop + qSliderSwitchView.qm_BorderWidth
            horizontalAlignment: qSliderSwitchView.qm_ValueVarTextAlignmentHorizontal
            verticalAlignment: qSliderSwitchView.qm_ValueVarTextAlignmentVertical
            font.bold: qm_FontBold
            font.italic: qm_FontItalic
            font.underline: qm_FontUnderline
            font.strikeout: qm_FontStrikeout
            font.family: qm_FontFamilyName
            font.pointSize: qm_FontSize
            clip:true
        }
        /// @brief Rectangle for applying text orientation
        Rectangle{
            id : qSliderRotationRect1
            anchors.centerIn : parent
            color: "transparent"
            visible: false
            states: [
                State{
                    name: 'ApplySliderOrientation'
                    PropertyChanges {
                        target: qSliderRotationRect1
                        visible : true
                        height : parent.width
                        width: parent.height
                        rotation: -qm_ValueVarTextOrientation
                    }
                },
                State {
                    name: "NormalSliderlOrienatation"
                    PropertyChanges {
                        target: qSliderRotationRect1
                        anchors.fill: parent
                        visible : true
                    }
                }
            ]
        }
        Component.onCompleted: {
            if(qm_ValueVarTextOrientation != 0)
                qSliderRotationRect1.state = 'ApplySliderOrientation'
            else
                qSliderRotationRect1.state = 'NormalSliderlOrienatation'
        }
    }
    //Text element  Rectangle for Switch OFF
    Rectangle{
        id:textRightRect
        x:qSliderSwitchView.width/2-qSliderSwitchView.qm_BorderWidth
        height:qSliderSwitchView.height
        width:qSliderSwitchView.width/2+qSliderSwitchView.qm_BorderWidth
        color: "transparent"
        border.color: "transparent"
        radius: qm_BorderCornerRadius
        //Text element  for Switch OFF
        Text {
            id:textElementRight
            anchors.fill: parent
            parent : qSliderRotationRect2
            text: (qm_SwichOnSide === true)? qm_SwitchOnText:qm_SwitchOffText
            color: qSliderSwitchView.qm_TextColor
            anchors.bottomMargin: qSliderSwitchView.qm_MarginBottom + qSliderSwitchView.qm_BorderWidth
            anchors.leftMargin: qSliderSwitchView.qm_MarginLeft + qSliderSwitchView.qm_BorderWidth
            anchors.rightMargin: qSliderSwitchView.qm_MarginRight + qSliderSwitchView.qm_BorderWidth
            anchors.topMargin: qSliderSwitchView.qm_MarginTop + qSliderSwitchView.qm_BorderWidth
            horizontalAlignment: qSliderSwitchView.qm_ValueVarTextAlignmentHorizontal
            verticalAlignment: qSliderSwitchView.qm_ValueVarTextAlignmentVertical
            font.bold: qm_FontBold
            font.italic: qm_FontItalic
            font.underline: qm_FontUnderline
            font.strikeout: qm_FontStrikeout
            font.family: qm_FontFamilyName
            font.pointSize: qm_FontSize
            clip:true

        }
        /// @brief Rectangle for applying text orientation
        Rectangle{
            id : qSliderRotationRect2
            anchors.centerIn : parent
            color: "transparent"
            visible: false
            states: [
                State{
                    name: 'ApplySliderOrientation'
                    PropertyChanges {
                        target: qSliderRotationRect2
                        visible : true
                        height : parent.width
                        width: parent.height
                        rotation: -qm_ValueVarTextOrientation
                    }
                },
                State {
                    name: "NormalSliderlOrienatation"
                    PropertyChanges {
                        target: qSliderRotationRect2
                        anchors.fill: parent
                        visible : true
                    }
                }
            ]
        }
        Component.onCompleted: {
            if(qm_ValueVarTextOrientation != 0)
                qSliderRotationRect2.state = 'ApplySliderOrientation'
            else
                qSliderRotationRect2.state = 'NormalSliderlOrienatation'
        }
    }

    //Slider Item element sliderRect for Switch
    Item
    {
        id: sliderRect
        width:qSliderSwitchView.width/2
        height:qSliderSwitchView.height
        Rectangle{
            id: sliderRectbeckground
            anchors.centerIn: parent
            color:qm_FillColor
            radius: qm_BorderCornerRadius
            height: qm_SliderRectHeight
            width: qm_SliderRectWidth
        }
        /// @brief Loading tiled bitmap image
        BorderImage {
            id: bimage
            source: qm_SliderRectimageSrc
            anchors.fill: parent

            border.left: qm_SliderRectTileLeft;
            border.top: qm_SliderRectTileTop;
            border.right: qm_SliderRectTileRight;
            border.bottom: qm_SliderRectTileBottom;

            horizontalTileMode: BorderImage.Repeat
            verticalTileMode: BorderImage.Repeat

        }
        /// @brief Rectangle shows the focus of the element
        Rectangle{
            id: qSliderFocusRect
            anchors.fill: parent
            radius: qm_BorderCornerRadius
            visible: false

            states: [
                State {
                    name: "SliderFocusedState"
                    PropertyChanges {
                        target: qSliderFocusRect
                        border.width: qm_FocusWidth
                        border.color: qm_FocusColor
                        visible: true
                        opacity : 0.3
                        z:1
                        color: "transparent"
                    }
                },
                State {
                    name: "SliderNoFocusState"
                    PropertyChanges {
                        target: qSliderFocusRect
                        visible: false
                    }
                }
            ]
        }
        /// @brief BorderImage shows the Grip Lines
        BorderImage{
            id:sliderImage
            height: parent.height
            property int leftrightwidth: qm_SliderGripTileLeft + qm_SliderGripTileRight
            property int tileWidth:leftrightwidth + ((qm_SliderGripTileWidth - leftrightwidth)* 3)
            width :(tileWidth > (parent.width/2-qm_BorderWidth))?(parent.width/2 -qm_BorderWidth):tileWidth
            anchors.centerIn: parent
            source: qm_SliderGripimageSrc

            border.left: qm_SliderGripTileLeft;
            border.top: qm_SliderGripTileTop;
            border.right: qm_SliderGripTileRight;
            border.bottom: qm_SliderGripTileBottom;

            horizontalTileMode: BorderImage.Repeat
            verticalTileMode: BorderImage.Repeat
        }

        Drag.active: sliderDragArea.drag.active

        //Drop area for Slider Item sliderRect
        DropArea {
            id:sliderDropArea
            width: qSliderSwitchView.width/2
            height: qSliderSwitchView.height

        }

        //Mouse area for Slider Item sliderRect
        MouseArea {
            id:sliderDragArea
            anchors.fill: parent
            drag.target: sliderRect
            drag.axis: Drag.XAxis
            drag.minimumX: 0
            drag.maximumX: qSliderSwitchView.width / 2
            onReleased:{setSliderPosition(mouse.x,mouse.y);}
            onPressed:
            {
                if(!qm_SmartFocus)
                    setItemFocus(true);
            }
            onClicked: {
                //clicked Slider so send the Event as Button pressed
                proxy.lButtonDown(objId, mouse.x, mouse.y);
            }
        }

    }
}





