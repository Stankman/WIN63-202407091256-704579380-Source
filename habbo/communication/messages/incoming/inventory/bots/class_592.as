package com.sulake.habbo.communication.messages.incoming.inventory.bots {
    import com.sulake.core.communication.messages.IMessageEvent
    import com.sulake.core.communication.messages.MessageEvent
    import com.sulake.habbo.communication.messages.parser.inventory.bots.class_1447

    [SecureSWF(rename="true")]
    public class class_592 extends MessageEvent implements IMessageEvent {

        public function class_592(param1: Function) {
            super(param1, class_1447);
        }

        public function getParser(): class_1447 {
            return _parser as class_1447;
        }
    }
}
