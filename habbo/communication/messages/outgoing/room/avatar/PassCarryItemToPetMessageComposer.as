package com.sulake.habbo.communication.messages.outgoing.room.avatar {
   import com.sulake.core.communication.messages.IMessageComposer

   [SecureSWF(rename="true")]
    public class PassCarryItemToPetMessageComposer implements IMessageComposer {

        public function PassCarryItemToPetMessageComposer(param1: int) {
            super();
            var_393 = param1;
        }
        private var var_393: int;

        public function dispose(): void {
        }

        public function getMessageArray(): Array {
            return [var_393];
        }
    }
}
