package com.sulake.habbo.friendbar.view.utils
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import flash.events.TimerEvent;
   
   public class MessengerIcon extends Icon
   {
      
      private static const NOTIFY_DELAY:int = 500;
       
      
      private var _assets:IAssetLibrary;
      
      public function MessengerIcon(param1:IAssetLibrary, param2:IBitmapWrapperWindow)
      {
         super();
         _assets = param1;
         alignment = 1 | 8;
         image = param1.getAssetByName("icon_messenger_png") as BitmapDataAsset;
         canvas = param2;
      }
      
      override public function notify(param1:Boolean) : void
      {
         super.notify(param1);
         image = _assets.getAssetByName(param1 ? "icon_messenger_notify_1_png" : "icon_messenger_png") as BitmapDataAsset;
         toggleTimer(param1,500);
      }
      
      override public function hover(param1:Boolean) : void
      {
         super.hover(param1);
      }
      
      override public function enable(param1:Boolean) : void
      {
         super.enable(param1);
         canvas.visible = param1;
      }
      
      override protected function onTimerEvent(param1:TimerEvent) : void
      {
         if(var_2856)
         {
            _frame = _frame == 1 ? 0 : 1;
            image = _assets.getAssetByName("icon_messenger_notify_" + _frame + "_png") as BitmapDataAsset;
         }
      }
   }
}
