package com.sulake.habbo.communication.messages.incoming.inventory.furni {
    import com.sulake.core.communication.messages.IMessageEvent
    import com.sulake.core.communication.messages.MessageEvent
    import com.sulake.habbo.communication.messages.parser.inventory.furni.class_1576

    [SecureSWF(rename="true")]
    public class class_340 extends MessageEvent implements IMessageEvent {

        public function class_340(param1: Function) {
            super(param1, class_1576);
        }

        public function getParser(): class_1576 {
            return this._parser as class_1576;
        }
    }
}
