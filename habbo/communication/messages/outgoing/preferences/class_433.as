package com.sulake.habbo.communication.messages.outgoing.preferences {
   import com.sulake.core.communication.messages.IMessageComposer
   import com.sulake.core.runtime.IDisposable

   [SecureSWF(rename="true")]
    public class class_433 implements IMessageComposer, IDisposable {

        public function class_433(param1: int) {
            var_20 = [];
            super();
            var_20.push(param1);
        }
        private var var_20: Array;

        public function get disposed(): Boolean {
            return var_20 == null;
        }

        public function getMessageArray(): Array {
            return var_20;
        }

        public function dispose(): void {
            var_20 = null;
        }
    }
}
