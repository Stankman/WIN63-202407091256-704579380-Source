package com.sulake.habbo.navigator.roomsettings
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.components.class_3514;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.IHabboTransitionalNavigator;
   import flash.geom.Rectangle;
   
   public class ConfirmDialogView implements IDisposable
   {
       
      
      private var _window:class_3514;
      
      private var var_4237:Function;
      
      public function ConfirmDialogView(param1:IHabboTransitionalNavigator, param2:Function, param3:String, param4:String)
      {
         super();
         this._window = class_3514(param1.getXmlWindow("ros_confirm"));
         this.var_4237 = param2;
         _window.findChildByTag("close").addEventListener("WME_CLICK",onCancel);
         _window.findChildByName("ok").addEventListener("WME_CLICK",onOk);
         _window.caption = param3;
         _window.findChildByName("message").caption = param4;
         var _loc5_:Rectangle = Util.getLocationRelativeTo(_window.desktop,_window.width,_window.height);
         _window.x = _loc5_.x;
         _window.y = _loc5_.y;
         _window.visible = true;
         _window.activate();
      }
      
      private function onCancel(param1:WindowMouseEvent) : void
      {
         dispose();
      }
      
      private function onOk(param1:WindowMouseEvent) : void
      {
         var_4237.apply();
         dispose();
      }
      
      public function dispose() : void
      {
         if(_window != null)
         {
            _window.destroy();
            _window = null;
         }
         var_4237 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _window == null;
      }
   }
}
