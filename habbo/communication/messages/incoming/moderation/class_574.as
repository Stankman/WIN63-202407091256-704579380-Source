package com.sulake.habbo.communication.messages.incoming.moderation {
    import com.sulake.core.communication.messages.IMessageEvent
    import com.sulake.core.communication.messages.MessageEvent
    import com.sulake.habbo.communication.messages.parser.moderation.class_1343

    [SecureSWF(rename="true")]
    public class class_574 extends MessageEvent implements IMessageEvent {

        public function class_574(param1: Function) {
            super(param1, class_1343);
        }

        public function getParser(): class_1343 {
            return _parser as class_1343;
        }
    }
}
