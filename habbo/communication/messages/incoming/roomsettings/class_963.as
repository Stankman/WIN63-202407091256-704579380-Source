package com.sulake.habbo.communication.messages.incoming.roomsettings {
    import com.sulake.core.communication.messages.IMessageEvent
    import com.sulake.core.communication.messages.MessageEvent
    import com.sulake.habbo.communication.messages.parser.roomsettings.class_1374

    [SecureSWF(rename="true")]
    public class class_963 extends MessageEvent implements IMessageEvent {

        public function class_963(param1: Function) {
            super(param1, class_1374);
        }

        public function getParser(): class_1374 {
            return this._parser as class_1374;
        }
    }
}
