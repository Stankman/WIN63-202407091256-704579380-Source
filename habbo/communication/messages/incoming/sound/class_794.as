package com.sulake.habbo.communication.messages.incoming.sound {
    import com.sulake.core.communication.messages.IMessageEvent
    import com.sulake.core.communication.messages.MessageEvent
    import com.sulake.habbo.communication.messages.parser.sound.class_1492

    [SecureSWF(rename="true")]
    public class class_794 extends MessageEvent implements IMessageEvent {

        public function class_794(param1: Function) {
            super(param1, class_1492);
        }

        public function getParser(): class_1492 {
            return this._parser as class_1492;
        }
    }
}
