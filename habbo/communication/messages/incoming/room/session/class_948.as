package com.sulake.habbo.communication.messages.incoming.room.session {
    import com.sulake.core.communication.messages.MessageEvent
    import com.sulake.habbo.communication.messages.parser.room.session.class_1619

    [SecureSWF(rename="true")]
    public class class_948 extends MessageEvent {

        public function class_948(param1: Function) {
            super(param1, class_1619);
        }

        public function getParser(): class_1619 {
            return _parser as class_1619;
        }
    }
}
