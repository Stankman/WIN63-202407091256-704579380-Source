package com.sulake.habbo.communication.messages.parser.handshake {
    import com.sulake.core.communication.messages.IMessageDataWrapper
    import com.sulake.core.communication.messages.IMessageParser

    [SecureSWF(rename="true")]
    public class class_1142 implements IMessageParser {

        public function class_1142() {
            super();
        }
        private var var_1560: Boolean;

        public function get isFirstLoginOfDay(): Boolean {
            return var_1560;
        }

        public function flush(): Boolean {
            return false;
        }

        public function parse(param1: IMessageDataWrapper): Boolean {
            this.var_1560 = param1.readBoolean();
            return true;
        }
    }
}
