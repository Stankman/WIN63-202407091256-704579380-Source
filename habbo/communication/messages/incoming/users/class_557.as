package com.sulake.habbo.communication.messages.incoming.users {
    import com.sulake.core.communication.messages.IMessageEvent
    import com.sulake.core.communication.messages.MessageEvent
    import com.sulake.habbo.communication.messages.parser.users.class_1328

    [SecureSWF(rename="true")]
    public class class_557 extends MessageEvent implements IMessageEvent {

        public function class_557(param1: Function) {
            super(param1, class_1328);
        }

        public function getParser(): class_1328 {
            return _parser as class_1328;
        }
    }
}
