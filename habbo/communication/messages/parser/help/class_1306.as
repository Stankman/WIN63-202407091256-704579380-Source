package com.sulake.habbo.communication.messages.parser.help {
    import com.sulake.core.communication.messages.IMessageDataWrapper
    import com.sulake.core.communication.messages.IMessageParser

    [SecureSWF(rename="true")]
    public class class_1306 implements IMessageParser {

        public function class_1306() {
            super();
        }
        private var var_1295: int = 0;

        public function get endReason(): int {
            return var_1295;
        }

        public function flush(): Boolean {
            return true;
        }

        public function parse(param1: IMessageDataWrapper): Boolean {
            var_1295 = param1.readInteger();
            return true;
        }
    }
}
