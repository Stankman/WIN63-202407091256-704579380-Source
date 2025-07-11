package com.sulake.habbo.ui.widget.avatarinfo
{
   public class UserNameView extends AvatarContextInfoView
   {
      
      public static const DEFAULT_BG_COLOR:uint = 4288528218;
      
      public static const DEFAULT_FADE_DELAY_MS:int = 8000;
       
      
      private var var_455:int;
      
      private var var_4036:Boolean;
      
      public function UserNameView(param1:AvatarInfoWidget, param2:Boolean = false)
      {
         super(param1);
         var_4036 = param2;
      }
      
      public static function setup(param1:UserNameView, param2:int, param3:String, param4:int, param5:int, param6:int, param7:uint = 4288528218, param8:int = 8000) : void
      {
         param1.var_455 = param6;
         param1.var_4076 = param8;
         AvatarContextInfoView.setup(param1,param2,param3,param4,param5,false);
         param1._window.color = param7;
      }
      
      public function get objectId() : int
      {
         return var_455;
      }
      
      public function get isGameRoomMode() : Boolean
      {
         return var_4036;
      }
      
      override public function get maximumBlend() : Number
      {
         if(var_4036)
         {
            return 0.75;
         }
         return super.maximumBlend;
      }
   }
}
