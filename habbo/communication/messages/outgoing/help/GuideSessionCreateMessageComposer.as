package com.sulake.habbo.communication.messages.outgoing.help {
   import com.sulake.core.communication.messages.IMessageComposer
   import com.sulake.core.runtime.IDisposable

   [SecureSWF(rename="true")]
    public class GuideSessionCreateMessageComposer implements IMessageComposer, IDisposable {

        public function GuideSessionCreateMessageComposer(param1: int, param2: String) {
            var_47 = [];
            super();
            var_47.push(param1);
            var_47.push(param2);
        }
        private var var_47: Array;

        private var _disposed: Boolean = false;

        public function get disposed(): Boolean {
            return _disposed;
        }

        public function getMessageArray(): Array {
            return var_47;
        }

        public function dispose(): void {
            var_47 = null;
            _disposed = true;
        }
    }
}
