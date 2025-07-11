package com.sulake.habbo.communication.messages.incoming.game.score {
    import com.sulake.core.communication.messages.MessageEvent
    import com.sulake.habbo.communication.messages.parser.game.score.Game2LeaderboardParser

    public class Game2TotalLeaderboardEvent extends MessageEvent {

        public function Game2TotalLeaderboardEvent(param1: Function) {
            super(param1, Game2LeaderboardParser);
        }

        public function getParser(): Game2LeaderboardParser {
            return this._parser as Game2LeaderboardParser;
        }
    }
}
