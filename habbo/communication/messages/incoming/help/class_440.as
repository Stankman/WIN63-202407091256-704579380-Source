package com.sulake.habbo.communication.messages.incoming.help {
    import com.sulake.core.communication.messages.IMessageEvent
    import com.sulake.core.communication.messages.MessageEvent
    import com.sulake.habbo.communication.messages.parser.help.class_1302

    [SecureSWF(rename="true")]
    public class class_440 extends MessageEvent implements IMessageEvent {

        public function class_440(param1: Function) {
            super(param1, class_1302);
        }

        public function getParser(): class_1302 {
            return _parser as class_1302;
        }
    }
}
