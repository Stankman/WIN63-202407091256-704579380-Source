package com.sulake.habbo.communication.messages.outgoing.handshake {
   import com.sulake.core.communication.messages.IMessageComposer

   [SecureSWF(rename="true")]
    public class DisconnectMessageComposer implements IMessageComposer {

        public function DisconnectMessageComposer() {
            super();
        }

        public function dispose(): void {
        }

        public function getMessageArray(): Array {
            return [];
        }
    }
}
