package com.sulake.habbo.communication.messages.incoming.competition {
    import com.sulake.core.communication.messages.IMessageEvent
    import com.sulake.core.communication.messages.MessageEvent
    import com.sulake.habbo.communication.messages.parser.competition.class_1551

    [SecureSWF(rename="true")]
    public class class_394 extends MessageEvent implements IMessageEvent {

        public function class_394(param1: Function) {
            super(param1, class_1551);
        }

        public function getParser(): class_1551 {
            return _parser as class_1551;
        }
    }
}
