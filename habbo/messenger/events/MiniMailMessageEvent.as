package com.sulake.habbo.messenger.events
{
   import flash.events.Event;
   
   public class MiniMailMessageEvent extends Event
   {
      
      public static const const_455:String = "MMME_new";
      
      public static const const_1125:String = "MMME_unread";
       
      
      private var var_4314:int;
      
      public function MiniMailMessageEvent(param1:String, param2:int = -1)
      {
         super(param1);
         var_4314 = param2;
      }
      
      public function get unreadCount() : int
      {
         return var_4314;
      }
   }
}
