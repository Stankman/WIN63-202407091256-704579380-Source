package com.sulake.habbo.communication.messages.outgoing.groupforums {
   import com.sulake.core.communication.messages.IMessageComposer
   import com.sulake.core.runtime.IDisposable

   [SecureSWF(rename="true")]
    public class class_539 implements IMessageComposer, IDisposable {

        public function class_539(param1: int, param2: int, param3: int) {
            var_20 = [];
            super();
            this.var_20 = [param1, param2, param3];
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
