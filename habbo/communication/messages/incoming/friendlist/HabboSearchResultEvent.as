package com.sulake.habbo.communication.messages.incoming.friendlist {
    import com.sulake.core.communication.messages.IMessageEvent
    import com.sulake.core.communication.messages.MessageEvent
    import com.sulake.habbo.communication.messages.parser.friendlist.HabboSearchResultMessageParser

    [SecureSWF(rename="true")]
    public class HabboSearchResultEvent extends MessageEvent implements IMessageEvent {

        public function HabboSearchResultEvent(param1: Function) {
            super(param1, HabboSearchResultMessageParser);
        }

        public function getParser(): HabboSearchResultMessageParser {
            return this._parser as HabboSearchResultMessageParser;
        }
    }
}
