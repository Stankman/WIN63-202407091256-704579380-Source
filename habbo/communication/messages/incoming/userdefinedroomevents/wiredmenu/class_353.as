package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.wiredmenu {
    import com.sulake.core.communication.messages.IMessageEvent
    import com.sulake.core.communication.messages.MessageEvent
    import com.sulake.habbo.communication.messages.parser.userdefinedroomevents.wiredmenu.class_1541

    [SecureSWF(rename="true")]
    public class class_353 extends MessageEvent implements IMessageEvent {

        public function class_353(param1: Function) {
            super(param1, class_1541);
        }

        public function getParser(): class_1541 {
            return this._parser as class_1541;
        }
    }
}
