package com.sulake.habbo.communication.messages.incoming.marketplace {
    import com.sulake.core.communication.messages.IMessageEvent
    import com.sulake.core.communication.messages.MessageEvent
    import com.sulake.habbo.communication.messages.parser.marketplace.class_1121

    [SecureSWF(rename="true")]
    public class class_431 extends MessageEvent implements IMessageEvent {

        public function class_431(param1: Function) {
            super(param1, class_1121);
        }

        public function getParser(): class_1121 {
            return _parser as class_1121;
        }
    }
}
