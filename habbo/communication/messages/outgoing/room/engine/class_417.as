package com.sulake.habbo.communication.messages.outgoing.room.engine {
   import com.sulake.core.communication.messages.IMessageComposer

   [SecureSWF(rename="true")]
    public class class_417 implements IMessageComposer {

        public function class_417(param1: int) {
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
