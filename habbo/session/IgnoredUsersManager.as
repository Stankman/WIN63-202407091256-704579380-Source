package com.sulake.habbo.session
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.habbo.communication.messages.incoming.users.class_543;
   import com.sulake.habbo.communication.messages.incoming.users.class_670;
   import com.sulake.habbo.communication.messages.outgoing.users.class_342;
   import com.sulake.habbo.communication.messages.outgoing.users.class_352;
   import com.sulake.habbo.communication.messages.outgoing.users.class_715;
   
   public class IgnoredUsersManager implements IDisposable
   {
       
      
      private var _sessionDataManager:SessionDataManager;
      
      private var var_3677:IMessageEvent;
      
      private var var_3771:IMessageEvent;
      
      private var var_2476:Array;
      
      public function IgnoredUsersManager(param1:SessionDataManager)
      {
         var_2476 = [];
         super();
         _sessionDataManager = param1;
         if(_sessionDataManager.communication)
         {
            var_3677 = _sessionDataManager.communication.addHabboConnectionMessageEvent(new class_543(onIgnoreResult));
            var_3771 = _sessionDataManager.communication.addHabboConnectionMessageEvent(new class_670(onIgnoreList));
         }
      }
      
      public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         if(_sessionDataManager.communication)
         {
            _sessionDataManager.communication.removeHabboConnectionMessageEvent(var_3677);
            _sessionDataManager.communication.removeHabboConnectionMessageEvent(var_3771);
         }
         var_3677 = null;
         var_3771 = null;
         _sessionDataManager = null;
      }
      
      public function initIgnoreList() : void
      {
         _sessionDataManager.send(new class_715());
      }
      
      private function onIgnoreList(param1:class_670) : void
      {
         var_2476 = param1.ignoredUserIds;
      }
      
      private function onIgnoreResult(param1:class_543) : void
      {
         var _loc2_:int = param1.userId;
         switch(param1.result)
         {
            case 0:
               break;
            case 1:
               addUserToIgnoreList(_loc2_);
               break;
            case 2:
               addUserToIgnoreList(_loc2_);
               var_2476.shift();
               break;
            case 3:
               removeUserFromIgnoreList(_loc2_);
         }
      }
      
      private function addUserToIgnoreList(param1:int) : void
      {
         if(var_2476.indexOf(param1) < 0)
         {
            var_2476.push(param1);
         }
      }
      
      private function removeUserFromIgnoreList(param1:int) : void
      {
         var _loc2_:int = var_2476.indexOf(param1);
         if(_loc2_ >= 0)
         {
            var_2476.splice(_loc2_,1);
         }
      }
      
      public function ignoreUser(param1:int) : void
      {
         _sessionDataManager.send(new class_352(param1));
      }
      
      public function unignoreUser(param1:int) : void
      {
         _sessionDataManager.send(new class_342(param1));
      }
      
      public function isIgnored(param1:int) : Boolean
      {
         return var_2476.indexOf(param1) >= 0;
      }
      
      public function get disposed() : Boolean
      {
         return _sessionDataManager == null;
      }
   }
}
