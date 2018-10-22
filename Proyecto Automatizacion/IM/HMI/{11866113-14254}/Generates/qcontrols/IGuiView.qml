import QtQuick 2.0
import SmartItemComponent 1.0

IGuiSmartItem{

    id:qSmartWidget

    /***************************************************************************************/
    /* For Loading components
    /***************************************************************************************/
    property variant staticComponentFocused: undefined
    property variant staticComponentObjFocused: undefined

    onFocusChanged:
    {
        if(focus)
            handleFocus()
        else
            handleFocusLoss()
    }
    /***************************************************************************************/
    /* Functions used for all the views */
    /***************************************************************************************/
    /// @brief Function to hadle focus
    function handleFocus()
    {
        if(false === qm_SmartFocus)
        {
            staticComponentFocused = Qt.createComponent("IGuiUtilFocusedRect.qml")
            staticComponentObjFocused = staticComponentFocused.createObject(qSmartWidget,
                                                                            {
                                                                                "radius" : qm_BorderCornerRadius,
                                                                                "border.color":  qm_FocusColor,
                                                                                "border.width": qm_FocusWidth
                                                                            })           
        }

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

}

