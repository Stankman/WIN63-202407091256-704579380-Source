package com.sulake.habbo.communication.messages.outgoing.navigator {
   import com.sulake.core.communication.messages.IMessageComposer

   [SecureSWF(rename="true")]
    public class class_937 implements IMessageComposer {

        public function class_937(param1: int) {
            var_20 = [];
            super();
            var_20.push(param1);
        }
        private var var_20: Array;

        public function dispose(): void {
        }

        public function getMessageArray(): Array {
            return var_20;
        }
    }
}
