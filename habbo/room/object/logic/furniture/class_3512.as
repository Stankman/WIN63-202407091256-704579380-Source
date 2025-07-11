package com.sulake.habbo.room.object.logic.furniture {
    import com.sulake.habbo.room.events.RoomObjectDataRequestEvent

    public class class_3512 extends FurnitureLogic {

        public function class_3512() {
            super();
        }

        override public function get widget(): String {
            return "RWE_YOUTUBE";
        }

        override public function getEventTypes(): Array {
            return getAllEventTypes(super.getEventTypes(), ["RODRE_URL_PREFIX"]);
        }

        override public function update(param1: int): void {
            super.update(param1);
            if (!object.getModel().hasString("session_url_prefix")) {
                eventDispatcher.dispatchEvent(new RoomObjectDataRequestEvent("RODRE_URL_PREFIX", object));
            }
        }
    }
}
