package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents {
    import com.sulake.core.communication.messages.IMessageEvent
    import com.sulake.core.communication.messages.MessageEvent
    import com.sulake.habbo.communication.messages.parser.userdefinedroomevents.class_1597

    [SecureSWF(rename="true")]
    public class class_362 extends MessageEvent implements IMessageEvent {

        public function class_362(param1: Function) {
            super(param1, class_1597);
        }

        public function getParser(): class_1597 {
            return this._parser as class_1597;
        }
    }
}
