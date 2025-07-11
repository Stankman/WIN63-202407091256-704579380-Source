package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetStickieDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const UPDATE_STICKIE_DATA:String = "RWSDUE_STICKIE_DATA";
       
      
      private var var_455:int = -1;
      
      private var var_3402:String;
      
      private var _text:String;
      
      private var var_821:String;
      
      private var var_319:Boolean;
      
      public function RoomWidgetStickieDataUpdateEvent(param1:String, param2:int, param3:String, param4:String, param5:String, param6:Boolean, param7:Boolean = false, param8:Boolean = false)
      {
         super(param1,param7,param8);
         var_455 = param2;
         var_3402 = param3;
         _text = param4;
         var_821 = param5;
         var_319 = param6;
      }
      
      public function get objectId() : int
      {
         return var_455;
      }
      
      public function get objectType() : String
      {
         return var_3402;
      }
      
      public function get text() : String
      {
         return _text;
      }
      
      public function get colorHex() : String
      {
         return var_821;
      }
      
      public function get controller() : Boolean
      {
         return var_319;
      }
   }
}
