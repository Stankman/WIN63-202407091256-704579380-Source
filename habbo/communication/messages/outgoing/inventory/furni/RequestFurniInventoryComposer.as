package com.sulake.habbo.communication.messages.outgoing.inventory.furni {
   import com.sulake.core.communication.messages.IMessageComposer

   [SecureSWF(rename="true")]
    public class RequestFurniInventoryComposer implements IMessageComposer {

        public function RequestFurniInventoryComposer() {
            super();
        }

        public function dispose(): void {
        }

        public function getMessageArray(): Array {
            return [];
        }
    }
}
