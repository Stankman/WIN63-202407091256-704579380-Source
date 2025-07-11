package com.sulake.habbo.room.object.visualization.furniture {
    import com.sulake.habbo.room.object.visualization.data.AnimationFrame
    import com.sulake.habbo.room.object.visualization.data.AnimationSizeData
    import com.sulake.habbo.room.object.visualization.data.SizeData

    public class AnimatedFurnitureVisualizationData extends FurnitureVisualizationData {

        public function AnimatedFurnitureVisualizationData() {
            super();
        }

        override protected function createSizeData(param1: int, param2: int, param3: int): SizeData {
            var _loc4_: SizeData = null;
            return new AnimationSizeData(param2, param3);
        }

        override protected function processVisualizationElement(param1: SizeData, param2: XML): Boolean {
            var _loc3_: AnimationSizeData = null;
            if (param1 == null || param2 == null) {
                return false;
            }
            var _loc4_: String = String(param2.name());
            if ("animations" !== _loc4_) {
                if (!super.processVisualizationElement(param1, param2)) {
                    return false;
                }
            } else {
                _loc3_ = param1 as AnimationSizeData;
                if (_loc3_ != null) {
                    if (!_loc3_.defineAnimations(param2)) {
                        return false;
                    }
                }
            }
            return true;
        }

        public function hasAnimation(param1: int, param2: int): Boolean {
            var _loc3_: AnimationSizeData = getSizeData(param1) as AnimationSizeData;
            if (_loc3_ != null) {
                return _loc3_.hasAnimation(param2);
            }
            return false;
        }

        public function getAnimationCount(param1: int): int {
            var _loc2_: AnimationSizeData = getSizeData(param1) as AnimationSizeData;
            if (_loc2_ != null) {
                return _loc2_.getAnimationCount();
            }
            return 0;
        }

        public function getAnimationId(param1: int, param2: int): int {
            var _loc3_: AnimationSizeData = getSizeData(param1) as AnimationSizeData;
            if (_loc3_ != null) {
                return _loc3_.getAnimationId(param2);
            }
            return 0;
        }

        public function isImmediateChange(param1: int, param2: int, param3: int): Boolean {
            var _loc4_: AnimationSizeData;
            if ((_loc4_ = getSizeData(param1) as AnimationSizeData) != null) {
                return _loc4_.isImmediateChange(param2, param3);
            }
            return false;
        }

        public function getStartFrame(param1: int, param2: int, param3: int): int {
            var _loc4_: AnimationSizeData;
            if ((_loc4_ = getSizeData(param1) as AnimationSizeData) != null) {
                return _loc4_.getStartFrame(param2, param3);
            }
            return 0;
        }

        public function getFrame(param1: int, param2: int, param3: int, param4: int, param5: int): AnimationFrame {
            var _loc6_: AnimationSizeData;
            if ((_loc6_ = getSizeData(param1) as AnimationSizeData) != null) {
                return _loc6_.getFrame(param2, param3, param4, param5);
            }
            return null;
        }

        public function getFrameFromSequence(param1: int, param2: int, param3: int, param4: int, param5: int, param6: int, param7: int): AnimationFrame {
            var _loc8_: AnimationSizeData;
            if ((_loc8_ = getSizeData(param1) as AnimationSizeData) != null) {
                return _loc8_.getFrameFromSequence(param2, param3, param4, param5, param6, param7);
            }
            return null;
        }
    }
}
