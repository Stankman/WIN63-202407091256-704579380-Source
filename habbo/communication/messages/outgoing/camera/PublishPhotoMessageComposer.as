package com.sulake.habbo.communication.messages.outgoing.camera {
    import com.sulake.core.communication.messages.IMessageComposer

    [SecureSWF(rename="true")]
    public class PublishPhotoMessageComposer implements IMessageComposer {

        public function PublishPhotoMessageComposer() {
            var_47 = [];
            super();
        }
        private var var_47: Array;

        public function getMessageArray(): Array {
            return var_47;
        }

        public function dispose(): void {
            var_47 = [];
        }
    }
}
