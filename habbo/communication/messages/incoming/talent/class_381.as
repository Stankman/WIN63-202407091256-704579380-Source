package com.sulake.habbo.communication.messages.incoming.talent {
    import com.sulake.core.communication.messages.IMessageEvent
    import com.sulake.core.communication.messages.MessageEvent
    import com.sulake.habbo.communication.messages.parser.talent.class_1158

    [SecureSWF(rename="true")]
    public class class_381 extends MessageEvent implements IMessageEvent {

        public function class_381(param1: Function) {
            super(param1, class_1158);
        }

        public function getParser(): class_1158 {
            return _parser as class_1158;
        }
    }
}
