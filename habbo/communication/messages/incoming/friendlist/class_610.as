package com.sulake.habbo.communication.messages.incoming.friendlist {
    import com.sulake.core.communication.messages.IMessageEvent
    import com.sulake.core.communication.messages.MessageEvent
    import com.sulake.habbo.communication.messages.parser.friendlist.class_1512

    [SecureSWF(rename="true")]
    public class class_610 extends MessageEvent implements IMessageEvent {

        public function class_610(param1: Function) {
            super(param1, class_1512);
        }

        public function get success(): Boolean {
            return class_1512(_parser).success;
        }
    }
}
