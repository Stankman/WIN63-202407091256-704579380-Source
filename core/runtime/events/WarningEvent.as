package com.sulake.core.runtime.events
{
   import flash.events.Event;
   
   public class WarningEvent extends Event
   {
       
      
      protected var var_368:String;
      
      public function WarningEvent(param1:String, param2:String)
      {
         var_368 = param2 == null ? "undefined" : param2;
         super(param1);
      }
      
      public function get message() : String
      {
         return var_368;
      }
   }
}
