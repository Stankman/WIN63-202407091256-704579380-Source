package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetSongUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const SONG_PLAYING_CHANGED:String = "RWSUE_PLAYING_CHANGED";
      
      public static const SONG_DATA_RECEIVED:String = "RWSUE_DATA_RECEIVED";
       
      
      private var var_606:int;
      
      private var _songName:String;
      
      private var var_4358:String;
      
      public function RoomWidgetSongUpdateEvent(param1:String, param2:int, param3:String, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(param1,param5,param6);
         var_606 = param2;
         _songName = param3;
         var_4358 = param4;
      }
      
      public function get songId() : int
      {
         return var_606;
      }
      
      public function get songName() : String
      {
         return _songName;
      }
      
      public function get songAuthor() : String
      {
         return var_4358;
      }
   }
}
