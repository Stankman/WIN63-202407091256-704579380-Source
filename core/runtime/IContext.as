package com.sulake.core.runtime {
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import com.sulake.core.utils.LibraryLoader;

    import flash.display.DisplayObjectContainer;
    import flash.events.IEventDispatcher;
    import flash.net.URLRequest;
    import flash.system.ApplicationDomain;
    import flash.system.LoaderContext;

    [SecureSWF(rename="true")]
    public interface IContext extends IUnknown {

        function get assets(): IAssetLibrary;

        function get events(): IEventDispatcher;

        function get root(): IContext;

        function error(param1: String, param2: Boolean, param3: int = -1, param4: Error = null): void;

        function getLastErrorMessage(): String;

        function debug(param1: String): void;

        function getLastDebugMessage(): String;

        function warning(param1: String): void;

        function getLastWarningMessage(): String;

        function get displayObjectContainer(): DisplayObjectContainer;

        function loadFromFile(param1: URLRequest, param2: LoaderContext): LibraryLoader;

        function attachComponent(param1: Component, param2: Array): void;

        function detachComponent(param1: Component): void;

        function prepareComponent(param1: Class, param2: uint = 0, param3: ApplicationDomain = null): IUnknown;

        function prepareAssetLibrary(param1: XML, param2: Class): Boolean;

        function registerUpdateReceiver(param1: IUpdateReceiver, param2: uint): void;

        function removeUpdateReceiver(param1: IUpdateReceiver): void;

        function toXMLString(param1: uint = 0): String;

        function get configuration(): ICoreConfiguration;

        function set configuration(param1: ICoreConfiguration): void;

        function addLinkEventTracker(param1: ILinkEventTracker): void;

        function removeLinkEventTracker(param1: ILinkEventTracker): void;

        function createLinkEvent(param1: String): void;

        function get linkEventTrackers(): Vector.<ILinkEventTracker>;
    }
}
