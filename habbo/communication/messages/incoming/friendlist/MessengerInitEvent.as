package com.sulake.habbo.communication.messages.incoming.friendlist {
    import com.sulake.core.communication.messages.IMessageEvent
    import com.sulake.core.communication.messages.MessageEvent
    import com.sulake.habbo.communication.messages.parser.friendlist.MessengerInitParser

    [SecureSWF(rename="true")]
    public class MessengerInitEvent extends MessageEvent implements IMessageEvent {

        public function MessengerInitEvent(param1: Function) {
            super(param1, MessengerInitParser);
        }

        public function getParser(): MessengerInitParser {
            return this._parser as MessengerInitParser;
        }
    }
}
