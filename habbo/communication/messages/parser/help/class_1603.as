package com.sulake.habbo.communication.messages.parser.help {
    import com.sulake.core.communication.messages.IMessageDataWrapper
    import com.sulake.core.communication.messages.IMessageParser

    [SecureSWF(rename="true")]
    public class class_1603 implements IMessageParser {

        public function class_1603() {
            super();
        }
        private var var_764: int;

        public function flush(): Boolean {
            return true;
        }

        public function parse(param1: IMessageDataWrapper): Boolean {
            var_764 = param1.readInteger();
            return true;
        }

        public function getRequesterRoomId(): int {
            return var_764;
        }
    }
}
