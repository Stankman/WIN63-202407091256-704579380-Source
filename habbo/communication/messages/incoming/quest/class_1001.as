package com.sulake.habbo.communication.messages.incoming.quest {
    import com.sulake.core.communication.messages.IMessageEvent
    import com.sulake.core.communication.messages.MessageEvent
    import com.sulake.habbo.communication.messages.parser.quest.class_1536

    [SecureSWF(rename="true")]
    public class class_1001 extends MessageEvent implements IMessageEvent {

        public function class_1001(param1: Function) {
            super(param1, class_1536);
        }

        public function getParser(): class_1536 {
            return _parser as class_1536;
        }
    }
}
