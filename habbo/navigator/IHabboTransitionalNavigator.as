package com.sulake.habbo.navigator {
    import com.sulake.core.assets.IAssetLibrary
    import com.sulake.core.communication.messages.IMessageComposer
    import com.sulake.core.window.IWindow
    import com.sulake.core.window.IWindowContainer
    import com.sulake.core.window.components.IBitmapWrapperWindow
    import com.sulake.habbo.communication.IHabboCommunicationManager
    import com.sulake.habbo.help.IHabboHelp
    import com.sulake.habbo.localization.IHabboLocalizationManager
    import com.sulake.habbo.navigator.domain.NavigatorData
    import com.sulake.habbo.navigator.domain.Tabs
    import com.sulake.habbo.navigator.inroom.RoomEventInfoCtrl
    import com.sulake.habbo.navigator.inroom.RoomEventViewCtrl
    import com.sulake.habbo.navigator.inroom.RoomInfoViewCtrl
    import com.sulake.habbo.navigator.mainview.ITransitionalMainViewCtrl
    import com.sulake.habbo.navigator.mainview.OfficialRoomEntryManager
    import com.sulake.habbo.navigator.roomsettings.EnforceCategoryCtrl
    import com.sulake.habbo.navigator.roomsettings.RoomCreateViewCtrl
    import com.sulake.habbo.navigator.roomsettings.RoomFilterCtrl
    import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl
    import com.sulake.habbo.session.IRoomSessionManager
    import com.sulake.habbo.session.ISessionDataManager
    import com.sulake.habbo.toolbar.IHabboToolbar
    import com.sulake.habbo.tracking.IHabboTracking
    import com.sulake.habbo.window.IHabboWindowManager

    import flash.display.BitmapData
    import flash.utils.Dictionary

    public interface IHabboTransitionalNavigator extends IHabboNavigator {

        function get assets(): IAssetLibrary;

        function get windowManager(): IHabboWindowManager;

        function get data(): NavigatorData;

        function get mainViewCtrl(): ITransitionalMainViewCtrl;

        function get tabs(): Tabs;

        function get roomInfoViewCtrl(): RoomInfoViewCtrl;

        function get roomCreateViewCtrl(): RoomCreateViewCtrl;

        function get communication(): IHabboCommunicationManager;

        function get roomSettingsCtrl(): RoomSettingsCtrl;

        function get sessionData(): ISessionDataManager;

        function get passwordInput(): GuestRoomPasswordInput;

        function get doorbell(): GuestRoomDoorbell;

        function get roomEventViewCtrl(): RoomEventViewCtrl;

        function get localization(): IHabboLocalizationManager;

        function get officialRoomEntryManager(): OfficialRoomEntryManager;

        function get toolbar(): IHabboToolbar;

        function get habboHelp(): IHabboHelp;

        function get roomEventInfoCtrl(): RoomEventInfoCtrl;

        function get roomFilterCtrl(): RoomFilterCtrl;

        function get roomSessionManager(): IRoomSessionManager;

        function get enforceCategoryCtrl(): EnforceCategoryCtrl;

        function send(param1: IMessageComposer, param2: Boolean = false): void;

        function getXmlWindow(param1: String, param2: uint = 1): IWindow;

        function getText(param1: String): String;

        function registerParameter(param1: String, param2: String, param3: String): String;

        function getButton(param1: String, param2: String, param3: Function, param4: int = 0, param5: int = 0, param6: int = 0): IBitmapWrapperWindow;

        function refreshButton(param1: IWindowContainer, param2: String, param3: Boolean, param4: Function, param5: int, param6: String = null): void;

        function getButtonImage(param1: String, param2: String = "_png"): BitmapData;

        function openCatalogClubPage(param1: String): void;

        function openCatalogRoomAdsPage(): void;

        function openCatalogRoomAdsExtendPage(param1: String, param2: String, param3: Date, param4: int): void;

        function showFavouriteRooms(): void;

        function showHistoryRooms(): void;

        function showFrequentRooms(): void;

        function get tracking(): IHabboTracking;

        function goToMainView(): void;

        function goToRoom(param1: int, param2: Boolean, param3: String = "", param4: int = -1): void;

        function isPerkAllowed(param1: String): Boolean;

        function trackGoogle(param1: String, param2: String, param3: int = -1): void;

        function trackNavigationDataPoint(param1: String, param2: String, param3: String = "", param4: int = 0): void;

        function getBoolean(param1: String): Boolean;

        function getInteger(param1: String, param2: int): int;

        function getProperty(param1: String, param2: Dictionary = null): String;
    }
}
