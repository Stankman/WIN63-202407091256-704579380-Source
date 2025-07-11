package com.sulake.habbo.room.object {
    import com.sulake.core.utils.Map
    import com.sulake.room.utils.IVector3d
    import com.sulake.room.utils.Vector3d
    import com.sulake.room.utils.class_1781

    import flash.geom.Point

    public class RoomPlaneParser {

        private static const FLOOR_THICKNESS: Number = 0.25;

        private static const WALL_THICKNESS: Number = 0.25;

        private static const MAX_WALL_ADDITIONAL_HEIGHT: Number = 20;

        public static const const_303: int = -110;

        public static const const_272: int = -100;

        private static function getFloorHeight(param1: Array): Number {
            var _loc6_: int = 0;
            var _loc4_: int = 0;
            var _loc5_: int = 0;
            var _loc2_: Array = null;
            var _loc8_: int = int(param1.length);
            var _loc3_: int = 0;
            if (_loc8_ == 0) {
                return 0;
            }
            var _loc7_: Number = 0;
            _loc5_ = 0;
            while (_loc5_ < _loc8_) {
                _loc2_ = param1[_loc5_] as Array;
                _loc4_ = 0;
                while (_loc4_ < _loc2_.length) {
                    if ((_loc6_ = Number(_loc2_[_loc4_])) > _loc7_) {
                        _loc7_ = _loc6_;
                    }
                    _loc4_++;
                }
                _loc5_++;
            }
            return _loc7_;
        }

        private static function findEntranceTile(param1: Array): Point {
            if (param1 == null) {
                return null;
            }
            var _loc3_: int = 0;
            var _loc4_: int = 0;
            var _loc2_: Array = null;
            var _loc6_: int;
            if ((_loc6_ = int(param1.length)) == 0) {
                return null;
            }
            var _loc5_: Array = [];
            _loc4_ = 0;
            while (_loc4_ < _loc6_) {
                _loc2_ = param1[_loc4_] as Array;
                if (_loc2_ == null || _loc2_.length == 0) {
                    return null;
                }
                _loc3_ = 0;
                while (_loc3_ < _loc2_.length) {
                    if (Number(_loc2_[_loc3_]) >= 0) {
                        _loc5_.push(_loc3_);
                        break;
                    }
                    _loc3_++;
                }
                if (_loc5_.length < _loc4_ + 1) {
                    _loc5_.push(_loc2_.length + 1);
                }
                _loc4_++;
            }
            _loc4_ = 1;
            while (_loc4_ < _loc5_.length - 1) {
                if (int(_loc5_[_loc4_]) <= int(_loc5_[_loc4_ - 1]) - 1 && int(_loc5_[_loc4_]) <= int(_loc5_[_loc4_ + 1]) - 1) {
                    return new Point(int(_loc5_[_loc4_]), _loc4_);
                }
                _loc4_++;
            }
            return null;
        }

        private static function expandFloorTiles(param1: Vector.<Vector.<int>>): Vector.<Vector.<int>> {
            var _loc12_: int = 0;
            var _loc13_: int = 0;
            var _loc3_: int = 0;
            var _loc4_: int = 0;
            var _loc6_: int = 0;
            var _loc11_: int = 0;
            var _loc17_: int = 0;
            var _loc14_: int = 0;
            var _loc9_: int = 0;
            var _loc15_: int = 0;
            var _loc10_: int = 0;
            var _loc2_: int = 0;
            var _loc5_: uint = param1.length;
            var _loc16_: uint = param1[0].length;
            var _loc7_: Vector.<Vector.<int>> = new Vector.<Vector.<int>>(_loc5_ * 4);
            _loc13_ = 0;
            while (_loc13_ < _loc5_ * 4) {
                _loc7_[_loc13_] = new Vector.<int>(_loc16_ * 4);
                _loc13_++;
            }
            var _loc8_: int = 0;
            _loc13_ = 0;
            while (_loc13_ < _loc5_) {
                _loc6_ = 0;
                _loc12_ = 0;
                while (_loc12_ < _loc16_) {
                    if ((_loc11_ = param1[_loc13_][_loc12_]) < 0 || _loc11_ <= 255) {
                        _loc4_ = 0;
                        while (_loc4_ < 4) {
                            _loc3_ = 0;
                            while (_loc3_ < 4) {
                                _loc7_[_loc8_ + _loc4_][_loc6_ + _loc3_] = _loc11_ < 0 ? _loc11_ : _loc11_ * 4;
                                _loc3_++;
                            }
                            _loc4_++;
                        }
                    } else {
                        _loc14_ = (_loc17_ = (_loc11_ & 255) * 4) + (_loc11_ >> 11 & 1) * 3;
                        _loc9_ = _loc17_ + (_loc11_ >> 10 & 1) * 3;
                        _loc15_ = _loc17_ + (_loc11_ >> 9 & 1) * 3;
                        _loc10_ = _loc17_ + (_loc11_ >> 8 & 1) * 3;
                        _loc3_ = 0;
                        while (_loc3_ < 3) {
                            _loc2_ = _loc3_ + 1;
                            _loc7_[_loc8_][_loc6_ + _loc3_] = (_loc14_ * (3 - _loc3_) + _loc9_ * _loc3_) / 3;
                            _loc7_[_loc8_ + 3][_loc6_ + _loc2_] = (_loc15_ * (3 - _loc2_) + _loc10_ * _loc2_) / 3;
                            _loc7_[_loc8_ + _loc2_][_loc6_] = (_loc14_ * (3 - _loc2_) + _loc15_ * _loc2_) / 3;
                            _loc7_[_loc8_ + _loc3_][_loc6_ + 3] = (_loc9_ * (3 - _loc3_) + _loc10_ * _loc3_) / 3;
                            _loc3_++;
                        }
                        _loc7_[_loc8_ + 1][_loc6_ + 1] = _loc14_ > _loc17_ ? _loc17_ + 2 : _loc17_ + 1;
                        _loc7_[_loc8_ + 1][_loc6_ + 2] = _loc9_ > _loc17_ ? _loc17_ + 2 : _loc17_ + 1;
                        _loc7_[_loc8_ + 2][_loc6_ + 1] = _loc15_ > _loc17_ ? _loc17_ + 2 : _loc17_ + 1;
                        _loc7_[_loc8_ + 2][_loc6_ + 2] = _loc10_ > _loc17_ ? _loc17_ + 2 : _loc17_ + 1;
                    }
                    _loc6_ += 4;
                    _loc12_++;
                }
                _loc8_ += 4;
                _loc13_++;
            }
            return _loc7_;
        }

        private static function addTileTypes(param1: Vector.<Vector.<int>>): void {
            var _loc14_: int = 0;
            var _loc15_: int = 0;
            var _loc17_: int = 0;
            var _loc4_: * = 0;
            var _loc5_: * = 0;
            var _loc6_: * = 0;
            var _loc7_: * = 0;
            var _loc8_: * = 0;
            var _loc9_: * = 0;
            var _loc11_: * = 0;
            var _loc12_: * = 0;
            var _loc3_: int = 0;
            var _loc2_: int = 0;
            var _loc13_: * = 0;
            var _loc10_: uint = uint(param1.length - 1);
            var _loc16_: uint = uint(param1[0].length - 1);
            _loc15_ = 1;
            while (_loc15_ < _loc10_) {
                _loc14_ = 1;
                while (_loc14_ < _loc16_) {
                    if ((_loc17_ = param1[_loc15_][_loc14_]) >= 0) {
                        _loc4_ = param1[_loc15_ - 1][_loc14_ - 1] & 255;
                        _loc5_ = param1[_loc15_ - 1][_loc14_] & 255;
                        _loc6_ = param1[_loc15_ - 1][_loc14_ + 1] & 255;
                        _loc7_ = param1[_loc15_][_loc14_ - 1] & 255;
                        _loc8_ = param1[_loc15_][_loc14_ + 1] & 255;
                        _loc9_ = param1[_loc15_ + 1][_loc14_ - 1] & 255;
                        _loc11_ = param1[_loc15_ + 1][_loc14_] & 255;
                        _loc12_ = param1[_loc15_ + 1][_loc14_ + 1] & 255;
                        _loc3_ = _loc17_ + 1;
                        _loc2_ = _loc17_ - 1;
                        if ((_loc13_ = (_loc4_ == _loc3_ || _loc5_ == _loc3_ || _loc7_ == _loc3_ ? 8 : 0) | (_loc6_ == _loc3_ || _loc5_ == _loc3_ || _loc8_ == _loc3_ ? 4 : 0) | (_loc9_ == _loc3_ || _loc11_ == _loc3_ || _loc7_ == _loc3_ ? 2 : 0) | (_loc12_ == _loc3_ || _loc11_ == _loc3_ || _loc8_ == _loc3_ ? 1 : 0)) == 15) {
                            _loc13_ = 0;
                        }
                        param1[_loc15_][_loc14_] = _loc17_ | _loc13_ << 8;
                    }
                    _loc14_++;
                }
                _loc15_++;
            }
        }

        private static function unpadHeightMap(param1: Vector.<Vector.<int>>): void {
            param1.shift();
            param1.pop();
            for each(var _loc2_ in param1) {
                _loc2_.shift();
                _loc2_.pop();
            }
        }

        private static function padHeightMap(param1: Vector.<Vector.<int>>): void {
            var _loc2_: Vector.<int> = new Vector.<int>(0);
            var _loc3_: Vector.<int> = new Vector.<int>(0);
            for each(var _loc5_ in param1) {
                _loc5_.push(-110);
                _loc5_.unshift(-110);
            }
            for each(var _loc4_ in param1[0]) {
                _loc2_.push(-110);
                _loc3_.push(-110);
            }
            param1.push(_loc3_);
            param1.unshift(_loc2_);
        }

        public function RoomPlaneParser() {
            var_40 = [];
            var_66 = [];
            var_32 = [];
            var_195 = [];
            var_74 = [];
            super();
            var_279 = 3.6;
            var_336 = 1;
            var_224 = 1;
            var_64 = new Map();
            var_55 = new Map();
        }
        private var var_40: Array;
        private var var_66: Array;
        private var _width: int = 0;
        private var var_46: int = 0;
        private var var_62: int = 0;
        private var var_69: int = 0;
        private var var_61: int = 0;
        private var var_63: int = 0;
        private var var_32: Array;
        private var var_195: Array;
        private var var_279: Number = 0;
        private var var_336: Number = 1;
        private var var_224: Number = 1;
        private var var_146: int = -1;
        private var var_64: Map = null;
        private var var_55: Map = null;
        private var var_74: Array;
        private var var_707: Vector.<Vector.<int>>;

        private var _floorHeight: Number = 0;

        public function get floorHeight(): Number {
            if (var_146 != -1) {
                return var_146;
            }
            return _floorHeight;
        }

        public function get minX(): int {
            return var_62;
        }

        public function get maxX(): int {
            return var_69;
        }

        public function get minY(): int {
            return var_61;
        }

        public function get maxY(): int {
            return var_63;
        }

        public function get tileMapWidth(): int {
            return _width;
        }

        public function get tileMapHeight(): int {
            return var_46;
        }

        public function get planeCount(): int {
            return var_32.length;
        }

        public function get wallHeight(): Number {
            if (var_146 != -1) {
                return var_146 + 3.6;
            }
            return var_279;
        }

        public function set wallHeight(param1: Number): void {
            if (param1 < 0) {
                param1 = 0;
            }
            var_279 = param1;
        }

        public function get wallThicknessMultiplier(): Number {
            return var_336;
        }

        public function set wallThicknessMultiplier(param1: Number): void {
            if (param1 < 0) {
                param1 = 0;
            }
            var_336 = param1;
        }

        public function get floorThicknessMultiplier(): Number {
            return var_224;
        }

        public function set floorThicknessMultiplier(param1: Number): void {
            if (param1 < 0) {
                param1 = 0;
            }
            var_224 = param1;
        }

        public function dispose(): void {
            var_32 = null;
            var_40 = null;
            var_66 = null;
            var_74 = null;
            if (var_64 != null) {
                var_64.dispose();
                var_64 = null;
            }
            if (var_55 != null) {
                var_55.dispose();
                var_55 = null;
            }
        }

        public function reset(): void {
            var_32 = [];
            var_40 = [];
            var_66 = [];
            var_40 = [];
            var_66 = [];
            _width = 0;
            var_46 = 0;
            var_62 = 0;
            var_69 = 0;
            var_61 = 0;
            var_63 = 0;
            _floorHeight = 0;
            var_74 = [];
        }

        public function initializeTileMap(param1: int, param2: int): Boolean {
            var _loc4_: int = 0;
            var _loc7_: Array = null;
            var _loc3_: Array = null;
            var _loc5_: Array = null;
            var _loc6_: int = 0;
            if (param1 < 0) {
                param1 = 0;
            }
            if (param2 < 0) {
                param2 = 0;
            }
            var_40 = [];
            var_66 = [];
            var_74 = [];
            _loc4_ = 0;
            while (_loc4_ < param2) {
                _loc7_ = [];
                _loc3_ = [];
                _loc5_ = [];
                _loc6_ = 0;
                while (_loc6_ < param1) {
                    _loc7_[_loc6_] = -110;
                    _loc3_[_loc6_] = -110;
                    _loc5_[_loc6_] = false;
                    _loc6_++;
                }
                var_40.push(_loc7_);
                var_66.push(_loc3_);
                var_74.push(_loc5_);
                _loc4_++;
            }
            _width = param1;
            var_46 = param2;
            var_62 = _width;
            var_69 = -1;
            var_61 = var_46;
            var_63 = -1;
            return true;
        }

        public function setTileHeight(param1: int, param2: int, param3: Number): Boolean {
            var _loc8_: Array = null;
            var _loc5_: Boolean = false;
            var _loc7_: int = 0;
            var _loc4_: Boolean = false;
            var _loc6_: int = 0;
            if (param1 >= 0 && param1 < _width && param2 >= 0 && param2 < var_46) {
                (_loc8_ = var_40[param2] as Array)[param1] = param3;
                if (param3 >= 0) {
                    if (param1 < var_62) {
                        var_62 = param1;
                    }
                    if (param1 > var_69) {
                        var_69 = param1;
                    }
                    if (param2 < var_61) {
                        var_61 = param2;
                    }
                    if (param2 > var_63) {
                        var_63 = param2;
                    }
                } else {
                    if (param1 == var_62 || param1 == var_69) {
                        _loc5_ = false;
                        _loc7_ = var_61;
                        while (_loc7_ < var_63) {
                            if (getTileHeightInternal(param1, _loc7_) >= 0) {
                                _loc5_ = true;
                                break;
                            }
                            _loc7_++;
                        }
                        if (!_loc5_) {
                            if (param1 == var_62) {
                                var_62++;
                            }
                            if (param1 == var_69) {
                                var_69--;
                            }
                        }
                    }
                    if (param2 == var_61 || param2 == var_63) {
                        _loc4_ = false;
                        _loc6_ = var_62;
                        while (_loc6_ < var_69) {
                            if (getTileHeight(_loc6_, param2) >= 0) {
                                _loc4_ = true;
                                break;
                            }
                            _loc6_++;
                        }
                        if (!_loc4_) {
                            if (param2 == var_61) {
                                var_61++;
                            }
                            if (param2 == var_63) {
                                var_63--;
                            }
                        }
                    }
                }
                return true;
            }
            return false;
        }

        public function getTileHeight(param1: int, param2: int): Number {
            if (param1 < 0 || param1 >= _width || param2 < 0 || param2 >= var_46) {
                return -110;
            }
            var _loc3_: Array = var_40[param2] as Array;
            return Math.abs(_loc3_[param1] as Number);
        }

        public function initializeFromTileData(param1: int = -1): Boolean {
            var _loc2_: int = 0;
            var _loc3_: int = 0;
            var_146 = param1;
            _loc3_ = 0;
            while (_loc3_ < var_46) {
                _loc2_ = 0;
                while (_loc2_ < _width) {
                    var_66[_loc3_][_loc2_] = var_40[_loc3_][_loc2_];
                    _loc2_++;
                }
                _loc3_++;
            }
            var _loc4_: Point = findEntranceTile(var_40);
            _loc3_ = 0;
            while (_loc3_ < var_46) {
                _loc2_ = 0;
                while (_loc2_ < _width) {
                    if (var_74[_loc3_][_loc2_]) {
                        setTileHeight(_loc2_, _loc3_, -100);
                    }
                    _loc2_++;
                }
                _loc3_++;
            }
            return initialize(_loc4_);
        }

        public function initializeHighlightArea(param1: int, param2: int, param3: int, param4: int): void {
            clearHighlightArea();
            extractPlanes(var_707, param1 * 4, param2 * 4, param3 * 4, param4 * 4, true);
        }

        public function clearHighlightArea(): int {
            var _loc1_: int = int(var_195.length);
            var_32 = var_32.slice(0, var_32.length - var_195.length);
            var_195.length = 0;
            return _loc1_;
        }

        public function initializeFromXML(param1: XML): Boolean {
            var _loc4_: int = 0;
            var _loc13_: XML = null;
            var _loc12_: XMLList = null;
            var _loc3_: int = 0;
            var _loc10_: XML = null;
            var _loc16_: Number = NaN;
            var _loc6_: XML = null;
            var _loc8_: XMLList = null;
            var _loc5_: int = 0;
            var _loc7_: XML = null;
            if (param1 == null) {
                return false;
            }
            reset();
            resetFloorHoles();
            if (!class_1781.checkRequiredAttributes(param1.tileMap[0], ["width", "height", "wallHeight"])) {
                return false;
            }
            var _loc9_: int = parseInt(param1.tileMap.@width);
            var _loc15_: int = parseInt(param1.tileMap.@height);
            var _loc14_: Number = parseFloat(param1.tileMap.@wallHeight);
            var _loc2_: int = parseInt(param1.tileMap.@fixedWallsHeight);
            initializeTileMap(_loc9_, _loc15_);
            var _loc11_: XMLList = param1.tileMap.tileRow;
            _loc4_ = 0;
            while (_loc4_ < _loc11_.length()) {
                _loc12_ = (_loc13_ = _loc11_[_loc4_]).tile;
                _loc3_ = 0;
                while (_loc3_ < _loc12_.length()) {
                    _loc10_ = _loc12_[_loc3_];
                    _loc16_ = parseFloat(_loc10_.@height);
                    setTileHeight(_loc3_, _loc4_, _loc16_);
                    _loc3_++;
                }
                _loc4_++;
            }
            if (param1.holeMap.length() > 0) {
                _loc8_ = (_loc6_ = param1.holeMap[0]).hole;
                _loc5_ = 0;
                while (_loc5_ < _loc8_.length()) {
                    _loc7_ = _loc8_[_loc5_];
                    if (class_1781.checkRequiredAttributes(_loc7_, ["id", "x", "y", "width", "height", "invert"])) {
                        addFloorHole(_loc7_.@id, _loc7_.@x, _loc7_.@y, _loc7_.@width, _loc7_.@height, _loc7_.@invert == "true");
                    }
                    _loc5_++;
                }
                initializeHoleMap();
            }
            this.wallHeight = _loc14_;
            initializeFromTileData(_loc2_);
            return true;
        }

        public function isPlaneTemporaryHighlighter(param1: int): Boolean {
            if (param1 < 0 || param1 >= planeCount) {
                return false;
            }
            var _loc2_: RoomPlaneData = var_32[param1] as RoomPlaneData;
            if (_loc2_ == null) {
                return false;
            }
            return var_195.indexOf(_loc2_) != -1;
        }

        public function getXML(): XML {
            var _loc5_: int = 0;
            var _loc1_: XML = null;
            var _loc12_: Array = null;
            var _loc3_: int = 0;
            var _loc14_: Number = NaN;
            var _loc4_: XML = null;
            var _loc8_: RoomFloorHole = null;
            var _loc13_: int = 0;
            var _loc2_: XML = null;
            var _loc7_: int = 0;
            var _loc9_: XML = <tileMap width={_width} height={var_46} wallHeight={var_279} fixedWallsHeight={var_146}/>
            ;
            _loc5_ = 0;
            while (_loc5_ < var_46) {
                _loc1_ = <tileRow/>
                ;
                _loc12_ = var_66[_loc5_];
                _loc3_ = 0;
                while (_loc3_ < _width) {
                    _loc14_ = Number(_loc12_[_loc3_]);
                    _loc4_ = <tile height={_loc14_}/>
                    ;
                    _loc1_.appendChild(_loc4_);
                    _loc3_++;
                }
                _loc9_.appendChild(_loc1_);
                _loc5_++;
            }
            var _loc11_: XML = <holeMap/>
            ;
            _loc7_ = 0;
            while (_loc7_ < var_64.length) {
                if ((_loc8_ = var_64.getWithIndex(_loc7_)) != null) {
                    _loc13_ = var_64.getKey(_loc7_);
                    _loc2_ = <hole id={_loc13_} x={_loc8_.x} y={_loc8_.y} width={_loc8_.width} height={_loc8_.height}
                                   invert={false}/>
                    ;
                    _loc11_.appendChild(_loc2_);
                }
                _loc7_++;
            }
            _loc7_ = 0;
            while (_loc7_ < var_55.length) {
                if ((_loc8_ = var_55.getWithIndex(_loc7_)) != null) {
                    _loc13_ = var_55.getKey(_loc7_);
                    _loc2_ = <hole id={_loc13_} x={_loc8_.x} y={_loc8_.y} width={_loc8_.width} height={_loc8_.height}
                                   invert={true}/>
                    ;
                    _loc11_.appendChild(_loc2_);
                }
                _loc7_++;
            }
            var _loc10_: XML;
            (_loc10_ = <roomData/>
            ).appendChild(_loc9_);
            _loc10_.appendChild(_loc11_);
            var _loc6_: XML = <dimensions minX={minX} maxX={maxX} minY={minY} maxY={maxY}/>
            ;
            _loc10_.appendChild(_loc6_);
            return _loc10_;
        }

        public function getPlaneLocation(param1: int): IVector3d {
            if (param1 < 0 || param1 >= planeCount) {
                return null;
            }
            var _loc2_: RoomPlaneData = var_32[param1] as RoomPlaneData;
            if (_loc2_ != null) {
                return _loc2_.loc;
            }
            return null;
        }

        public function getPlaneNormal(param1: int): IVector3d {
            if (param1 < 0 || param1 >= planeCount) {
                return null;
            }
            var _loc2_: RoomPlaneData = var_32[param1] as RoomPlaneData;
            if (_loc2_ != null) {
                return _loc2_.normal;
            }
            return null;
        }

        public function getPlaneLeftSide(param1: int): IVector3d {
            if (param1 < 0 || param1 >= planeCount) {
                return null;
            }
            var _loc2_: RoomPlaneData = var_32[param1] as RoomPlaneData;
            if (_loc2_ != null) {
                return _loc2_.leftSide;
            }
            return null;
        }

        public function getPlaneRightSide(param1: int): IVector3d {
            if (param1 < 0 || param1 >= planeCount) {
                return null;
            }
            var _loc2_: RoomPlaneData = var_32[param1] as RoomPlaneData;
            if (_loc2_ != null) {
                return _loc2_.rightSide;
            }
            return null;
        }

        public function getPlaneNormalDirection(param1: int): IVector3d {
            if (param1 < 0 || param1 >= planeCount) {
                return null;
            }
            var _loc2_: RoomPlaneData = var_32[param1] as RoomPlaneData;
            if (_loc2_ != null) {
                return _loc2_.normalDirection;
            }
            return null;
        }

        public function getPlaneSecondaryNormals(param1: int): Array {
            var _loc3_: Array = null;
            var _loc4_: int = 0;
            if (param1 < 0 || param1 >= planeCount) {
                return null;
            }
            var _loc2_: RoomPlaneData = var_32[param1] as RoomPlaneData;
            if (_loc2_ != null) {
                _loc3_ = [];
                _loc4_ = 0;
                while (_loc4_ < _loc2_.secondaryNormalCount) {
                    _loc3_.push(_loc2_.getSecondaryNormal(_loc4_));
                    _loc4_++;
                }
                return _loc3_;
            }
            return null;
        }

        public function getPlaneType(param1: int): int {
            if (param1 < 0 || param1 >= planeCount) {
                return 0;
            }
            var _loc2_: RoomPlaneData = var_32[param1] as RoomPlaneData;
            if (_loc2_ != null) {
                return _loc2_.type;
            }
            return 0;
        }

        public function getPlaneMaskCount(param1: int): int {
            if (param1 < 0 || param1 >= planeCount) {
                return 0;
            }
            var _loc2_: RoomPlaneData = var_32[param1] as RoomPlaneData;
            if (_loc2_ != null) {
                return _loc2_.maskCount;
            }
            return 0;
        }

        public function getPlaneMaskLeftSideLoc(param1: int, param2: int): Number {
            if (param1 < 0 || param1 >= planeCount) {
                return -1;
            }
            var _loc3_: RoomPlaneData = var_32[param1] as RoomPlaneData;
            if (_loc3_ != null) {
                return _loc3_.getMaskLeftSideLoc(param2);
            }
            return -1;
        }

        public function getPlaneMaskRightSideLoc(param1: int, param2: int): Number {
            if (param1 < 0 || param1 >= planeCount) {
                return -1;
            }
            var _loc3_: RoomPlaneData = var_32[param1] as RoomPlaneData;
            if (_loc3_ != null) {
                return _loc3_.getMaskRightSideLoc(param2);
            }
            return -1;
        }

        public function getPlaneMaskLeftSideLength(param1: int, param2: int): Number {
            if (param1 < 0 || param1 >= planeCount) {
                return -1;
            }
            var _loc3_: RoomPlaneData = var_32[param1] as RoomPlaneData;
            if (_loc3_ != null) {
                return _loc3_.getMaskLeftSideLength(param2);
            }
            return -1;
        }

        public function getPlaneMaskRightSideLength(param1: int, param2: int): Number {
            if (param1 < 0 || param1 >= planeCount) {
                return -1;
            }
            var _loc3_: RoomPlaneData = var_32[param1] as RoomPlaneData;
            if (_loc3_ != null) {
                return _loc3_.getMaskRightSideLength(param2);
            }
            return -1;
        }

        public function addFloorHole(param1: int, param2: int, param3: int, param4: int, param5: int, param6: Boolean = false): void {
            removeFloorHole(param1);
            var _loc7_: RoomFloorHole = new RoomFloorHole(param2, param3, param4, param5);
            if (param6) {
                var_55.add(param1, _loc7_);
            } else {
                var_64.add(param1, _loc7_);
            }
        }

        public function removeFloorHole(param1: int): void {
            var_64.remove(param1);
            var_55.remove(param1);
        }

        public function resetFloorHoles(): void {
            var_64.reset();
            var_55.reset();
        }

        private function getTileHeightOriginal(param1: int, param2: int): Number {
            if (param1 < 0 || param1 >= _width || param2 < 0 || param2 >= var_46) {
                return -110;
            }
            if (var_74[param2][param1]) {
                return -100;
            }
            var _loc3_: Array = var_66[param2] as Array;
            return _loc3_[param1] as Number;
        }

        private function getTileHeightInternal(param1: int, param2: int): Number {
            if (param1 < 0 || param1 >= _width || param2 < 0 || param2 >= var_46) {
                return -110;
            }
            var _loc3_: Array = var_40[param2] as Array;
            return _loc3_[param1] as Number;
        }

        private function initialize(param1: Point): Boolean {
            var _loc4_: int = 0;
            if (param1 != null) {
                _loc4_ = getTileHeight(param1.x, param1.y);
                setTileHeight(param1.x, param1.y, -110);
            }
            _floorHeight = getFloorHeight(var_40);
            createWallPlanes();
            var _loc2_: Vector.<Vector.<int>> = new Vector.<Vector.<int>>(0);
            for each(var _loc3_ in var_40) {
                _loc2_.push(Vector.<int>(_loc3_));
            }
            padHeightMap(_loc2_);
            addTileTypes(_loc2_);
            unpadHeightMap(_loc2_);
            var_707 = expandFloorTiles(_loc2_);
            extractPlanes(var_707);
            if (param1 != null) {
                setTileHeight(param1.x, param1.y, _loc4_);
                addFloor(new Vector3d(param1.x + 0.5, param1.y + 0.5, _loc4_), new Vector3d(-1, 0, 0), new Vector3d(0, -1, 0), false, false, false, false);
            }
            return true;
        }

        private function generateWallData(param1: Point, param2: Boolean): RoomWallData {
            var _loc3_: Boolean = false;
            var _loc9_: Boolean = false;
            var _loc12_: * = 0;
            var _loc11_: Point = null;
            var _loc8_: int = 0;
            var _loc4_: RoomWallData = new RoomWallData();
            var _loc5_: Array = [extractTopWall, extractRightWall, extractBottomWall, extractLeftWall];
            var _loc6_: int = 0;
            var _loc10_: * = new Point(param1.x, param1.y);
            var _loc7_: int = 0;
            while (_loc7_++ < 1000) {
                _loc3_ = false;
                _loc9_ = false;
                _loc12_ = _loc6_;
                if (_loc10_.x < minX || _loc10_.x > maxX || _loc10_.y < minY || _loc10_.y > maxY) {
                    _loc3_ = true;
                }
                if ((_loc11_ = _loc5_[_loc6_](_loc10_, param2)) == null) {
                    return null;
                }
                _loc8_ = Math.abs(_loc11_.x - _loc10_.x) + Math.abs(_loc11_.y - _loc10_.y);
                if (_loc10_.x == _loc11_.x || _loc10_.y == _loc11_.y) {
                    _loc6_ = (_loc6_ - 1 + _loc5_.length) % _loc5_.length;
                    _loc8_ += 1;
                    _loc9_ = true;
                } else {
                    _loc6_ = (_loc6_ + 1) % _loc5_.length;
                    _loc8_ -= 1;
                }
                _loc4_.addWall(_loc10_, _loc12_, _loc8_, _loc3_, _loc9_);
                if (_loc11_.x == param1.x && _loc11_.y == param1.y && (_loc11_.x != _loc10_.x || _loc11_.y != _loc10_.y)) {
                    break;
                }
                _loc10_ = _loc11_;
            }
            if (_loc4_.count == 0) {
                return null;
            }
            return _loc4_;
        }

        private function hidePeninsulaWallChains(param1: RoomWallData): void {
            var _loc2_: * = 0;
            var _loc3_: * = 0;
            var _loc8_: int = 0;
            var _loc6_: Boolean = false;
            var _loc7_: * = 0;
            var _loc5_: int = 0;
            var _loc4_: int = param1.count;
            while (_loc5_ < _loc4_) {
                _loc2_ = _loc5_;
                _loc3_ = _loc5_;
                _loc8_ = 0;
                _loc6_ = false;
                while (!param1.getBorder(_loc5_) && _loc5_ < _loc4_) {
                    if (param1.getLeftTurn(_loc5_)) {
                        _loc8_++;
                    } else if (_loc8_ > 0) {
                        _loc8_--;
                    }
                    if (_loc8_ > 1) {
                        _loc6_ = true;
                    }
                    _loc3_ = _loc5_;
                    _loc5_++;
                }
                if (_loc6_) {
                    _loc7_ = _loc2_;
                    while (_loc7_ <= _loc3_) {
                        param1.setHideWall(_loc7_, true);
                        _loc7_++;
                    }
                }
                _loc5_++;
            }
        }

        private function updateWallsNextToHoles(param1: RoomWallData): void {
            var _loc8_: int = 0;
            var _loc4_: Point = null;
            var _loc10_: int = 0;
            var _loc7_: int = 0;
            var _loc5_: IVector3d = null;
            var _loc3_: IVector3d = null;
            var _loc2_: int = 0;
            var _loc9_: int = 0;
            var _loc6_: int = param1.count;
            _loc8_ = 0;
            while (_loc8_ < _loc6_) {
                if (!param1.getHideWall(_loc8_)) {
                    _loc4_ = param1.getCorner(_loc8_);
                    _loc10_ = param1.getDirection(_loc8_);
                    _loc7_ = param1.getLength(_loc8_);
                    _loc5_ = RoomWallData.WALL_DIRECTION_VECTORS[_loc10_];
                    _loc3_ = RoomWallData.WALL_NORMAL_VECTORS[_loc10_];
                    _loc2_ = 0;
                    _loc9_ = 0;
                    while (_loc9_ < _loc7_) {
                        if (getTileHeightInternal(_loc4_.x + _loc9_ * _loc5_.x - _loc3_.x, _loc4_.y + _loc9_ * _loc5_.y - _loc3_.y) == -100) {
                            if (_loc9_ > 0 && _loc2_ == 0) {
                                param1.setLength(_loc8_, _loc9_);
                                break;
                            }
                            _loc2_++;
                        } else if (_loc2_ > 0) {
                            param1.moveCorner(_loc8_, _loc2_);
                            break;
                        }
                        _loc9_++;
                    }
                    if (_loc2_ == _loc7_) {
                        param1.setHideWall(_loc8_, true);
                    }
                }
                _loc8_++;
            }
        }

        private function resolveOriginalWallIndex(param1: Point, param2: Point, param3: RoomWallData): int {
            var _loc7_: int = 0;
            var _loc14_: Point = null;
            var _loc10_: Point = null;
            var _loc11_: int = 0;
            var _loc8_: int = 0;
            var _loc15_: int = 0;
            var _loc9_: int = 0;
            var _loc12_: int = Math.min(param1.y, param2.y);
            var _loc4_: int = Math.max(param1.y, param2.y);
            var _loc13_: int = Math.min(param1.x, param2.x);
            var _loc5_: int = Math.max(param1.x, param2.x);
            var _loc6_: int = param3.count;
            _loc7_ = 0;
            while (_loc7_ < _loc6_) {
                _loc14_ = param3.getCorner(_loc7_);
                _loc10_ = param3.getEndPoint(_loc7_);
                if (param1.x == param2.x) {
                    if (_loc14_.x == param1.x && _loc10_.x == param1.x) {
                        _loc11_ = Math.min(_loc14_.y, _loc10_.y);
                        _loc8_ = Math.max(_loc14_.y, _loc10_.y);
                        if (_loc11_ <= _loc12_ && _loc4_ <= _loc8_) {
                            return _loc7_;
                        }
                    }
                } else if (param1.y == param2.y) {
                    if (_loc14_.y == param1.y && _loc10_.y == param1.y) {
                        _loc15_ = Math.min(_loc14_.x, _loc10_.x);
                        _loc9_ = Math.max(_loc14_.x, _loc10_.x);
                        if (_loc15_ <= _loc13_ && _loc5_ <= _loc9_) {
                            return _loc7_;
                        }
                    }
                }
                _loc7_++;
            }
            return -1;
        }

        private function hideOriginallyHiddenWalls(param1: RoomWallData, param2: RoomWallData): void {
            var _loc8_: int = 0;
            var _loc6_: Point = null;
            var _loc3_: Point = null;
            var _loc4_: IVector3d = null;
            var _loc7_: int = 0;
            var _loc9_: int = 0;
            var _loc5_: int = param1.count;
            _loc8_ = 0;
            while (_loc8_ < _loc5_) {
                if (!param1.getHideWall(_loc8_)) {
                    _loc6_ = param1.getCorner(_loc8_);
                    _loc3_ = new Point(_loc6_.x, _loc6_.y);
                    _loc4_ = RoomWallData.WALL_DIRECTION_VECTORS[param1.getDirection(_loc8_)];
                    _loc7_ = param1.getLength(_loc8_);
                    _loc3_.x += _loc4_.x * _loc7_;
                    _loc3_.y += _loc4_.y * _loc7_;
                    if ((_loc9_ = resolveOriginalWallIndex(_loc6_, _loc3_, param2)) >= 0) {
                        if (param2.getHideWall(_loc9_)) {
                            param1.setHideWall(_loc8_, true);
                        }
                    } else {
                        param1.setHideWall(_loc8_, true);
                    }
                }
                _loc8_++;
            }
        }

        private function checkWallHiding(param1: RoomWallData, param2: RoomWallData): void {
            hidePeninsulaWallChains(param2);
            updateWallsNextToHoles(param1);
            hideOriginallyHiddenWalls(param1, param2);
        }

        private function addWalls(param1: RoomWallData, param2: RoomWallData): void {
            var _loc25_: int = 0;
            var _loc14_: int = 0;
            var _loc17_: int = 0;
            var _loc10_: Point = null;
            var _loc13_: int = 0;
            var _loc16_: int = 0;
            var _loc11_: IVector3d = null;
            var _loc6_: IVector3d = null;
            var _loc20_: * = NaN;
            var _loc18_: int = 0;
            var _loc27_: Number = NaN;
            var _loc24_: * = NaN;
            var _loc3_: Vector3d = null;
            var _loc4_: Number = NaN;
            var _loc9_: Vector3d = null;
            var _loc19_: Vector3d = null;
            var _loc12_: int = 0;
            var _loc8_: Vector3d = null;
            var _loc21_: Boolean = false;
            var _loc7_: Boolean = false;
            var _loc26_: Boolean = false;
            var _loc5_: Boolean = false;
            var _loc22_: Boolean = false;
            var _loc15_: int = param1.count;
            var _loc23_: int = param2.count;
            _loc17_ = 0;
            while (_loc17_ < _loc15_) {
                if (!param1.getHideWall(_loc17_)) {
                    _loc10_ = param1.getCorner(_loc17_);
                    _loc13_ = param1.getDirection(_loc17_);
                    _loc16_ = param1.getLength(_loc17_);
                    _loc11_ = RoomWallData.WALL_DIRECTION_VECTORS[_loc13_];
                    _loc6_ = RoomWallData.WALL_NORMAL_VECTORS[_loc13_];
                    _loc20_ = -1;
                    _loc18_ = 0;
                    while (_loc18_ < _loc16_) {
                        if ((_loc27_ = getTileHeightInternal(_loc10_.x + _loc18_ * _loc11_.x + _loc6_.x, _loc10_.y + _loc18_ * _loc11_.y + _loc6_.y)) >= 0 && (_loc27_ < _loc20_ || _loc20_ < 0)) {
                            _loc20_ = _loc27_;
                        }
                        _loc18_++;
                    }
                    _loc24_ = _loc20_;
                    _loc3_ = new Vector3d(_loc10_.x, _loc10_.y, _loc24_);
                    _loc3_ = Vector3d.sum(_loc3_, Vector3d.product(_loc6_, 0.5));
                    _loc3_ = Vector3d.sum(_loc3_, Vector3d.product(_loc11_, -0.5));
                    _loc4_ = wallHeight + Math.min(20, floorHeight) - _loc20_;
                    _loc9_ = Vector3d.product(_loc11_, -_loc16_);
                    _loc19_ = new Vector3d(0, 0, _loc4_);
                    _loc3_ = Vector3d.dif(_loc3_, _loc9_);
                    if ((_loc12_ = resolveOriginalWallIndex(_loc10_, param1.getEndPoint(_loc17_), param2)) >= 0) {
                        _loc25_ = param2.getDirection((_loc12_ + 1) % _loc23_);
                        _loc14_ = param2.getDirection((_loc12_ - 1 + _loc23_) % _loc23_);
                    } else {
                        _loc25_ = param1.getDirection((_loc17_ + 1) % _loc15_);
                        _loc14_ = param1.getDirection((_loc17_ - 1 + _loc15_) % _loc15_);
                    }
                    _loc8_ = null;
                    if ((_loc25_ - _loc13_ + 4) % 4 == 3) {
                        _loc8_ = RoomWallData.WALL_NORMAL_VECTORS[_loc25_];
                    } else if ((_loc13_ - _loc14_ + 4) % 4 == 3) {
                        _loc8_ = RoomWallData.WALL_NORMAL_VECTORS[_loc14_];
                    }
                    _loc21_ = param1.getLeftTurn(_loc17_);
                    _loc7_ = param1.getLeftTurn((_loc17_ - 1 + _loc15_) % _loc15_);
                    _loc26_ = param1.getHideWall((_loc17_ + 1) % _loc15_);
                    _loc5_ = param1.getManuallyLeftCut(_loc17_);
                    _loc22_ = param1.getManuallyRightCut(_loc17_);
                    addWall(_loc3_, _loc9_, _loc19_, _loc8_, !_loc7_ || _loc5_, !_loc21_ || _loc22_, !_loc26_);
                }
                _loc17_++;
            }
        }

        private function createWallPlanes(): Boolean {
            var _loc3_: int = 0;
            var _loc11_: int = 0;
            var _loc6_: Array;
            if ((_loc6_ = var_40) == null) {
                return false;
            }
            var _loc4_: int = 0;
            var _loc5_: int = 0;
            var _loc1_: Array = null;
            var _loc14_: int = int(_loc6_.length);
            var _loc8_: int = 0;
            if (_loc14_ == 0) {
                return false;
            }
            _loc4_ = 0;
            while (_loc4_ < _loc14_) {
                _loc1_ = _loc6_[_loc4_] as Array;
                if (_loc1_ == null || _loc1_.length == 0) {
                    return false;
                }
                if (_loc8_ > 0) {
                    _loc8_ = Math.min(_loc8_, _loc1_.length);
                } else {
                    _loc8_ = int(_loc1_.length);
                }
                _loc4_++;
            }
            var _loc13_: Number = Math.min(20, var_146 != -1 ? var_146 : getFloorHeight(_loc6_));
            var _loc9_: int = minX;
            var _loc10_: int = minY;
            _loc10_ = minY;
            while (_loc10_ <= maxY) {
                if (getTileHeightInternal(_loc9_, _loc10_) > -100) {
                    _loc10_--;
                    break;
                }
                _loc10_++;
            }
            if (_loc10_ > maxY) {
                return false;
            }
            var _loc2_: Point = new Point(_loc9_, _loc10_);
            var _loc7_: RoomWallData = generateWallData(_loc2_, true);
            var _loc12_: RoomWallData = generateWallData(_loc2_, false);
            if (_loc7_ != null) {
                _loc3_ = _loc7_.count;
                _loc11_ = _loc12_.count;
                checkWallHiding(_loc7_, _loc12_);
                addWalls(_loc7_, _loc12_);
            }
            _loc5_ = 0;
            while (_loc5_ < tileMapHeight) {
                _loc4_ = 0;
                while (_loc4_ < tileMapWidth) {
                    if (getTileHeightInternal(_loc4_, _loc5_) < 0) {
                        setTileHeight(_loc4_, _loc5_, -(_loc13_ + wallHeight));
                    }
                    _loc4_++;
                }
                _loc5_++;
            }
            return true;
        }

        private function extractTopWall(param1: Point, param2: Boolean): Point {
            if (param1 == null) {
                return null;
            }
            var _loc3_: int = 1;
            var _loc4_: int = -100;
            if (!param2) {
                _loc4_ = -110;
            }
            while (_loc3_ < 1000) {
                if (getTileHeightInternal(param1.x + _loc3_, param1.y) > _loc4_) {
                    return new Point(param1.x + _loc3_ - 1, param1.y);
                }
                if (getTileHeightInternal(param1.x + _loc3_, param1.y + 1) <= _loc4_) {
                    return new Point(param1.x + _loc3_, param1.y + 1);
                }
                _loc3_++;
            }
            return null;
        }

        private function extractRightWall(param1: Point, param2: Boolean): Point {
            if (param1 == null) {
                return null;
            }
            var _loc3_: int = 1;
            var _loc4_: int = -100;
            if (!param2) {
                _loc4_ = -110;
            }
            while (_loc3_ < 1000) {
                if (getTileHeightInternal(param1.x, param1.y + _loc3_) > _loc4_) {
                    return new Point(param1.x, param1.y + (_loc3_ - 1));
                }
                if (getTileHeightInternal(param1.x - 1, param1.y + _loc3_) <= _loc4_) {
                    return new Point(param1.x - 1, param1.y + _loc3_);
                }
                _loc3_++;
            }
            return null;
        }

        private function extractBottomWall(param1: Point, param2: Boolean): Point {
            if (param1 == null) {
                return null;
            }
            var _loc3_: int = 1;
            var _loc4_: int = -100;
            if (!param2) {
                _loc4_ = -110;
            }
            while (_loc3_ < 1000) {
                if (getTileHeightInternal(param1.x - _loc3_, param1.y) > _loc4_) {
                    return new Point(param1.x - (_loc3_ - 1), param1.y);
                }
                if (getTileHeightInternal(param1.x - _loc3_, param1.y - 1) <= _loc4_) {
                    return new Point(param1.x - _loc3_, param1.y - 1);
                }
                _loc3_++;
            }
            return null;
        }

        private function extractLeftWall(param1: Point, param2: Boolean): Point {
            if (param1 == null) {
                return null;
            }
            var _loc3_: int = 1;
            var _loc4_: int = -100;
            if (!param2) {
                _loc4_ = -110;
            }
            while (_loc3_ < 1000) {
                if (getTileHeightInternal(param1.x, param1.y - _loc3_) > _loc4_) {
                    return new Point(param1.x, param1.y - (_loc3_ - 1));
                }
                if (getTileHeightInternal(param1.x + 1, param1.y - _loc3_) <= _loc4_) {
                    return new Point(param1.x + 1, param1.y - _loc3_);
                }
                _loc3_++;
            }
            return null;
        }

        private function addWall(param1: IVector3d, param2: IVector3d, param3: IVector3d, param4: IVector3d, param5: Boolean, param6: Boolean, param7: Boolean): void {
            var _loc12_: Vector3d = null;
            addPlane(2, param1, param2, param3, [param4]);
            addPlane(3, param1, param2, param3, [param4]);
            var _loc10_: Number = 0.25 * var_336;
            var _loc8_: Number = 0.25 * var_224;
            var _loc11_: Vector3d = Vector3d.crossProduct(param2, param3);
            var _loc9_: Vector3d = Vector3d.product(_loc11_, 1 / _loc11_.length * -_loc10_);
            addPlane(2, Vector3d.sum(param1, param3), param2, _loc9_, [_loc11_, param4]);
            if (param5) {
                addPlane(2, Vector3d.sum(Vector3d.sum(param1, param2), param3), Vector3d.product(param3, -(param3.length + _loc8_) / param3.length), _loc9_, [_loc11_, param4]);
            }
            if (param6) {
                addPlane(2, Vector3d.sum(param1, Vector3d.product(param3, -_loc8_ / param3.length)), Vector3d.product(param3, (param3.length + _loc8_) / param3.length), _loc9_, [_loc11_, param4]);
                if (param7) {
                    _loc12_ = Vector3d.product(param2, _loc10_ / param2.length);
                    addPlane(2, Vector3d.sum(Vector3d.sum(param1, param3), Vector3d.product(_loc12_, -1)), _loc12_, _loc9_, [_loc11_, param2, param4]);
                }
            }
        }

        private function addFloor(param1: IVector3d, param2: IVector3d, param3: IVector3d, param4: Boolean, param5: Boolean, param6: Boolean, param7: Boolean, param8: Boolean = false): void {
            var _loc11_: Number = NaN;
            var _loc10_: Vector3d = null;
            var _loc9_: Vector3d = null;
            var _loc12_: RoomPlaneData;
            if ((_loc12_ = addPlane(1, param1, param2, param3, null, param8)) != null) {
                _loc11_ = 0.25 * var_224;
                _loc10_ = new Vector3d(0, 0, _loc11_);
                _loc9_ = Vector3d.dif(param1, _loc10_);
                if (param6) {
                    addPlane(1, _loc9_, param2, _loc10_, null, param8);
                }
                if (param7) {
                    addPlane(1, Vector3d.sum(_loc9_, Vector3d.sum(param2, param3)), Vector3d.product(param2, -1), _loc10_, null, param8);
                }
                if (param4) {
                    addPlane(1, Vector3d.sum(_loc9_, param3), Vector3d.product(param3, -1), _loc10_, null, param8);
                }
                if (param5) {
                    addPlane(1, Vector3d.sum(_loc9_, param2), param3, _loc10_, null, param8);
                }
            }
        }

        private function addPlane(param1: int, param2: IVector3d, param3: IVector3d, param4: IVector3d, param5: Array = null, param6: Boolean = false): RoomPlaneData {
            if (param3.length == 0 || param4.length == 0) {
                return null;
            }
            var _loc7_: RoomPlaneData = new RoomPlaneData(param1, param2, param3, param4, param5);
            var_32.push(_loc7_);
            if (param6) {
                var_195.push(_loc7_);
            }
            return _loc7_;
        }

        private function initializeHoleMap(): void {
            var _loc3_: int = 0;
            var _loc4_: int = 0;
            var _loc6_: Array = null;
            var _loc1_: RoomFloorHole = null;
            var _loc5_: int = 0;
            var _loc2_: * = var_55.length > 0;
            _loc4_ = 0;
            while (_loc4_ < var_46) {
                _loc6_ = var_74[_loc4_];
                _loc3_ = 0;
                while (_loc3_ < _width) {
                    _loc6_[_loc3_] = _loc2_;
                    _loc3_++;
                }
                _loc4_++;
            }
            _loc5_ = 0;
            while (_loc5_ < var_55.length) {
                _loc1_ = var_55.getWithIndex(_loc5_);
                initializeHole(_loc1_, true);
                _loc5_++;
            }
            _loc5_ = 0;
            while (_loc5_ < var_64.length) {
                _loc1_ = var_64.getWithIndex(_loc5_);
                initializeHole(_loc1_);
                _loc5_++;
            }
        }

        private function initializeHole(param1: RoomFloorHole, param2: Boolean = false): void {
            var _loc4_: int = 0;
            var _loc8_: int = 0;
            var _loc3_: int = 0;
            var _loc5_: int = 0;
            var _loc7_: * = 0;
            var _loc9_: Array = null;
            var _loc6_: * = 0;
            if (param1 != null) {
                _loc4_ = param1.x;
                _loc8_ = param1.x + param1.width - 1;
                _loc3_ = param1.y;
                _loc5_ = param1.y + param1.height - 1;
                _loc4_ = int(_loc4_ < 0 ? 0 : _loc4_);
                _loc8_ = int(_loc8_ >= _width ? _width - 1 : _loc8_);
                _loc3_ = int(_loc3_ < 0 ? 0 : _loc3_);
                _loc5_ = int(_loc5_ >= var_46 ? var_46 - 1 : _loc5_);
                _loc7_ = _loc3_;
                while (_loc7_ <= _loc5_) {
                    _loc9_ = var_74[_loc7_];
                    _loc6_ = _loc4_;
                    while (_loc6_ <= _loc8_) {
                        _loc9_[_loc6_] = !param2;
                        _loc6_++;
                    }
                    _loc7_++;
                }
            }
        }

        private function extractPlanes(param1: Vector.<Vector.<int>>, param2: int = 0, param3: int = 0, param4: int = -1, param5: int = -1, param6: Boolean = false): void {
            var _loc13_: int = 0;
            var _loc24_: * = 0;
            var _loc25_: * = 0;
            var _loc9_: int = 0;
            var _loc19_: * = 0;
            var _loc16_: int = 0;
            var _loc10_: Boolean = false;
            var _loc8_: Boolean = false;
            var _loc20_: Boolean = false;
            var _loc12_: * = false;
            var _loc21_: * = 0;
            var _loc23_: * = 0;
            var _loc11_: Boolean = false;
            var _loc15_: Number = NaN;
            var _loc17_: Number = NaN;
            var _loc18_: Number = NaN;
            var _loc28_: Number = NaN;
            var _loc14_: uint = param1.length;
            var _loc26_: uint = param1[0].length;
            var _loc27_: uint = uint(param5 == -1 ? _loc14_ : Math.min(_loc14_, param3 + param5));
            var _loc22_: uint = uint(param4 == -1 ? _loc26_ : Math.min(_loc26_, param2 + param4));
            var _loc7_: Vector.<Vector.<Boolean>> = new Vector.<Vector.<Boolean>>(_loc27_);
            _loc13_ = 0;
            while (_loc13_ < _loc27_) {
                _loc7_[_loc13_] = new Vector.<Boolean>(_loc22_);
                _loc13_++;
            }
            _loc24_ = param3;
            while (_loc24_ < _loc27_) {
                _loc25_ = param2;
                while (_loc25_ < _loc22_) {
                    if (!((_loc9_ = param1[_loc24_][_loc25_]) < 0 || _loc7_[_loc24_][_loc25_])) {
                        _loc10_ = _loc25_ == 0 || param1[_loc24_][_loc25_ - 1] != _loc9_;
                        _loc8_ = _loc24_ == 0 || param1[_loc24_ - 1][_loc25_] != _loc9_;
                        _loc19_ = _loc25_ + 1;
                        while (_loc19_ < _loc22_) {
                            if (param1[_loc24_][_loc19_] != _loc9_ || _loc7_[_loc24_][_loc19_] || _loc24_ > 0 && param1[_loc24_ - 1][_loc19_] == _loc9_ == _loc8_) {
                                break;
                            }
                            _loc19_++;
                        }
                        _loc20_ = _loc19_ == _loc26_ || param1[_loc24_][_loc19_] != _loc9_;
                        _loc11_ = false;
                        _loc16_ = _loc24_ + 1;
                        while (_loc16_ <= _loc27_ && !_loc11_) {
                            _loc12_ = _loc16_ == _loc14_ || param1[_loc16_][_loc25_] != _loc9_;
                            _loc11_ = _loc16_ == _loc27_ || _loc12_ || _loc25_ > 0 && param1[_loc16_][_loc25_ - 1] == _loc9_ == _loc10_ || _loc19_ < _loc26_ && param1[_loc16_][_loc19_] == _loc9_ == _loc20_;
                            if (_loc16_ == _loc14_) {
                                break;
                            }
                            _loc21_ = _loc25_;
                            while (_loc21_ < _loc19_) {
                                if (param1[_loc16_][_loc21_] == _loc9_ == _loc12_) {
                                    _loc11_ = true;
                                    _loc19_ = _loc21_;
                                    break;
                                }
                                _loc21_++;
                            }
                            if (_loc11_) {
                                break;
                            }
                            _loc16_++;
                        }
                        if (!_loc12_) {
                            _loc12_ = _loc16_ == _loc14_;
                        }
                        _loc20_ = _loc19_ == _loc26_ || param1[_loc24_][_loc19_] != _loc9_;
                        _loc23_ = _loc24_;
                        while (_loc23_ < _loc16_) {
                            _loc21_ = _loc25_;
                            while (_loc21_ < _loc19_) {
                                _loc7_[_loc23_][_loc21_] = true;
                                _loc21_++;
                            }
                            _loc23_++;
                        }
                        _loc15_ = _loc25_ / 4 - 0.5;
                        _loc17_ = _loc24_ / 4 - 0.5;
                        _loc18_ = (_loc19_ - _loc25_) / 4;
                        _loc28_ = (_loc16_ - _loc24_) / 4;
                        addFloor(new Vector3d(_loc15_ + _loc18_, _loc17_ + _loc28_, _loc9_ / 4), new Vector3d(-_loc18_, 0, 0), new Vector3d(0, -_loc28_, 0), _loc20_, _loc10_, _loc12_, _loc8_, param6);
                    }
                    _loc25_++;
                }
                _loc24_++;
            }
        }
    }
}
