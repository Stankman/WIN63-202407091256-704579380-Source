package com.sulake.habbo.communication.messages.incoming.roomsettings {
    import com.sulake.core.communication.messages.IMessageEvent
    import com.sulake.core.communication.messages.MessageEvent
    import com.sulake.habbo.communication.messages.parser.roomsettings.class_1591

    [SecureSWF(rename="true")]
    public class class_1082 extends MessageEvent implements IMessageEvent {

        public function class_1082(param1: Function) {
            super(param1, class_1591);
        }

        public function getParser(): class_1591 {
            return this._parser as class_1591;
        }
    }
}
