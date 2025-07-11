package com.sulake.habbo.ui
{
   import com.sulake.core.runtime.ICoreConfiguration;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.class_3431;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.geom.Rectangle;
   
   public class class_3604
   {
      
      private static const ROOM_VIEW:String = "room_view";
      
      private static const ROOM_NEW_CHAT:String = "room_new_chat";
      
      private static const ROOM_WIDGET:String = "room_widget";
      
      private static const BOTTOM_MARGIN:int = 47;
       
      
      private var _layoutContainer:IWindowContainer;
      
      public function class_3604()
      {
         super();
      }
      
      public function dispose() : void
      {
         if(_layoutContainer != null)
         {
            _layoutContainer.dispose();
         }
      }
      
      public function setLayout(param1:XML, param2:IHabboWindowManager, param3:ICoreConfiguration) : void
      {
         var _loc7_:IWindow = null;
         var _loc6_:int = 0;
         var _loc5_:int = 0;
         if(param1 == null || param2 == null)
         {
            throw new Error("Unable to set room desktop layout.");
         }
         _layoutContainer = param2.buildFromXML(param1,0) as IWindowContainer;
         if(_layoutContainer == null)
         {
            throw new Error("Failed to build layout from XML.");
         }
         _layoutContainer.width = _layoutContainer.desktop.width;
         _layoutContainer.height = _layoutContainer.desktop.height;
         var _loc4_:IWindowContainer;
         (_loc4_ = _layoutContainer.desktop as IWindowContainer).addChild(_layoutContainer);
         _layoutContainer.findChildByTag("room_widget_infostand").y = _layoutContainer.findChildByTag("room_widget_infostand").y - 47;
         _loc6_ = 0;
         while(_loc6_ < _layoutContainer.numChildren)
         {
            _loc7_ = _layoutContainer.getChildAt(_loc6_);
            _loc5_ = 1048576;
            if(_loc7_.testParamFlag(_loc5_))
            {
               _loc7_.addEventListener("WE_CHILD_RESIZED",trimContainer);
            }
            _loc6_++;
         }
      }
      
      private function trimContainer(param1:WindowEvent) : void
      {
         var _loc2_:IWindowContainer = param1.window as IWindowContainer;
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_.numChildren != 1)
         {
            return;
         }
         var _loc3_:IWindow = _loc2_.getChildAt(0);
         if(_loc3_ == null)
         {
            return;
         }
         _loc2_.width = _loc3_.width;
         _loc2_.height = _loc3_.height;
      }
      
      private function getWidgetContainer(param1:String, param2:IWindow) : IWindowContainer
      {
         var _loc7_:* = null;
         var _loc3_:* = null;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         if(param2 == null)
         {
            return null;
         }
         if(param1 == "RWE_HIGH_SCORE_DISPLAY" || param1 == "RWE_WORD_QUIZZ")
         {
            return _layoutContainer.getChildByName("background_widgets") as IWindowContainer;
         }
         if(param1 == "RWE_CHAT_INPUT_WIDGET")
         {
            return param2.desktop as IWindowContainer;
         }
         var _loc8_:Array = param2.tags;
         _loc6_ = 0;
         while(_loc6_ < _loc8_.length)
         {
            if(String(_loc8_[_loc6_]).indexOf("room_widget") == 0)
            {
               _loc5_ = _loc8_[_loc6_] as String;
               break;
            }
            _loc6_++;
         }
         if(_loc5_ == null)
         {
            return null;
         }
         return _layoutContainer.getChildByTag(_loc5_) as IWindowContainer;
      }
      
      public function addWidgetWindow(param1:String, param2:IWindow) : Boolean
      {
         if(param2 == null)
         {
            return false;
         }
         var _loc3_:IWindowContainer = getWidgetContainer(param1,param2);
         if(_loc3_ == null)
         {
            return false;
         }
         if(param1 == "RWE_CHAT_INPUT_WIDGET")
         {
            _loc3_.addChild(param2);
            return true;
         }
         param2.x = 0;
         param2.y = 0;
         _loc3_.addChild(param2);
         _loc3_.width = param2.width;
         _loc3_.height = param2.height;
         return true;
      }
      
      public function removeWidgetWindow(param1:String, param2:IWindow) : void
      {
         var _loc3_:IWindowContainer = getWidgetContainer(param1,param2);
         if(_loc3_ != null)
         {
            _loc3_.removeChild(param2);
         }
      }
      
      public function addRoomView(param1:IWindow) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:IWindowContainer = _layoutContainer.getChildByTag("room_view") as IWindowContainer;
         if(_loc2_ == null)
         {
            return false;
         }
         _loc2_.addChild(param1);
         return true;
      }
      
      public function get roomViewRect() : Rectangle
      {
         if(_layoutContainer == null)
         {
            return null;
         }
         var _loc1_:IWindowContainer = _layoutContainer.findChildByTag("room_view") as IWindowContainer;
         if(!_loc1_)
         {
            return null;
         }
         var _loc2_:Rectangle = _loc1_.rectangle;
         if(!_loc2_)
         {
            return null;
         }
         _loc2_.offset(_layoutContainer.x,_layoutContainer.y);
         return _loc2_;
      }
      
      public function getRoomView() : IWindow
      {
         if(_layoutContainer == null)
         {
            return null;
         }
         var _loc1_:IWindowContainer = _layoutContainer.findChildByTag("room_view") as IWindowContainer;
         if(_loc1_ != null && _loc1_.numChildren > 0)
         {
            return _loc1_.getChildAt(0);
         }
         return null;
      }
      
      public function getChatContainer() : class_3431
      {
         if(_layoutContainer == null)
         {
            return null;
         }
         return _layoutContainer.findChildByTag("room_new_chat") as class_3431;
      }
   }
}
