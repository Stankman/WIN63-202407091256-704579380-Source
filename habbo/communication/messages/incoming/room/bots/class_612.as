package com.sulake.habbo.communication.messages.incoming.room.bots {
    import com.sulake.core.communication.messages.IMessageEvent
    import com.sulake.core.communication.messages.MessageEvent
    import com.sulake.habbo.communication.messages.parser.room.bots.class_1442

    [SecureSWF(rename="true")]
    public class class_612 extends MessageEvent implements IMessageEvent {

        public function class_612(param1: Function) {
            super(param1, class_1442);
        }

        public function getParser(): class_1442 {
            return _parser as class_1442;
        }
    }
}
