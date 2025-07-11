package com.sulake.habbo.navigator {
    import assets.class_14

    import com.sulake.core.communication.messages.IMessageEvent
    import com.sulake.core.utils.ErrorReportStorage
    import com.sulake.core.window.IWindow
    import com.sulake.core.window.class_3400
    import com.sulake.habbo.communication.IHabboCommunicationManager
    import com.sulake.habbo.communication.messages.incoming.competition.class_293
    import com.sulake.habbo.communication.messages.incoming.friendlist.FriendListFragmentMessageEvent
    import com.sulake.habbo.communication.messages.incoming.friendlist.FriendListUpdateEvent
    import com.sulake.habbo.communication.messages.incoming.handshake.class_143
    import com.sulake.habbo.communication.messages.incoming.handshake.class_556
    import com.sulake.habbo.communication.messages.incoming.navigator.class_1038
    import com.sulake.habbo.communication.messages.incoming.navigator.class_129
    import com.sulake.habbo.communication.messages.incoming.navigator.class_1675
    import com.sulake.habbo.communication.messages.incoming.navigator.class_1727
    import com.sulake.habbo.communication.messages.incoming.navigator.class_1742
    import com.sulake.habbo.communication.messages.incoming.navigator.class_296
    import com.sulake.habbo.communication.messages.incoming.navigator.class_454
    import com.sulake.habbo.communication.messages.incoming.navigator.class_467
    import com.sulake.habbo.communication.messages.incoming.navigator.class_487
    import com.sulake.habbo.communication.messages.incoming.navigator.class_526
    import com.sulake.habbo.communication.messages.incoming.navigator.class_534
    import com.sulake.habbo.communication.messages.incoming.navigator.class_605
    import com.sulake.habbo.communication.messages.incoming.navigator.class_627
    import com.sulake.habbo.communication.messages.incoming.navigator.class_722
    import com.sulake.habbo.communication.messages.incoming.navigator.class_746
    import com.sulake.habbo.communication.messages.incoming.navigator.class_750
    import com.sulake.habbo.communication.messages.incoming.navigator.class_761
    import com.sulake.habbo.communication.messages.incoming.navigator.class_795
    import com.sulake.habbo.communication.messages.incoming.navigator.class_837
    import com.sulake.habbo.communication.messages.incoming.navigator.class_936
    import com.sulake.habbo.communication.messages.incoming.newnavigator.class_151
    import com.sulake.habbo.communication.messages.incoming.newnavigator.class_3439
    import com.sulake.habbo.communication.messages.incoming.newnavigator.class_348
    import com.sulake.habbo.communication.messages.incoming.newnavigator.class_364
    import com.sulake.habbo.communication.messages.incoming.newnavigator.class_713
    import com.sulake.habbo.communication.messages.incoming.newnavigator.class_760
    import com.sulake.habbo.communication.messages.incoming.newnavigator.class_954
    import com.sulake.habbo.communication.messages.incoming.room.chat.class_583
    import com.sulake.habbo.communication.messages.incoming.room.session.class_357
    import com.sulake.habbo.communication.messages.incoming.room.session.class_640
    import com.sulake.habbo.communication.messages.incoming.room.session.class_875
    import com.sulake.habbo.communication.messages.incoming.roomsettings.class_1044
    import com.sulake.habbo.communication.messages.incoming.roomsettings.class_1064
    import com.sulake.habbo.communication.messages.incoming.roomsettings.class_1082
    import com.sulake.habbo.communication.messages.incoming.roomsettings.class_319
    import com.sulake.habbo.communication.messages.incoming.roomsettings.class_540
    import com.sulake.habbo.communication.messages.incoming.roomsettings.class_718
    import com.sulake.habbo.communication.messages.incoming.roomsettings.class_770
    import com.sulake.habbo.communication.messages.incoming.roomsettings.class_839
    import com.sulake.habbo.communication.messages.incoming.roomsettings.class_923
    import com.sulake.habbo.communication.messages.incoming.roomsettings.class_963
    import com.sulake.habbo.communication.messages.incoming.roomsettings.class_987
    import com.sulake.habbo.communication.messages.incoming.users.class_835
    import com.sulake.habbo.communication.messages.outgoing.navigator.class_553
    import com.sulake.habbo.communication.messages.outgoing.navigator.class_831
    import com.sulake.habbo.communication.messages.outgoing.navigator.class_998
    import com.sulake.habbo.communication.messages.outgoing.room.session.class_325
    import com.sulake.habbo.communication.messages.parser.handshake.class_1267
    import com.sulake.habbo.communication.messages.parser.navigator.class_1129
    import com.sulake.habbo.communication.messages.parser.navigator.class_1157
    import com.sulake.habbo.communication.messages.parser.navigator.class_1349
    import com.sulake.habbo.communication.messages.parser.navigator.class_1368
    import com.sulake.habbo.communication.messages.parser.navigator.class_1377
    import com.sulake.habbo.communication.messages.parser.navigator.class_1388
    import com.sulake.habbo.communication.messages.parser.navigator.class_1446
    import com.sulake.habbo.communication.messages.parser.navigator.class_1468
    import com.sulake.habbo.communication.messages.parser.navigator.class_1523
    import com.sulake.habbo.communication.messages.parser.navigator.class_1539
    import com.sulake.habbo.communication.messages.parser.navigator.class_1588
    import com.sulake.habbo.communication.messages.parser.navigator.class_1616
    import com.sulake.habbo.communication.messages.parser.room.chat.class_1253
    import com.sulake.habbo.communication.messages.parser.room.session.class_1428
    import com.sulake.habbo.communication.messages.parser.room.session.class_1515
    import com.sulake.habbo.communication.messages.parser.roomsettings.class_1120
    import com.sulake.habbo.communication.messages.parser.roomsettings.class_1185
    import com.sulake.habbo.communication.messages.parser.roomsettings.class_1204
    import com.sulake.habbo.communication.messages.parser.roomsettings.class_1293
    import com.sulake.habbo.communication.messages.parser.roomsettings.class_1296
    import com.sulake.habbo.communication.messages.parser.roomsettings.class_1374
    import com.sulake.habbo.communication.messages.parser.roomsettings.class_1399
    import com.sulake.habbo.communication.messages.parser.roomsettings.class_1417
    import com.sulake.habbo.communication.messages.parser.roomsettings.class_1429
    import com.sulake.habbo.communication.messages.parser.roomsettings.class_1514
    import com.sulake.habbo.navigator.domain.NavigatorData
    import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator
    import com.sulake.habbo.navigator.transitional.LegacyNavigator
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent
    import com.sulake.habbo.utils.HabboWebTools

    [SecureSWF(rename="true")]
    public class NewIncomingMessages {

        private var _navigator: HabboNewNavigator;

        private var _messageListeners: Array;

        public function NewIncomingMessages(param1: HabboNewNavigator) {
            _messageListeners = [];
            super();
            _navigator = param1;
            var _loc2_: IHabboCommunicationManager = _navigator.communication;
            addMessageListeners();
        }

        public function addMessageListeners(): void {
            var _loc1_: IHabboCommunicationManager = _navigator.communication;
            _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_963(onMuteAllEvent)));
            _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_722(onCanCreateRoomEventEvent)));
            _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_357(onDoorOpened)));
            _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_454(onGuestRoomSearchResult)));
            _messageListeners.push(_loc1_.connection.addMessageEvent(new class_760(onNavigatorMetaData)));
            _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_605(onUserFlatCats)));
            _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_583(onRoomFilterSettings)));
            _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new FriendListUpdateEvent(onFriendListUpdate)));
            _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_534(onCompetitionData)));
            _messageListeners.push(_loc1_.connection.addMessageEvent(new class_348(onNavigatorLiftedRooms)));
            _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_761(onFavouriteChanged)));
            _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_746(onRoomRating)));
            _messageListeners.push(_loc1_.connection.addMessageEvent(new class_954(onCollapsedCategories)));
            _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_936(onPopularRoomTagsResult)));
            _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_296(onOfficialRooms)));
            _messageListeners.push(_loc1_.connection.addMessageEvent(new class_151(onNavigatorSearchResultBlocks)));
            _messageListeners.push(_loc1_.connection.addMessageEvent(new class_835(onGroupDetails)));
            _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_795(onFlatCreated)));
            _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_837(onDoorbell)));
            _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_987(onRoomSettingsSaveError)));
            _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_718(onFlatControllers)));
            _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_1082(onNoSuchFlat)));
            _messageListeners.push(_loc1_.connection.addMessageEvent(new class_713(onSavedSearches)));
            _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_839(onFlatControllerRemoved)));
            _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_770(onRoomSettingsData)));
            _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_923(onBannedUsersFromRoom)));
            _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_1044(onFlatControllerAdded)));
            _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_293(onNoOwnedRoomsAlert)));
            _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_526(onUserEventCats)));
            _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_540(onRoomSettingsSaved)));
            _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new FriendListFragmentMessageEvent(onFriendsListFragment)));
            _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_640(onRoomExit)));
            _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_750(onRoomEventCancel)));
            _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_319(onRoomSettingsError)));
            _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_1038(onFlatAccessDenied)));
            _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_129(onFavourites)));
            _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_1064(onUserUnbannedFromRoom)));
            _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_627(onRoomEventEvent)));
            _messageListeners.push(_loc1_.connection.addMessageEvent(new class_364(onNavigatorPreferences)));
            _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_467(onCategoriesWithUserCount)));
            _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_875(onCantConnect)));
            _messageListeners.push(_loc1_.addHabboConnectionMessageEvent(new class_487(onRoomInfoUpdated)));
        }

        public function removeLegacyMessageListeners(): void {
            var _loc1_: IHabboCommunicationManager = _navigator.communication;
            for each(var _loc2_ in _messageListeners) {
                _loc1_.removeHabboConnectionMessageEvent(_loc2_);
            }
            _messageListeners = [];
        }

        private function onNavigatorMetaData(param1: class_760): void {
            _navigator.initialize(param1.getParser());
        }

        private function onNavigatorSearchResultBlocks(param1: class_151): void {
            _navigator.onSearchResult(new class_3439(param1.getParser().searchResult));
        }

        private function onNavigatorLiftedRooms(param1: class_348): void {
            _navigator.onLiftedRooms(param1.getParser());
        }

        private function onNavigatorPreferences(param1: class_364): void {
            _navigator.onPreferences(param1.getParser());
        }

        private function onSavedSearches(param1: class_713): void {
            _navigator.onSavedSearches(param1.getParser());
        }

        private function onGroupDetails(param1: class_835): void {
            _navigator.onGroupDetails(param1.data);
        }

        private function onCollapsedCategories(param1: class_954): void {
            _navigator.onCollapsedCategories(param1.getParser().collapsedCategories);
        }

        private function get data(): NavigatorData {
            return _navigator.data;
        }

        private function onMuteAllEvent(param1: IMessageEvent): void {
            var _loc4_: class_963;
            var _loc3_: class_1374 = (_loc4_ = param1 as class_963).getParser();
            var _loc2_: class_1675 = _navigator.data.enteredGuestRoom;
            if (_loc2_ != null) {
                _loc2_.allInRoomMuted = _loc3_.allMuted;
                if (LegacyNavigator(_navigator.legacyNavigator).roomInfoViewCtrl != null) {
                    LegacyNavigator(_navigator.legacyNavigator).roomInfoViewCtrl.refreshButtons(_navigator.data.enteredGuestRoom);
                }
            }
        }

        private function onNoSuchFlat(param1: IMessageEvent): void {
        }

        private function onUserObject(param1: IMessageEvent): void {
            var _loc2_: class_1267 = class_556(param1).getParser();
            _navigator.data.avatarId = _loc2_.id;
            LegacyNavigator(_navigator.legacyNavigator).send(new class_831());
            LegacyNavigator(_navigator.legacyNavigator).send(new class_998());
        }

        private function onUserRights(param1: IMessageEvent): void {
            var _loc2_: class_143 = null;
            if (_navigator) {
                _loc2_ = class_143(param1);
                if (_loc2_.securityLevel >= 5) {
                    _navigator.data.eventMod = true;
                }
                if (_loc2_.securityLevel >= 7) {
                    _navigator.data.roomPicker = true;
                }
            }
        }

        private function onCategoriesWithUserCount(param1: IMessageEvent): void {
            var _loc2_: class_1388 = class_467(param1).getParser();
            data.categoriesWithVisitorData = _loc2_.data;
            class_14.log("Received Categories with user count: " + data.categoriesWithVisitorData.categoryToCurrentUserCountMap.length);
        }

        private function onOfficialRooms(param1: IMessageEvent): void {
            var _loc2_: class_1368 = class_296(param1).getParser();
            data.officialRooms = _loc2_.data;
            data.adRoom = _loc2_.adRoom;
            data.promotedRooms = _loc2_.promotedRooms;
            class_14.log("Received Official rooms: " + data.officialRooms.entries.length);
        }

        private function onGuestRoomSearchResult(param1: IMessageEvent): void {
            var _loc2_: class_1742 = class_454(param1).getParser().data;
            data.guestRoomSearchResults = _loc2_;
            class_14.log("Received GuestRoomSearch: " + (!!data.guestRoomSearchResults.rooms ? data.guestRoomSearchResults.rooms.length : " no rooms"));
        }

        private function onPopularRoomTagsResult(param1: IMessageEvent): void {
            var _loc2_: class_1727 = class_936(param1).getParser().data;
            data.popularTags = _loc2_;
            class_14.log("Received popular room tags: " + data.popularTags.tags.length);
        }

        private function onRoomEventEvent(param1: IMessageEvent): void {
            var _loc2_: class_1157 = class_627(param1).getParser();
            class_14.log("Got room event: " + _loc2_.data.ownerAvatarId + ", " + _loc2_.data.eventName);
            data.roomEventData = _loc2_.data.ownerAvatarId > 0 ? _loc2_.data : null;
            LegacyNavigator(_navigator.legacyNavigator).roomEventInfoCtrl.refresh();
        }

        private function onRoomEventCancel(param1: IMessageEvent): void {
            data.roomEventData = null;
            LegacyNavigator(_navigator.legacyNavigator).roomEventInfoCtrl.refresh();
        }

        private function onCanCreateRoomEventEvent(param1: IMessageEvent): void {
            var _loc3_: SimpleAlertView = null;
            var _loc2_: class_1349 = class_722(param1).getParser();
            class_14.log("CAN CREATE EVENT: " + _loc2_.canCreateEvent);
            if (_loc2_.canCreateEvent) {
                LegacyNavigator(_navigator.legacyNavigator).roomEventViewCtrl.show();
            } else {
                _loc3_ = new SimpleAlertView(LegacyNavigator(_navigator.legacyNavigator), "${navigator.cannotcreateevent.title}", "${navigator.cannotcreateevent.error." + _loc2_.errorCode + "}");
                _loc3_.show();
                class_14.log("Cannot create an event just now...");
            }
        }

        private function requestRoomEnterAd(): void {
            if (_navigator.getProperty("roomenterad.habblet.enabled") == "true") {
                HabboWebTools.openRoomEnterAd();
            }
        }

        private function onFlatCreated(param1: IMessageEvent): void {
            var _loc2_: class_1616 = class_795(param1).getParser();
            ErrorReportStorage.addDebugData("IncomingEvent", "Flat created: " + _loc2_.flatId + ", " + _loc2_.flatName);
            data.createdFlatId = _loc2_.flatId;
            LegacyNavigator(_navigator.legacyNavigator).goToRoom(_loc2_.flatId, true);
            LegacyNavigator(_navigator.legacyNavigator).mainViewCtrl.reloadRoomList(5);
            LegacyNavigator(_navigator.legacyNavigator).goToMainView();
            LegacyNavigator(_navigator.legacyNavigator).closeNavigator();
        }

        private function onGameStarted(param1: IMessageEvent): void {
            LegacyNavigator(_navigator.legacyNavigator).mainViewCtrl.close();
        }

        private function onRoomExit(param1: IMessageEvent): void {
            class_14.log("Navigator: exiting room");
            data.onRoomExit();
            LegacyNavigator(_navigator.legacyNavigator).roomInfoViewCtrl.close();
            LegacyNavigator(_navigator.legacyNavigator).roomEventInfoCtrl.close();
            LegacyNavigator(_navigator.legacyNavigator).roomEventViewCtrl.close();
            LegacyNavigator(_navigator.legacyNavigator).roomSettingsCtrl.close();
            LegacyNavigator(_navigator.legacyNavigator).roomFilterCtrl.close();
            var _loc2_: Boolean = _navigator.getBoolean("news.auto_popup.enabled");
            if (_loc2_) {
                HabboWebTools.openNews();
            }
        }

        private function onUserFlatCats(param1: IMessageEvent): void {
            var _loc3_: class_1377 = (param1 as class_605).getParser();
            _navigator.data.categories = _loc3_.nodes;
            var _loc2_: RoomsTabPageDecorator = RoomsTabPageDecorator(LegacyNavigator(_navigator.legacyNavigator).tabs.getTab(2).tabPageDecorator);
            _loc2_.prepareRoomCategories();
        }

        private function onUserEventCats(param1: IMessageEvent): void {
            var _loc2_: class_1129 = (param1 as class_526).getParser();
            _navigator.data.eventCategories = _loc2_.eventCategories;
        }

        private function onRoomSettingsData(param1: IMessageEvent): void {
            var _loc2_: class_1120 = null;
            try {
                _loc2_ = (param1 as class_770).getParser();
                LegacyNavigator(_navigator.legacyNavigator).roomSettingsCtrl.onRoomSettings(_loc2_.data);
                class_14.log("GOT ROOM SETTINGS DATA: " + _loc2_.data.name + ", " + _loc2_.data.maximumVisitors + ", " + _loc2_.data.maximumVisitorsLimit);
            } catch (e: Error) {
                class_14.log("CRASHED WHILE PROCESSING ROOM SETTINGS DATA!");
            }
        }

        private function onRoomFilterSettings(param1: IMessageEvent): void {
            var _loc2_: class_1253 = (param1 as class_583).getParser();
            LegacyNavigator(_navigator.legacyNavigator).roomFilterCtrl.onRoomFilterSettings(_loc2_.badWords);
            class_14.log("GOT ROOM FILTER SETTINGS: " + _loc2_.badWords);
        }

        private function onRoomSettingsError(param1: IMessageEvent): void {
            var _loc2_: class_1296 = (param1 as class_319).getParser();
        }

        private function onRoomSettingsSaved(param1: IMessageEvent): void {
            var _loc2_: class_1514 = (param1 as class_540).getParser();
            ErrorReportStorage.addDebugData("IncomingEvent", "Room settings saved: " + _loc2_.roomId);
            LegacyNavigator(_navigator.legacyNavigator).mainViewCtrl.reloadRoomList(5);
        }

        private function onRoomSettingsSaveError(param1: IMessageEvent): void {
            var _loc2_: class_1204 = (param1 as class_987).getParser();
            LegacyNavigator(_navigator.legacyNavigator).roomSettingsCtrl.onRoomSettingsSaveError(_loc2_.roomId, _loc2_.errorCode, _loc2_.info);
        }

        private function onRoomInfoUpdated(param1: IMessageEvent): void {
            var _loc2_: class_1468 = (param1 as class_487).getParser();
            LegacyNavigator(_navigator.legacyNavigator).send(new class_553(_loc2_.flatId, false, false));
        }

        private function onFavourites(param1: IMessageEvent): void {
            var _loc2_: class_1588 = (param1 as class_129).getParser();
            _navigator.data.onFavourites(_loc2_);
        }

        private function onFavouriteChanged(param1: IMessageEvent): void {
            var _loc2_: class_1446 = (param1 as class_761).getParser();
            data.favouriteChanged(_loc2_.flatId, _loc2_.added);
            LegacyNavigator(_navigator.legacyNavigator).roomInfoViewCtrl.reload();
            LegacyNavigator(_navigator.legacyNavigator).mainViewCtrl.refresh();
        }

        private function onFlatControllers(param1: IMessageEvent): void {
            var _loc2_: class_1185 = (param1 as class_718).getParser();
            LegacyNavigator(_navigator.legacyNavigator).roomSettingsCtrl.onFlatControllers(_loc2_.roomId, _loc2_.controllers);
        }

        private function onFlatControllerAdded(param1: IMessageEvent): void {
            var _loc2_: class_1399 = (param1 as class_1044).getParser();
            LegacyNavigator(_navigator.legacyNavigator).roomSettingsCtrl.onFlatControllerAdded(_loc2_.flatId, _loc2_.data);
        }

        private function onFlatControllerRemoved(param1: IMessageEvent): void {
            var _loc2_: class_1293 = (param1 as class_839).getParser();
            class_14.log("Flat controller removed: " + _loc2_.flatId + ", " + _loc2_.userId);
            LegacyNavigator(_navigator.legacyNavigator).roomSettingsCtrl.onFlatControllerRemoved(_loc2_.flatId, _loc2_.userId);
        }

        private function onBannedUsersFromRoom(param1: IMessageEvent): void {
            var _loc2_: class_1429 = (param1 as class_923).getParser();
            class_14.log("Got Banned users for room: " + _loc2_.roomId + ", " + _loc2_.bannedUsers.length);
            LegacyNavigator(_navigator.legacyNavigator).roomSettingsCtrl.onBannedUsersFromRoom(_loc2_.roomId, _loc2_.bannedUsers);
        }

        private function onUserUnbannedFromRoom(param1: IMessageEvent): void {
            var _loc2_: class_1417 = (param1 as class_1064).getParser();
            class_14.log("User was unbanned from room. User Id: " + _loc2_.userId + " Room Id: " + _loc2_.roomId);
            LegacyNavigator(_navigator.legacyNavigator).roomSettingsCtrl.onUserUnbannedFromRoom(_loc2_.roomId, _loc2_.userId);
        }

        private function onDoorbell(param1: IMessageEvent): void {
            var _loc2_: class_837 = param1 as class_837;
            if (_loc2_ == null) {
                return;
            }
            if (_loc2_.userName != "") {
                return;
            }
            LegacyNavigator(_navigator.legacyNavigator).doorbell.showWaiting();
        }

        private function onDoorOpened(param1: IMessageEvent): void {
            var _loc3_: class_357 = param1 as class_357;
            if (_loc3_ == null) {
                return;
            }
            var _loc2_: class_1515 = _loc3_.getParser();
            if (_loc2_ != null && (_loc2_.userName == null || _loc2_.userName.length == 0)) {
                LegacyNavigator(_navigator.legacyNavigator).doorbell.hide();
            }
        }

        private function onRoomRating(param1: IMessageEvent): void {
            var _loc2_: class_1523 = (param1 as class_746).getParser();
            data.currentRoomRating = _loc2_.rating;
            data.canRate = _loc2_.canRate;
            LegacyNavigator(_navigator.legacyNavigator).roomInfoViewCtrl.reload();
        }

        private function onFlatAccessDenied(param1: IMessageEvent): void {
            var _loc2_: class_1539 = (param1 as class_1038).getParser();
            if (_loc2_.userName == null || _loc2_.userName == "") {
                LegacyNavigator(_navigator.legacyNavigator).doorbell.showNoAnswer();
            }
        }

        private function onFriendsListFragment(param1: IMessageEvent): void {
            data.friendList.onFriendsListFragment(param1);
        }

        private function onFriendListUpdate(param1: IMessageEvent): void {
            data.friendList.onFriendListUpdate(param1);
            LegacyNavigator(_navigator.legacyNavigator).roomSettingsCtrl.onFriendListUpdate();
        }

        private function onCompetitionData(param1: class_534): void {
            data.competitionRoomsData = param1.getParser().data;
        }

        private function forwardToRoom(param1: int): void {
            LegacyNavigator(_navigator.legacyNavigator).send(new class_553(param1, false, true));
            LegacyNavigator(_navigator.legacyNavigator).trackNavigationDataPoint("Room Forward", "go.roomforward", "", param1);
        }

        private function onNoOwnedRoomsAlert(param1: class_293): void {
            LegacyNavigator(_navigator.legacyNavigator).startRoomCreation();
        }

        private function closeOpenCantConnectAlerts(): void {
            var _loc1_: Array = null;
            var _loc7_: class_3400 = null;
            var _loc4_: int = 0;
            var _loc5_: int = 0;
            var _loc6_: IWindow = null;
            var _loc3_: AlertView = null;
            if (_navigator != null) {
                _loc1_ = [];
                _loc4_ = int((_loc7_ = _navigator.windowManager.getWindowContext(2)).getDesktopWindow().numChildren);
                _loc5_ = 0;
                while (_loc5_ < _loc4_) {
                    if ((_loc6_ = _loc7_.getDesktopWindow().getChildAt(_loc5_)).tags.indexOf("SimpleAlertView") > -1) {
                        _loc1_.push(_loc6_);
                    }
                    _loc5_++;
                }
                if (_loc1_.length > 0) {
                    for each(var _loc2_ in _loc1_) {
                        _loc3_ = AlertView.findAlertView(_loc2_);
                        if (_loc3_ != null) {
                            _loc3_.dispose();
                        }
                    }
                }
            }
        }

        private function onCantConnect(param1: IMessageEvent): void {
            var _loc2_: SimpleAlertView = null;
            var _loc3_: class_1428 = (param1 as class_875).getParser();
            class_14.log("FAILED TO CONNECT: REASON: " + _loc3_.reason);
            switch (_loc3_.reason - 1) {
                case 0:
                    _loc2_ = new SimpleAlertView(LegacyNavigator(_navigator.legacyNavigator), "${navigator.guestroomfull.title}", "${navigator.guestroomfull.text}");
                    _loc2_.show();
                    break;
                case 2:
                    _loc2_ = new SimpleAlertView(LegacyNavigator(_navigator.legacyNavigator), "${room.queue.error.title}", "${room.queue.error." + _loc3_.parameter + "}");
                    _loc2_.show();
                    break;
                case 3:
                    _loc2_ = new SimpleAlertView(LegacyNavigator(_navigator.legacyNavigator), "${navigator.banned.title}", "${navigator.banned.text}");
                    _loc2_.show();
                    break;
                default:
                    _loc2_ = new SimpleAlertView(LegacyNavigator(_navigator.legacyNavigator), "${room.queue.error.title}", "${room.queue.error.title}");
                    _loc2_.show();
            }
            LegacyNavigator(_navigator.legacyNavigator).send(new class_325());
            var _loc4_: HabboToolbarEvent;
            (_loc4_ = new HabboToolbarEvent("HTE_TOOLBAR_CLICK")).iconId = "HTIE_ICON_RECEPTION";
            LegacyNavigator(_navigator.legacyNavigator).toolbar.events.dispatchEvent(_loc4_);
        }
    }
}
