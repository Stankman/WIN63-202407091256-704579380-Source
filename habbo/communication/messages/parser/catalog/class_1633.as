package com.sulake.habbo.communication.messages.parser.catalog {
    import com.sulake.core.communication.messages.IMessageDataWrapper
    import com.sulake.core.communication.messages.IMessageParser

    [SecureSWF(rename="true")]
    public class class_1633 implements IMessageParser {

        public function class_1633() {
            super();
        }
        private var var_562: int;

        private var var_1270: int;

        private var var_859: String;

        private var _pageName: String;

        public function get pageName(): String {
            return _pageName;
        }

        public function get pageId(): int {
            return var_562;
        }

        public function get secondsToExpiry(): int {
            return var_1270;
        }

        public function get image(): String {
            return var_859;
        }

        public function flush(): Boolean {
            return true;
        }

        public function parse(param1: IMessageDataWrapper): Boolean {
            var_562 = param1.readInteger();
            _pageName = param1.readString();
            var_1270 = param1.readInteger();
            var_859 = param1.readString();
            return true;
        }
    }
}
