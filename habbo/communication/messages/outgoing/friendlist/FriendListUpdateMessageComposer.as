package com.sulake.habbo.communication.messages.outgoing.friendlist {
   import com.sulake.core.communication.messages.IMessageComposer

   [SecureSWF(rename="true")]
    public class FriendListUpdateMessageComposer implements IMessageComposer {

        public function FriendListUpdateMessageComposer() {
            super();
        }

        public function dispose(): void {
        }

        public function getMessageArray(): Array {
            return [];
        }
    }
}
