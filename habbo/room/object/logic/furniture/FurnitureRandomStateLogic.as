package com.sulake.habbo.room.object.logic.furniture {
    import com.sulake.habbo.room.events.RoomObjectStateChangeEvent
    import com.sulake.room.events.RoomObjectEvent
    import com.sulake.room.events.RoomSpriteMouseEvent
    import com.sulake.room.utils.IRoomGeometry

    public class FurnitureRandomStateLogic extends FurnitureLogic {

        public function FurnitureRandomStateLogic() {
            super();
        }

        override public function getEventTypes(): Array {
            var _loc1_: Array = ["ROSCE_STATE_RANDOM"];
            return getAllEventTypes(super.getEventTypes(), _loc1_);
        }

        override public function mouseEvent(param1: RoomSpriteMouseEvent, param2: IRoomGeometry): void {
            if (param1 == null || param2 == null) {
                return;
            }
            if (object == null) {
                return;
            }
            var _loc3_: * = param1.type;
            if ("doubleClick" !== _loc3_) {
                super.mouseEvent(param1, param2);
            } else {
                useObject();
            }
        }

        override public function useObject(): void {
            var _loc1_: RoomObjectEvent = null;
            if (eventDispatcher != null && object != null) {
                _loc1_ = new RoomObjectStateChangeEvent("ROSCE_STATE_RANDOM", object);
                eventDispatcher.dispatchEvent(_loc1_);
            }
        }
    }
}
