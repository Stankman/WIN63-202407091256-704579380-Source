package com.sulake.habbo.communication.messages.incoming.room.pets {
    import com.sulake.core.communication.messages.IMessageEvent
    import com.sulake.core.communication.messages.MessageEvent
    import com.sulake.habbo.communication.messages.parser.room.pets.class_1496

    [SecureSWF(rename="true")]
    public class class_189 extends MessageEvent implements IMessageEvent {

        public function class_189(param1: Function) {
            super(param1, class_1496);
        }

        public function getParser(): class_1496 {
            return _parser as class_1496;
        }
    }
}
