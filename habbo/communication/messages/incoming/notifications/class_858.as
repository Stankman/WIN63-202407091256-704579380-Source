package com.sulake.habbo.communication.messages.incoming.notifications {
    import com.sulake.core.communication.messages.IMessageEvent
    import com.sulake.core.communication.messages.MessageEvent
    import com.sulake.habbo.communication.messages.parser.notifications.class_1422

    [SecureSWF(rename="true")]
    public class class_858 extends MessageEvent implements IMessageEvent {

        public function class_858(param1: Function) {
            super(param1, class_1422);
        }

        public function getParser(): class_1422 {
            return _parser as class_1422;
        }
    }
}
