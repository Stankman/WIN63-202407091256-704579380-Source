package com.sulake.habbo.communication.messages.outgoing.friendlist {
   import com.sulake.core.communication.messages.IMessageComposer

   [SecureSWF(rename="true")]
    public class MessengerInitMessageComposer implements IMessageComposer {

        public function MessengerInitMessageComposer() {
            super();
        }

        public function dispose(): void {
        }

        public function getMessageArray(): Array {
            return [];
        }
    }
}
