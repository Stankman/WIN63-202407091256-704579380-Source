package com.sulake.habbo.room.object.logic.room {
    import com.sulake.habbo.room.events.RoomObjectTileMouseEvent
    import com.sulake.habbo.room.events.RoomObjectWallMouseEvent
    import com.sulake.habbo.room.messages.RoomObjectRoomColorUpdateMessage
    import com.sulake.habbo.room.messages.RoomObjectRoomFloorHoleUpdateMessage
    import com.sulake.habbo.room.messages.RoomObjectRoomMaskUpdateMessage
    import com.sulake.habbo.room.messages.RoomObjectRoomPlanePropertyUpdateMessage
    import com.sulake.habbo.room.messages.RoomObjectRoomPlaneVisibilityUpdateMessage
    import com.sulake.habbo.room.messages.RoomObjectRoomUpdateMessage
    import com.sulake.habbo.room.object.RoomPlaneBitmapMaskData
    import com.sulake.habbo.room.object.RoomPlaneBitmapMaskParser
    import com.sulake.habbo.room.object.RoomPlaneParser
    import com.sulake.room.events.RoomObjectEvent
    import com.sulake.room.events.RoomSpriteMouseEvent
    import com.sulake.room.messages.RoomObjectUpdateMessage
    import com.sulake.room.object.IRoomObjectModelController
    import com.sulake.room.object.logic.ObjectLogicBase
    import com.sulake.room.utils.ColorTransitioner
    import com.sulake.room.utils.IRoomGeometry
    import com.sulake.room.utils.IVector3d
    import com.sulake.room.utils.Vector3d

    import flash.geom.Point
    import flash.utils.getTimer

    public class RoomLogic extends ObjectLogicBase {

        public function RoomLogic() {
            super();
            _planeParser = new RoomPlaneParser();
            _planeMaskparser = new RoomPlaneBitmapMaskParser();
            _colorTransitioner = new ColorTransitioner();
        }
        protected var _planeParser: RoomPlaneParser = null;
        private var _planeMaskparser: RoomPlaneBitmapMaskParser = null;
        private var _colorTransitioner: ColorTransitioner = null;
        private var var_3220: Boolean;

        override public function getEventTypes(): Array {
            var _loc1_: Array = ["ROE_MOUSE_MOVE", "ROE_MOUSE_CLICK"];
            return getAllEventTypes(super.getEventTypes(), _loc1_);
        }

        override public function dispose(): void {
            super.dispose();
            if (_planeParser != null) {
                _planeParser.dispose();
                _planeParser = null;
            }
            if (_planeMaskparser != null) {
                _planeMaskparser.dispose();
                _planeMaskparser = null;
            }
            _colorTransitioner = null;
        }

        override public function initialize(param1: XML): void {
            if (param1 == null || object == null) {
                return;
            }
            if (!_planeParser.initializeFromXML(param1)) {
                return;
            }
            var _loc2_: IRoomObjectModelController = object.getModel() as IRoomObjectModelController;
            if (_loc2_ != null) {
                _loc2_.setString("room_plane_xml", param1.toString());
                _loc2_.setNumber("room_background_color", 16777215);
                _loc2_.setNumber("room_floor_visibility", 1);
                _loc2_.setNumber("room_wall_visibility", 1);
                _loc2_.setNumber("room_landscape_visibility", 1);
            }
        }

        override public function update(param1: int): void {
            var _loc3_: IRoomObjectModelController = null;
            var _loc2_: XML = null;
            super.update(param1);
            updateBackgroundColor(param1);
            if (var_3220) {
                if (object != null) {
                    _loc3_ = object.getModel() as IRoomObjectModelController;
                    if (_loc3_ != null) {
                        _loc2_ = _planeParser.getXML();
                        _loc3_.setString("room_plane_xml", _loc2_.toString());
                        _loc3_.setNumber("room_floor_hole_update_time", param1);
                        _planeParser.initializeFromXML(_loc2_);
                    }
                }
                var_3220 = false;
            }
        }

        override public function processUpdateMessage(param1: RoomObjectUpdateMessage): void {
            if (param1 == null || object == null) {
                return;
            }
            var _loc5_: IRoomObjectModelController;
            if ((_loc5_ = object.getModel() as IRoomObjectModelController) == null) {
                return;
            }
            var _loc3_: RoomObjectRoomUpdateMessage = param1 as RoomObjectRoomUpdateMessage;
            if (_loc3_ != null) {
                updatePlaneTypes(_loc3_, _loc5_);
                return;
            }
            var _loc2_: RoomObjectRoomMaskUpdateMessage = param1 as RoomObjectRoomMaskUpdateMessage;
            if (_loc2_ != null) {
                updatePlaneMasks(_loc2_, _loc5_);
                return;
            }
            var _loc6_: RoomObjectRoomPlaneVisibilityUpdateMessage;
            if ((_loc6_ = param1 as RoomObjectRoomPlaneVisibilityUpdateMessage) != null) {
                updatePlaneVisibilities(_loc6_, _loc5_);
                return;
            }
            var _loc4_: RoomObjectRoomPlanePropertyUpdateMessage;
            if ((_loc4_ = param1 as RoomObjectRoomPlanePropertyUpdateMessage) != null) {
                updatePlaneProperties(_loc4_, _loc5_);
                return;
            }
            var _loc8_: RoomObjectRoomFloorHoleUpdateMessage;
            if ((_loc8_ = param1 as RoomObjectRoomFloorHoleUpdateMessage) != null) {
                updateFloorHoles(_loc8_, _loc5_);
            }
            var _loc7_: RoomObjectRoomColorUpdateMessage;
            if ((_loc7_ = param1 as RoomObjectRoomColorUpdateMessage) != null) {
                updateColors(_loc7_, _loc5_);

            }
        }

        override public function mouseEvent(param1: RoomSpriteMouseEvent, param2: IRoomGeometry): void {
            var _loc20_: String = null;
            var _loc14_: Number = NaN;
            var _loc23_: Number = NaN;
            var _loc24_: Number = NaN;
            if (param2 == null) {
                return;
            }
            var _loc7_: *;
            if ((_loc7_ = param1) == null) {
                return;
            }
            if (object == null || param1 == null) {
                return;
            }
            var _loc9_: IRoomObjectModelController;
            if ((_loc9_ = object.getModel() as IRoomObjectModelController) == null) {
                return;
            }
            var _loc10_: int = 0;
            var _loc11_: String;
            if ((_loc11_ = _loc7_.spriteTag) != null && _loc11_.indexOf("@") >= 0) {
                _loc10_ = parseInt(_loc11_.substr(_loc11_.indexOf("@") + 1));
            }
            if (_loc10_ < 1 || _loc10_ > _planeParser.planeCount) {
                if (param1.type == "rollOut") {
                    _loc9_.setNumber("room_selected_plane", 0);
                }
                return;
            }
            _loc10_ -= 1;
            var _loc15_: Point = null;
            var _loc4_: IVector3d = _planeParser.getPlaneLocation(_loc10_);
            var _loc8_: IVector3d = _planeParser.getPlaneLeftSide(_loc10_);
            var _loc19_: IVector3d = _planeParser.getPlaneRightSide(_loc10_);
            var _loc25_: IVector3d = _planeParser.getPlaneNormalDirection(_loc10_);
            var _loc21_: int = _planeParser.getPlaneType(_loc10_);
            if (_loc4_ == null || _loc8_ == null || _loc19_ == null || _loc25_ == null) {
                return;
            }
            var _loc22_: Number = Number(_loc8_.length);
            var _loc5_: Number = Number(_loc19_.length);
            if (_loc22_ == 0 || _loc5_ == 0) {
                return;
            }
            var _loc27_: Number = _loc7_.screenX;
            var _loc28_: Number = _loc7_.screenY;
            var _loc26_: Point = new Point(_loc27_, _loc28_);
            if ((_loc15_ = param2.getPlanePosition(_loc26_, _loc4_, _loc8_, _loc19_)) == null) {
                _loc9_.setNumber("room_selected_plane", 0);
                return;
            }
            var _loc3_: Vector3d = Vector3d.product(_loc8_, _loc15_.x / _loc22_);
            _loc3_.add(Vector3d.product(_loc19_, _loc15_.y / _loc5_));
            _loc3_.add(_loc4_);
            var _loc16_: Number = _loc3_.x;
            var _loc17_: Number = _loc3_.y;
            var _loc18_: Number = _loc3_.z;
            if (_loc15_.x >= 0 && _loc15_.x < _loc22_ && _loc15_.y >= 0 && _loc15_.y < _loc5_) {
                _loc9_.setNumber("room_selected_x", _loc16_);
                _loc9_.setNumber("room_selected_y", _loc17_);
                _loc9_.setNumber("room_selected_z", _loc18_);
                _loc9_.setNumber("room_selected_plane", _loc10_ + 1);
                var _loc6_: String = "";
                var _loc12_: int = 0;
                var _loc13_: RoomObjectEvent = null;
                switch (param1.type) {
                    case "mouseMove":
                    case "rollOver":
                    case "mouseDown":
                    case "click":
                        _loc20_ = "";
                        if (param1.type == "mouseMove" || param1.type == "rollOver") {
                            _loc20_ = "ROE_MOUSE_MOVE";
                        } else if (param1.type == "click") {
                            _loc20_ = "ROE_MOUSE_CLICK";
                        } else if (param1.type == "mouseDown") {
                            _loc20_ = "ROE_MOUSE_DOWN";
                        }
                        if (eventDispatcher != null) {
                            if (_loc21_ == 1) {
                                _loc13_ = new RoomObjectTileMouseEvent(_loc20_, object, param1.eventId, _loc16_, _loc17_, _loc18_, param1.altKey, param1.ctrlKey, param1.shiftKey);
                            } else if (_loc21_ == 2 || _loc21_ == 3) {
                                _loc14_ = 90;
                                if (_loc25_ != null) {
                                    if ((_loc14_ = _loc25_.x + 90) > 360) {
                                        _loc14_ -= 360;
                                    }
                                }
                                _loc23_ = _loc8_.length * _loc15_.x / _loc22_;
                                _loc24_ = _loc19_.length * _loc15_.y / _loc5_;
                                _loc13_ = new RoomObjectWallMouseEvent(_loc20_, object, param1.eventId, _loc4_, _loc8_, _loc19_, _loc23_, _loc24_, _loc14_);
                            }
                            if (_loc13_ != null) {
                                eventDispatcher.dispatchEvent(_loc13_);
                            }
                        }
                }
                return;
            }
            _loc9_.setNumber("room_selected_plane", 0);
        }

        private function updateBackgroundColor(param1: int): void {
            var _loc2_: int = 0;
            var _loc3_: IRoomObjectModelController = null;
            if (object == null) {
                return;
            }
            if (_colorTransitioner && _colorTransitioner.updateColor(param1)) {
                _loc2_ = _colorTransitioner.color;
                _loc3_ = object.getModel() as IRoomObjectModelController;
                if (_loc3_ == null) {
                    return;
                }
                _loc3_.setNumber("room_background_color", _loc2_);
            }
        }

        private function updatePlaneTypes(param1: RoomObjectRoomUpdateMessage, param2: IRoomObjectModelController): void {
            switch (param1.type) {
                case "RORUM_ROOM_FLOOR_UPDATE":
                    param2.setString("room_floor_type", param1.value);
                    break;
                case "RORUM_ROOM_WALL_UPDATE":
                    param2.setString("room_wall_type", param1.value);
                    break;
                case "RORUM_ROOM_LANDSCAPE_UPDATE":
                    param2.setString("room_landscape_type", param1.value);
            }
        }

        private function updatePlaneMasks(param1: RoomObjectRoomMaskUpdateMessage, param2: IRoomObjectModelController): void {
            var _loc7_: String = null;
            var _loc6_: XML = null;
            var _loc4_: String = null;
            var _loc5_: RoomPlaneBitmapMaskData = null;
            var _loc3_: Boolean = false;
            switch (param1.type) {
                case "RORMUM_ADD_MASK":
                    _loc7_ = "window";
                    if (param1.maskCategory == "hole") {
                        _loc7_ = "hole";
                    }
                    _planeMaskparser.addMask(param1.maskId, param1.maskType, param1.maskLocation, _loc7_);
                    _loc3_ = true;
                    break;
                case "RORMUM_ADD_MASK":
                    _loc3_ = _planeMaskparser.removeMask(param1.maskId);
            }
            if (_loc3_) {
                _loc4_ = (_loc6_ = _planeMaskparser.getXML()).toXMLString();
                param2.setString("room_plane_mask_xml", _loc4_);
            }
        }

        private function updatePlaneVisibilities(param1: RoomObjectRoomPlaneVisibilityUpdateMessage, param2: IRoomObjectModelController): void {
            var _loc3_: int = 0;
            if (param1.visible) {
                _loc3_ = 1;
            }
            switch (param1.type) {
                case "RORPVUM_FLOOR_VISIBILITY":
                    param2.setNumber("room_floor_visibility", _loc3_);
                    break;
                case "RORPVUM_WALL_VISIBILITY":
                    param2.setNumber("room_wall_visibility", _loc3_);
                    param2.setNumber("room_landscape_visibility", _loc3_);
            }
        }

        private function updatePlaneProperties(param1: RoomObjectRoomPlanePropertyUpdateMessage, param2: IRoomObjectModelController): void {
            switch (param1.type) {
                case "RORPVUM_FLOOR_THICKNESS":
                    param2.setNumber("room_floor_thickness", param1.value);
                    break;
                case "RORPPUM_WALL_THICKNESS":
                    param2.setNumber("room_wall_thickness", param1.value);
            }
        }

        private function updateFloorHoles(param1: RoomObjectRoomFloorHoleUpdateMessage, param2: IRoomObjectModelController): void {
            switch (param1.type) {
                case "RORPFHUM_ADD":
                    _planeParser.addFloorHole(param1.id, param1.x, param1.y, param1.width, param1.height, param1.invert);
                    var_3220 = true;
                    break;
                case "RORPFHUM_REMOVE":
                    _planeParser.removeFloorHole(param1.id);
                    var_3220 = true;
            }
        }

        private function updateColors(param1: RoomObjectRoomColorUpdateMessage, param2: IRoomObjectModelController): void {
            var _loc3_: * = 0;
            var _loc6_: * = 0;
            var _loc4_: int = int(param1.color);
            var _loc5_: int = int(param1.light);
            param2.setNumber("room_colorize_bg_only", int(param1.bgOnly));
            if (param1.bgOnly) {
                _loc3_ = _loc4_;
                _loc6_ = _loc5_;
            } else {
                _loc3_ = 16777215;
                _loc6_ = 255;
            }
            if (_colorTransitioner) {
                _colorTransitioner.startTransition(_loc3_, _loc6_, getTimer());
            }
        }
    }
}
