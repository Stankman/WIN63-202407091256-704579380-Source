package com.sulake.habbo.communication.messages.incoming.friendlist {
    import com.sulake.core.communication.messages.IMessageEvent
    import com.sulake.core.communication.messages.MessageEvent
    import com.sulake.habbo.communication.messages.parser.friendlist.class_1419

    [SecureSWF(rename="true")]
    public class class_1020 extends MessageEvent implements IMessageEvent {

        public function class_1020(param1: Function) {
            super(param1, class_1419);
        }

        public function getParser(): class_1419 {
            return _parser as class_1419;
        }
    }
}
