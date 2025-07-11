package com.sulake.habbo.room.object.visualization.room {
    import com.sulake.habbo.room.object.visualization.furniture.AnimatedFurnitureVisualization

    public class TileCursorVisualization extends AnimatedFurnitureVisualization {

        public function TileCursorVisualization() {
            super();
        }
        private var var_4771: Number = 0;

        public function get tileHeight(): Number {
            return var_4771;
        }

        public function set tileHeight(param1: Number): void {
            var_4771 = param1;
        }

        override protected function getSpriteYOffset(param1: int, param2: int, param3: int): int {
            if (param3 == 1) {
                tileHeight = object.getModel().getNumber("tile_cursor_height");
                return -tileHeight * (param1 / 2);
            }
            return super.getSpriteYOffset(param1, param2, param3);
        }
    }
}
