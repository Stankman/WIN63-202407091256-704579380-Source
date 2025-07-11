package com.sulake.habbo.communication.messages.outgoing.inventory.badges {
   import com.sulake.core.communication.messages.IMessageComposer

   [SecureSWF(rename="true")]
    public class SetActivatedBadgesComposer implements IMessageComposer {

        private const const_375: int = 5;

        public function SetActivatedBadgesComposer() {
            super();
            var_358 = [];
        }
        private var var_358: Array;

        public function addActivatedBadge(param1: String): void {
            if (var_358.length >= 5) {
                return;
            }
            var_358.push(param1);
        }

        public function dispose(): void {
        }

        public function getMessageArray(): Array {
            var _loc2_: int = 0;
            var _loc1_: Array = [];
            _loc2_ = 1;
            while (_loc2_ <= 5) {
                if (_loc2_ <= var_358.length) {
                    _loc1_.push(_loc2_);
                    _loc1_.push(var_358[_loc2_ - 1]);
                } else {
                    _loc1_.push(_loc2_);
                    _loc1_.push("");
                }
                _loc2_++;
            }
            return _loc1_;
        }
    }
}
