package com.sulake.habbo.communication.messages.incoming.competition {
    import com.sulake.core.communication.messages.IMessageEvent
    import com.sulake.core.communication.messages.MessageEvent
    import com.sulake.habbo.communication.messages.parser.competition.class_1124

    [SecureSWF(rename="true")]
    public class class_692 extends MessageEvent implements IMessageEvent {

        public function class_692(param1: Function) {
            super(param1, class_1124);
        }

        public function getParser(): class_1124 {
            return _parser as class_1124;
        }
    }
}
