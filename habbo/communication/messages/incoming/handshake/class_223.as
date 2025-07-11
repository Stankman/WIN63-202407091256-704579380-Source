package com.sulake.habbo.communication.messages.incoming.handshake {
    import com.sulake.core.communication.messages.IMessageEvent
    import com.sulake.core.communication.messages.MessageEvent
    import com.sulake.habbo.communication.messages.parser.handshake.class_1568

    [SecureSWF(rename="true")]
    public class class_223 extends MessageEvent implements IMessageEvent {

        public function class_223(param1: Function) {
            super(param1, class_1568);
        }

        public function get machineID(): String {
            return getParser().machineID;
        }

        private function getParser(): class_1568 {
            return this._parser as class_1568;
        }
    }
}
