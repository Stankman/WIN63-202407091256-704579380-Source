package com.sulake.habbo.communication.messages.incoming.catalog {
    import com.sulake.core.communication.messages.IMessageEvent
    import com.sulake.core.communication.messages.MessageEvent
    import com.sulake.habbo.communication.messages.parser.catalog.class_1307

    [SecureSWF(rename="true")]
    public class class_786 extends MessageEvent implements IMessageEvent {

        public function class_786(param1: Function) {
            super(param1, class_1307);
        }

        public function getParser(): class_1307 {
            return this._parser as class_1307;
        }
    }
}
