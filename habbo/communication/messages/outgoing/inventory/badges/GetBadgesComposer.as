package com.sulake.habbo.communication.messages.outgoing.inventory.badges {
   import com.sulake.core.communication.messages.IMessageComposer

   [SecureSWF(rename="true")]
    public class GetBadgesComposer implements IMessageComposer {

        public function GetBadgesComposer() {
            super();
        }

        public function dispose(): void {
        }

        public function getMessageArray(): Array {
            return [];
        }
    }
}
