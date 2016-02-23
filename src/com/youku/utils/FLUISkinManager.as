package com.youku.utils {
    import com.panqibao.fl.controls.List;
    import com.panqibao.fl.core.UIComponent;
    
    import flash.display.DisplayObject;
    import flash.text.TextFormat;
    
    public class FLUISkinManager {
        public function FLUISkinManager() {
        }
        
        public static function setStyleIcon(uiComponent:UIComponent, upIcon:DisplayObject, downIcon:DisplayObject = null, overIcon:DisplayObject = null, disabledIcon:DisplayObject = null, selectedUpIcon:DisplayObject = null, selectedDownIcon:DisplayObject = null, selectedOverIcon:DisplayObject = null, selectedDisabledIcon:DisplayObject = null):void {
            uiComponent.setStyle("upIcon", upIcon);
            
            downIcon ? uiComponent.setStyle("downIcon", downIcon) : uiComponent.setStyle("downIcon", upIcon);
            overIcon ? uiComponent.setStyle("overIcon", overIcon) : uiComponent.setStyle("overIcon", upIcon);
            disabledIcon ? uiComponent.setStyle("disabledIcon", disabledIcon) : uiComponent.setStyle("disabledIcon", upIcon);
            selectedUpIcon ? uiComponent.setStyle("selectedUpIcon", selectedUpIcon) : uiComponent.setStyle("selectedUpIcon", upIcon);
            selectedDownIcon ? uiComponent.setStyle("selectedDownIcon", selectedDownIcon) : uiComponent.setStyle("selectedDownIcon", upIcon);
            selectedOverIcon ? uiComponent.setStyle("selectedOverIcon", selectedOverIcon) : uiComponent.setStyle("selectedOverIcon", upIcon);
            selectedDisabledIcon ? uiComponent.setStyle("selectedDisabledIcon", selectedDisabledIcon) : uiComponent.setStyle("selectedDisabledIcon", upIcon);
        }
        
        public static function setStyleSkin(uiComponent:UIComponent, upSkin:DisplayObject, downSkin:DisplayObject = null, overSkin:DisplayObject = null, disabledSkin:DisplayObject = null, selectedUpSkin:DisplayObject = null, selectedDownSkin:DisplayObject = null, selectedOverSkin:DisplayObject = null, selectedDisabledSkin:DisplayObject = null):void {
            uiComponent.setStyle("upSkin", upSkin);
            
            downSkin ? uiComponent.setStyle("downSkin", downSkin) : uiComponent.setStyle("downSkin", upSkin);
            overSkin ? uiComponent.setStyle("overSkin", overSkin) : uiComponent.setStyle("overSkin", upSkin);
            disabledSkin ? uiComponent.setStyle("disabledSkin", disabledSkin) : uiComponent.setStyle("disabledSkin", upSkin);
            selectedUpSkin ? uiComponent.setStyle("selectedUpSkin", selectedUpSkin) : uiComponent.setStyle("selectedUpSkin", upSkin);
            selectedDownSkin ? uiComponent.setStyle("selectedDownSkin", selectedDownSkin) : uiComponent.setStyle("selectedDownSkin", upSkin);
            selectedOverSkin ? uiComponent.setStyle("selectedOverSkin", selectedOverSkin) : uiComponent.setStyle("selectedOverSkin", upSkin);
            selectedDisabledSkin ? uiComponent.setStyle("selectedDisabledSkin", selectedDisabledSkin) : uiComponent.setStyle("selectedDisabledSkin", upSkin);
        }
        
        public static function setStyleScrollSkin(uiComponent:UIComponent, downArrowDisabledSkin:DisplayObject, downArrowDownSkin:DisplayObject = null, downArrowOverSkin:DisplayObject = null, downArrowUpSkin:DisplayObject = null, upArrowDisabledSkin:DisplayObject = null, upArrowDownSkin:DisplayObject = null, upArrowOverSkin:DisplayObject = null, upArrowUpSkin:DisplayObject = null, thumbDisabledSkin:DisplayObject = null, thumbDownSkin:DisplayObject = null, thumbOverSkin:DisplayObject = null, thumbUpSkin:DisplayObject = null, thumbIcon:DisplayObject = null, trackDisabledSkin:DisplayObject = null, trackDownSkin:DisplayObject = null, trackOverSkin:DisplayObject = null, trackUpSkin:DisplayObject = null):void {
            uiComponent.setStyle("downArrowDisabledSkin", downArrowDisabledSkin);
            
            downArrowDownSkin ? uiComponent.setStyle("downArrowDownSkin", downArrowDownSkin) : uiComponent.setStyle("downArrowDownSkin", downArrowDisabledSkin);
            downArrowOverSkin ? uiComponent.setStyle("downArrowOverSkin", downArrowOverSkin) : uiComponent.setStyle("downArrowOverSkin", downArrowDisabledSkin);
            downArrowUpSkin ? uiComponent.setStyle("downArrowUpSkin", downArrowUpSkin) : uiComponent.setStyle("downArrowUpSkin", downArrowDisabledSkin);
            upArrowDisabledSkin ? uiComponent.setStyle("upArrowDisabledSkin", upArrowDisabledSkin) : uiComponent.setStyle("upArrowDisabledSkin", downArrowDisabledSkin);
            upArrowDownSkin ? uiComponent.setStyle("upArrowDownSkin", upArrowDownSkin) : uiComponent.setStyle("upArrowDownSkin", downArrowDisabledSkin);
            upArrowOverSkin ? uiComponent.setStyle("upArrowOverSkin", upArrowOverSkin) : uiComponent.setStyle("upArrowOverSkin", downArrowDisabledSkin);
            upArrowUpSkin ? uiComponent.setStyle("upArrowUpSkin", upArrowUpSkin) : uiComponent.setStyle("upArrowUpSkin", downArrowDisabledSkin);
            thumbDisabledSkin ? uiComponent.setStyle("thumbDisabledSkin", thumbDisabledSkin) : uiComponent.setStyle("thumbDisabledSkin", downArrowDisabledSkin);
            thumbDownSkin ? uiComponent.setStyle("thumbDownSkin", thumbDownSkin) : uiComponent.setStyle("thumbDownSkin", downArrowDisabledSkin);
            thumbOverSkin ? uiComponent.setStyle("thumbOverSkin", thumbOverSkin) : uiComponent.setStyle("thumbOverSkin", downArrowDisabledSkin);
            thumbUpSkin ? uiComponent.setStyle("thumbUpSkin", thumbUpSkin) : uiComponent.setStyle("thumbUpSkin", downArrowDisabledSkin);
            thumbIcon ? uiComponent.setStyle("thumbIcon", thumbIcon) : uiComponent.setStyle("thumbIcon", downArrowDisabledSkin);
            trackDisabledSkin ? uiComponent.setStyle("trackDisabledSkin", trackDisabledSkin) : uiComponent.setStyle("trackDisabledSkin", downArrowDisabledSkin);
            trackDownSkin ? uiComponent.setStyle("trackDownSkin", trackDownSkin) : uiComponent.setStyle("trackDownSkin", downArrowDisabledSkin);
            trackOverSkin ? uiComponent.setStyle("trackOverSkin", trackOverSkin) : uiComponent.setStyle("trackOverSkin", downArrowDisabledSkin);
            trackUpSkin ? uiComponent.setStyle("trackUpSkin", trackUpSkin) : uiComponent.setStyle("trackUpSkin", downArrowDisabledSkin);
            var disabledSkin:*;
            disabledSkin ? uiComponent.setStyle("disabledSkin", disabledSkin) : uiComponent.setStyle("disabledSkin", downArrowDisabledSkin);
            var upSkin:*;
            upSkin ? uiComponent.setStyle("upSkin", upSkin) : uiComponent.setStyle("upSkin", downArrowDisabledSkin);
        }
        
        public static function setStyleTextFormat(uiComponent:UIComponent, textFormat:TextFormat):void {
            uiComponent.setStyle("textFormat", textFormat);
        }
        
        public static function setStyleTextPadding(uiComponent:UIComponent, value:int):void {
            uiComponent.setStyle("textPadding", value);
        }
        
        public static function setListTextFormatStyle(list:List, textFormat:TextFormat):void {
            list.setRendererStyle("textFormat", textFormat);
        }
    }
}
