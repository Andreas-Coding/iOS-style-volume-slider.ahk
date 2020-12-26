/**
    * Class: iOSVSliderProvider
    *   provider for an iOS alike styled volume slider
    *   include this within your own script for it to use this lib
    * Attributes:
    *   
    * Methods:
    *   initialize()
    * Dependencies:
    *   VSliderGUI.ahk    – Class used to manage individual slider guis
    *   Segoe MDL2 Asstes – font used for rendering icons only available in Win10+
*/
Class iOSVSliderProvider {


    initialize(){
        this.slider := {}
        this.slider.normal := new VSliderGUI("nSlider"
                                                , 322
                                                , 98
                                                , 48
                                                , 24
                                                , 16
                                                , 48
                                                , "Center"
                                                , 224
                                                , 1500)
        this.slider.fullscreen := new VSliderGUI("fcSlider"
                                                , 192
                                                , 50
                                                , 24
                                                , 16
                                                , 8
                                                , 24
                                                , 80
                                                , 208
                                                , 1000)
    }


    volUp(individually, repeated){
        ;stuff
    }


    volDown(individually, repeated){
        ;stuff
    }


    setWindowSpecifiers(arr){
        ;stuff
    }


    _setVol(vol, component := "MASTER"){
        SoundSet, vol, % component, % "VOL"
    }


    _getVol(component := "MASTER"){
        SoundGet, vol, % component, % "VOL"
        return, Round(vol)
    }


    _getIcon(component := "MASTER"){
        SoundGet, SysMuteState, % component, % "Mute"
        if(SysMuteState != "Off")
            return, ""
        
        vol := this._getVol(component)

        if(vol < 1)
            return, ""
            
        if(vol < 33)
            return, ""
            
        if(vol < 66)
            return, ""

        return, ""
    }


    _getVariant(){
        atts := this._winGetAttributes("A")
        if((atts.class == "Windows.UI.Core.CoreWindow")
                || (atts.class == "WorkerW"))
            return, False

        
    }


    _winGetAttributes(title){
        r := {}

        WinGetTitle, t, % title
        r.title := t

        WinGetClass, c, % title
        r.class := c

        for _, element in ["ID", "PID", "ProcessName", "ProcessPath"] {
            WinGet, out, % element, % title
            r[element] := out
        }

        return, r
    }


}


#Include, %A_LineFile%\..\VSliderGUI.ahk