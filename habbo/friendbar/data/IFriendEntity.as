package com.sulake.habbo.friendbar.data {
    public interface IFriendEntity {

        function get id(): int;

        function get name(): String;

        function get gender(): int;

        function get online(): Boolean;

        function get allowFollow(): Boolean;

        function get figure(): String;

        function get categoryId(): int;

        function get motto(): String;

        function get lastAccess(): String;

        function get realName(): String;

        function get notifications(): Vector.<IFriendNotification>;

        function get logEventId(): int;

        function set logEventId(param1: int): void;

        function getNextLogEventId(): int;
    }
}
