package com.sulake.habbo.communication.messages.incoming.quest {
    import com.sulake.core.communication.messages.IMessageEvent
    import com.sulake.core.communication.messages.MessageEvent
    import com.sulake.habbo.communication.messages.parser.quest.class_1593

    [SecureSWF(rename="true")]
    public class class_345 extends MessageEvent implements IMessageEvent {

        public function class_345(param1: Function) {
            super(param1, class_1593);
        }

        public function getParser(): class_1593 {
            return _parser as class_1593;
        }
    }
}
