package com.sulake.habbo.room.events {
    import com.sulake.room.events.RoomObjectEvent
    import com.sulake.room.object.IRoomObject

    public class RoomObjectStateChangeEvent extends RoomObjectEvent {

        public static const ROOM_OBJECT_STATE_CHANGE: String = "ROSCE_STATE_CHANGE";

        public static const ROOM_OBJECT_STATE_RANDOM: String = "ROSCE_STATE_RANDOM";

        public function RoomObjectStateChangeEvent(param1: String, param2: IRoomObject, param3: int = 0, param4: Boolean = false, param5: Boolean = false) {
            super(param1, param2, param4, param5);
            var_837 = param3;
        }
        private var var_837: int = 0;

        public function get param(): int {
            return var_837;
        }
    }
}
