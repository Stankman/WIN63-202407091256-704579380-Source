package com.sulake.habbo.communication.messages.parser.roomsettings {
    import com.sulake.core.communication.messages.IMessageDataWrapper
    import com.sulake.core.communication.messages.IMessageParser

    [SecureSWF(rename="true")]
    public class class_1587 implements IMessageParser {

        public function class_1587() {
            super();
        }
        private var var_1019: int;

        public function get selectionType(): int {
            return var_1019;
        }

        public function flush(): Boolean {
            return true;
        }

        public function parse(param1: IMessageDataWrapper): Boolean {
            var_1019 = param1.readInteger();
            return true;
        }
    }
}
