package com.sulake.habbo.communication.messages.outgoing.handshake {
   import com.sulake.core.communication.messages.IMessageComposer

   import flash.utils.getTimer

   [SecureSWF(rename="true")]
    public class class_941 implements IMessageComposer {

        public function class_941(param1: String) {
            super();
            var_368 = [];
            var_368.push(param1);
            var_368.push(getTimer());
        }
        private var var_368: Array;

        public function dispose(): void {
        }

        public function getMessageArray(): Array {
            return var_368;
        }
    }
}
