package com.sulake.habbo.communication.messages.outgoing.gifts {
   import com.sulake.core.communication.messages.IMessageComposer
   import com.sulake.core.runtime.IDisposable

   [SecureSWF(rename="true")]
    public class class_859 implements IMessageComposer, IDisposable {

        public static const const_5: int = -1;

        public function class_859(param1: String, param2: String) {
            var_20 = [];
            super();
            this.var_20.push(param1);
            this.var_20.push(param2);
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
