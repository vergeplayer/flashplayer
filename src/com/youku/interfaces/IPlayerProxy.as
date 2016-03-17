package com.youku.interfaces {
    import flash.events.IEventDispatcher;
    
    /**
     *
     * @author PANQIBAO
     *
     */
    public interface IPlayerProxy extends IEventDispatcher {
        function addEventListeners():void;
        function removeEventListeners():void;
    }

}
