package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetRoomTagSearchMessage extends RoomWidgetMessage
   {
      
      public static const ROOM_TAG_SEARCH:String = "RWRTSM_ROOM_TAG_SEARCH";
       
      
      private var var_881:String = "";
      
      public function RoomWidgetRoomTagSearchMessage(param1:String)
      {
         super("RWRTSM_ROOM_TAG_SEARCH");
         var_881 = param1;
      }
      
      public function get tag() : String
      {
         return var_881;
      }
   }
}
