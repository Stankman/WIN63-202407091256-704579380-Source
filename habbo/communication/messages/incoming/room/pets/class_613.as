package com.sulake.habbo.communication.messages.incoming.room.pets {
    import com.sulake.core.communication.messages.IMessageEvent
    import com.sulake.core.communication.messages.MessageEvent
    import com.sulake.habbo.communication.messages.parser.room.pets.class_1225

    [SecureSWF(rename="true")]
    public class class_613 extends MessageEvent implements IMessageEvent {

        public function class_613(param1: Function) {
            super(param1, class_1225);
        }

        public function getParser(): class_1225 {
            return _parser as class_1225;
        }
    }
}
