package com.sulake.habbo.communication.messages.incoming.notifications {
    import com.sulake.core.communication.messages.IMessageEvent
    import com.sulake.core.communication.messages.MessageEvent
    import com.sulake.habbo.communication.messages.parser.notifications.class_1271

    [SecureSWF(rename="true")]
    public class class_205 extends MessageEvent implements IMessageEvent {

        public function class_205(param1: Function) {
            super(param1, class_1271);
        }

        public function getParser(): class_1271 {
            return _parser as class_1271;
        }
    }
}
