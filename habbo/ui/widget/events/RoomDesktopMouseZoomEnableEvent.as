package com.sulake.habbo.ui.widget.events
{
   import flash.events.Event;
   
   public class RoomDesktopMouseZoomEnableEvent extends Event
   {
      
      public static const const_494:String = "RDMZEE_ENABLED";
       
      
      private var var_593:Boolean;
      
      public function RoomDesktopMouseZoomEnableEvent(param1:Boolean)
      {
         super("RDMZEE_ENABLED");
         var_593 = param1;
      }
   }
}
