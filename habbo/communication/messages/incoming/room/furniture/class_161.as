package com.sulake.habbo.communication.messages.incoming.room.furniture {
    import com.sulake.core.communication.messages.IMessageEvent
    import com.sulake.core.communication.messages.MessageEvent
    import com.sulake.habbo.communication.messages.parser.room.furniture.class_1360

    [SecureSWF(rename="true")]
    public class class_161 extends MessageEvent implements IMessageEvent {

        public function class_161(param1: Function) {
            super(param1, class_1360);
        }

        public function getParser(): class_1360 {
            return _parser as class_1360;
        }
    }
}
