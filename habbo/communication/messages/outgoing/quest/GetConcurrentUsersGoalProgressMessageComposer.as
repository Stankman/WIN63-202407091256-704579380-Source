package com.sulake.habbo.communication.messages.outgoing.quest {
   import com.sulake.core.communication.messages.IMessageComposer
   import com.sulake.core.runtime.IDisposable

   [SecureSWF(rename="true")]
    public class GetConcurrentUsersGoalProgressMessageComposer implements IMessageComposer, IDisposable {

        public function GetConcurrentUsersGoalProgressMessageComposer() {
            super();
        }

        public function get disposed(): Boolean {
            return true;
        }

        public function getMessageArray(): Array {
            return [];
        }

        public function dispose(): void {
        }
    }
}
