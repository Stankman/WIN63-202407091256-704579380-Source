package com.sulake.habbo.communication.messages.parser.groupforums {
    import com.sulake.core.communication.messages.IMessageDataWrapper
    import com.sulake.core.communication.messages.IMessageParser

    [SecureSWF(rename="true")]
    public class class_1237 implements IMessageParser {

        public function class_1237() {
            super();
        }
        private var var_1200: int;

        public function get unreadForumsCount(): int {
            return var_1200;
        }

        public function flush(): Boolean {
            return true;
        }

        public function parse(param1: IMessageDataWrapper): Boolean {
            var_1200 = param1.readInteger();
            return true;
        }
    }
}
