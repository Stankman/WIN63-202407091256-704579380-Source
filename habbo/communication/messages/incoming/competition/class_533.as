package com.sulake.habbo.communication.messages.incoming.competition {
    import com.sulake.core.communication.messages.IMessageEvent
    import com.sulake.core.communication.messages.MessageEvent
    import com.sulake.habbo.communication.messages.parser.competition.class_1390

    [SecureSWF(rename="true")]
    public class class_533 extends MessageEvent implements IMessageEvent {

        public function class_533(param1: Function) {
            super(param1, class_1390);
        }

        public function getParser(): class_1390 {
            return _parser as class_1390;
        }
    }
}
