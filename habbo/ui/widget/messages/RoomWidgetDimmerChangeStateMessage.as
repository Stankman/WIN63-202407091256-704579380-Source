package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetDimmerChangeStateMessage extends RoomWidgetMessage
   {
      
      public static const CHANGE_STATE:String = "RWCDSM_CHANGE_STATE";
       
      
      private var var_455:int;
      
      public function RoomWidgetDimmerChangeStateMessage(param1:int)
      {
         super("RWCDSM_CHANGE_STATE");
         var_455 = param1;
      }
      
      public function get objectId() : int
      {
         return var_455;
      }
   }
}
