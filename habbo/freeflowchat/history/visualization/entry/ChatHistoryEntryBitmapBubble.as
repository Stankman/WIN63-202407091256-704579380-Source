package com.sulake.habbo.freeflowchat.history.visualization.entry
{
   import com.sulake.habbo.freeflowchat.HabboFreeFlowChat;
   import com.sulake.habbo.freeflowchat.data.ChatItem;
   import com.sulake.habbo.freeflowchat.history.visualization.enum.class_3598;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   
   public class ChatHistoryEntryBitmapBubble implements class_3535
   {
       
      
      private var _bitmap:BitmapData;
      
      private var _overlap:Rectangle;
      
      private var var_418:int;
      
      private var var_369:int;
      
      private var var_4742:Boolean;
      
      private var _userName:String;
      
      public function ChatHistoryEntryBitmapBubble(param1:ChatItem, param2:Boolean, param3:String, param4:BitmapData, param5:Rectangle = null)
      {
         super();
         _overlap = param5;
         var_418 = param1.userId;
         var_369 = param1.roomId;
         var _loc6_:TextField;
         (_loc6_ = new TextField()).defaultTextFormat = class_3598.TEXT_FORMAT_TIMESTAMP;
         _loc6_.text = HabboFreeFlowChat.getTimeStampNow();
         _loc6_.thickness = -15;
         _loc6_.sharpness = 80;
         _loc6_.antiAliasType = "advanced";
         _loc6_.embedFonts = true;
         _loc6_.gridFitType = "pixel";
         var _loc8_:int = param4.height;
         var _loc7_:int = 62;
         var _loc9_:int = Math.max(3,3 + param5.top);
         _bitmap = new BitmapData(_loc7_ + param4.width,_loc8_,true,0);
         _bitmap.draw(_loc6_,new Matrix(1,0,0,1,0,_loc9_));
         _bitmap.copyPixels(param4,param4.rect,new Point(_loc7_,0));
         var_4742 = param2;
         _userName = param3;
      }
      
      public function get bitmap() : BitmapData
      {
         return _bitmap;
      }
      
      public function get overlap() : Rectangle
      {
         return _overlap;
      }
      
      public function get userId() : int
      {
         return var_418;
      }
      
      public function get roomId() : int
      {
         return var_369;
      }
      
      public function get canIgnore() : Boolean
      {
         return var_4742;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}
