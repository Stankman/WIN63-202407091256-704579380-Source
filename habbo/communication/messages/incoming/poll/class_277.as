package com.sulake.habbo.communication.messages.incoming.poll {
    import com.sulake.core.communication.messages.IMessageEvent
    import com.sulake.core.communication.messages.MessageEvent
    import com.sulake.habbo.communication.messages.parser.poll.class_1534

    [SecureSWF(rename="true")]
    public class class_277 extends MessageEvent implements IMessageEvent {

        public function class_277(param1: Function) {
            super(param1, class_1534);
        }

        public function getParser(): class_1534 {
            return _parser as class_1534;
        }
    }
}
