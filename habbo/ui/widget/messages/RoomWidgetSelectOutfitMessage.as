package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetSelectOutfitMessage extends RoomWidgetMessage
   {
      
      public static const SELECT_OUTFIT:String = "select_outfit";
       
      
      private var var_4589:int;
      
      public function RoomWidgetSelectOutfitMessage(param1:int)
      {
         super("select_outfit");
         var_4589 = param1;
      }
      
      public function get outfitId() : int
      {
         return var_4589;
      }
   }
}
