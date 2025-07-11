package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetRoomObjectMessage extends RoomWidgetMessage
   {
      
      public static const GET_OBJECT_INFO:String = "RWROM_GET_OBJECT_INFO";
      
      public static const GET_OBJECT_NAME:String = "RWROM_GET_OBJECT_NAME";
      
      public static const const_753:String = "RWROM_SELECT_OBJECT";
      
      public static const GET_OWN_CHARACTER_INFO:String = "RWROM_GET_OWN_CHARACTER_INFO";
      
      public static const GET_AVATAR_LIST:String = "RWROM_GET_AVATAR_LIST";
       
      
      private var var_280:int = 0;
      
      private var var_638:int = 0;
      
      public function RoomWidgetRoomObjectMessage(param1:String, param2:int, param3:int)
      {
         super(param1);
         var_280 = param2;
         var_638 = param3;
      }
      
      public function get id() : int
      {
         return var_280;
      }
      
      public function get category() : int
      {
         return var_638;
      }
   }
}
