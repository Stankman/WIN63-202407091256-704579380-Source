package com.sulake.habbo.communication.messages.outgoing.friendfurni {
   import com.sulake.core.communication.messages.IMessageComposer
   import com.sulake.core.runtime.IDisposable

   [SecureSWF(rename="true")]
    public class class_395 implements IMessageComposer, IDisposable {

        public function class_395(param1: int, param2: Boolean) {
            var_20 = [];
            super();
            var_20.push(param1);
            var_20.push(param2);
        }
        private var var_20: Array;

        public function get disposed(): Boolean {
            return false;
        }

        public function getMessageArray(): Array {
            return this.var_20;
        }

        public function dispose(): void {
            this.var_20 = null;
        }
    }
}
