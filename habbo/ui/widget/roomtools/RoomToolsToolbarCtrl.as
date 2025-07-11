package com.sulake.habbo.ui.widget.roomtools
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.motion.Callback;
   import com.sulake.core.window.motion.EaseOut;
   import com.sulake.core.window.motion.Motion;
   import com.sulake.core.window.motion.MoveTo;
   import com.sulake.core.window.motion.Queue;
   import com.sulake.core.window.motion.class_3596;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.tracking.HabboTracking;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetZoomToggleMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.geom.Point;
   import flash.system.System;
   
   public class RoomToolsToolbarCtrl extends RoomToolsCtrlBase
   {
      
      private static const TOOLBAR_EXPAND_TARGET_X:int = 1;
      
      private static const TOOLBAR_COLLAPSE_TARGET_X:int = -130;
       
      
      private var var_1978:RoomToolsHistory;
      
      public function RoomToolsToolbarCtrl(param1:RoomToolsWidget, param2:IHabboWindowManager, param3:IAssetLibrary)
      {
         super(param1,param2,param3);
         _window = param2.buildFromXML(param3.getAssetByName("room_tools_toolbar_xml").content as XML) as IWindowContainer;
         _window.procedure = onWindowEvent;
         _window.addEventListener("WME_OVER",onWindowEvent);
         _window.addEventListener("WME_OUT",onWindowEvent);
         updateVisuals();
      }
      
      override public function dispose() : void
      {
         if(var_1978)
         {
            var_1978.dispose();
            var_1978 = null;
         }
         var _loc1_:IWindowContainer = var_1629.windowManager.getWindowByName("share_room_link") as IWindowContainer;
         if(_loc1_)
         {
            _loc1_.dispose();
         }
         super.dispose();
      }
      
      public function updateRoomHistoryButtons() : void
      {
         if(var_1629.currentRoomIndex >= var_1629.visitedRooms.length - 1)
         {
            _window.findChildByName("button_history_forward").disable();
         }
         else
         {
            _window.findChildByName("button_history_forward").enable();
         }
         if(var_1629.currentRoomIndex == 0)
         {
            _window.findChildByName("button_history_back").disable();
         }
         else
         {
            _window.findChildByName("button_history_back").enable();
         }
         if(var_1629.visitedRooms.length <= 1)
         {
            _window.findChildByName("button_history").disable();
         }
         else
         {
            _window.findChildByName("button_history").enable();
         }
      }
      
      public function disableRoomHistoryButtons() : void
      {
         _window.findChildByName("button_history_forward").disable();
         _window.findChildByName("button_history_back").disable();
      }
      
      private function toggleHistory() : void
      {
         if(var_1978)
         {
            var_1978.dispose();
            var_1978 = null;
         }
         else
         {
            var_1978 = new RoomToolsHistory(_windowManager,_assets,handler);
            var_1978.populate(var_1629.visitedRooms);
            updatePosition();
         }
      }
      
      public function setChatHistoryButton(param1:Boolean) : void
      {
         setElementVisible("button_chat_history",param1);
      }
      
      public function setCameraButton(param1:Boolean) : void
      {
         setElementVisible("button_camera",param1);
      }
      
      public function setLikeButton(param1:Boolean) : void
      {
         setElementVisible("button_like",param1);
      }
      
      override public function setElementVisible(param1:String, param2:Boolean) : void
      {
         if(!_window)
         {
            return;
         }
         _window.visible = true;
         super.setElementVisible(param1,param2);
         updatePosition();
      }
      
      public function updatePosition() : void
      {
         var _loc3_:IWindow = null;
         var _loc5_:IWindow = null;
         var _loc7_:IItemListWindow = null;
         var _loc4_:IWindow = null;
         var _loc1_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:IWindow = null;
         if(var_1798)
         {
            _loc3_ = _window.findChildByName("side_bar_expand");
            _loc3_.y = _window.height - _loc3_.height;
         }
         else
         {
            _loc5_ = _window.findChildByName("arrow_collapse");
            _loc7_ = _window.findChildByName("itemlist_buttons") as IItemListWindow;
            _loc4_ = _window.findChildByName("side_bar_collapse");
            _loc1_ = 0;
            _loc6_ = 0;
            while(_loc6_ < _loc7_.numListItems)
            {
               _loc2_ = _loc7_.getListItemAt(_loc6_);
               if(_loc2_.visible)
               {
                  _loc1_ += _loc2_.height;
               }
               _loc6_++;
            }
            _loc4_.height = _loc1_;
            _window.height = _loc7_.height = _window.findChildByName("window_bg").height = _loc1_;
            _loc5_.y = _loc1_ * 0.5 - _loc5_.height * 0.5;
         }
         _window.position = new Point(-5,_window.desktop.height - 55 - _window.height);
         if(var_1978)
         {
            var_1978.window.position = new Point(right - var_1978.window.width,_window.position.y - var_1978.window.height);
         }
      }
      
      override public function setCollapsed(param1:Boolean) : void
      {
         var _loc3_:Motion = null;
         if(var_1798 == param1 || !_window)
         {
            return;
         }
         var_1798 = param1;
         var _loc2_:IWindow = _window.findChildByName("window_bg");
         if(!_loc2_)
         {
            return;
         }
         if(var_1798)
         {
            _loc3_ = new Queue(new EaseOut(new MoveTo(_loc2_,100,-130,_loc2_.y),1),new Callback(motionComplete));
         }
         else
         {
            _loc2_.x = -130;
            updateVisuals();
            _loc3_ = new EaseOut(new MoveTo(_loc2_,100,1,_loc2_.y),1);
         }
         class_3596.runMotion(_loc3_);
      }
      
      private function motionComplete(param1:Motion) : void
      {
         updateVisuals();
      }
      
      private function updateVisuals() : void
      {
         if(!_window || !_window.findChildByName("window_bg"))
         {
            return;
         }
         _window.findChildByName("window_bg").visible = !var_1798;
         _window.findChildByName("side_bar_collapse").visible = !var_1798;
         _window.findChildByName("side_bar_expand").visible = var_1798;
         updatePosition();
      }
      
      private function onWindowEvent(param1:WindowEvent, param2:IWindow) : void
      {
         var message:RoomWidgetZoomToggleMessage;
         var link:String;
         var window:IWindowContainer;
         var asset:XML;
         var openCameraEvent:HabboToolbarEvent;
         var event:WindowEvent = param1;
         var target:IWindow = param2;
         if(event.type == "WE_PARENT_RESIZED" && _window && _window.parent && event.target == _window.parent)
         {
            return updatePosition();
         }
         var _loc6_:* = event.type;
         if("WME_CLICK" === _loc6_)
         {
            clearCollapseTimer();
            switch(target.name)
            {
               case "button_settings":
                  handler.toggleRoomInfoWindow();
                  break;
               case "button_zoom":
                  if(var_1629.messageListener)
                  {
                     message = new RoomWidgetZoomToggleMessage();
                     var_1629.messageListener.processWidgetMessage(message);
                  }
                  break;
               case "button_collapse":
               case "button_expand":
                  var_1629.setCollapsed(!var_1798);
                  handler.sessionDataManager.setRoomToolsState(!var_1798);
                  break;
               case "button_history_back":
                  var_1629.goToPreviousRoom();
                  break;
               case "button_history_forward":
                  var_1629.goToNextRoom();
                  break;
               case "button_history":
                  toggleHistory();
                  break;
               case "button_chat_history":
                  if(var_1629.freeFlowChat)
                  {
                     var_1629.freeFlowChat.toggleVisibility();
                  }
                  break;
               case "button_like":
                  handler.rateRoom();
                  _window.findChildByName("button_like").disable();
                  break;
               case "button_share":
                  link = getEmbedData();
                  window = var_1629.windowManager.getWindowByName("share_room_link") as IWindowContainer;
                  if(window == null)
                  {
                     asset = _assets.getAssetByName("share_room_xml").content as XML;
                     if(asset)
                     {
                        window = var_1629.windowManager.buildFromXML(asset) as IWindowContainer;
                     }
                  }
                  if(window)
                  {
                     HabboTracking.getInstance().trackEventLog("RoomLink","click","client.room_link.clicked");
                     window.name = "share_room_link";
                     window.center();
                     window.findChildByTag("close").addEventListener("WME_CLICK",function(param1:WindowMouseEvent, param2:IWindow = null):void
                     {
                        window.dispose();
                     });
                     window.findChildByName("embed_src_txt").caption = getEmbedData();
                     window.findChildByName("embed_src_direct_txt").caption = getEmbedData("embed_src_direct_txt","${url.prefix}/room/%roomId%");
                     IStaticBitmapWrapperWindow(window.findChildByName("thumbnail_image")).assetUri = getThumbnailUrl();
                  }
                  try
                  {
                     System.setClipboard(getEmbedData());
                  }
                  catch(error:Error)
                  {
                  }
                  break;
               case "button_camera":
                  openCameraEvent = new HabboToolbarEvent("HTE_ICON_CAMERA");
                  openCameraEvent.iconName = "roomToolsMenu";
                  handler.container.toolbar.events.dispatchEvent(openCameraEvent);
            }
         }
      }
      
      private function getEmbedData(param1:String = "navigator.embed.src", param2:String = "") : String
      {
         var _loc4_:String = null;
         var _loc5_:String = null;
         if(var_1629.handler.navigator.enteredGuestRoomData != null)
         {
            _loc4_ = "private";
            _loc5_ = "" + var_1629.handler.navigator.enteredGuestRoomData.flatId;
         }
         var _loc3_:String = String(var_1629.handler.container.config.getProperty("user.hash"));
         if(var_1629.localizations.hasLocalization(param1))
         {
            var_1629.localizations.registerParameter(param1,"roomType",_loc4_);
            var_1629.localizations.registerParameter(param1,"embedCode",_loc3_);
            var_1629.localizations.registerParameter(param1,"roomId",_loc5_);
         }
         else if(param2 != "")
         {
            param2 = param2.replace("${url.prefix}",var_1629.handler.container.config.getProperty("url.prefix"));
            return param2.replace("%roomId%",_loc5_);
         }
         return var_1629.localizations.getLocalization(param1,param2);
      }
      
      private function getThumbnailUrl() : String
      {
         var _loc1_:String = null;
         var _loc2_:String = "";
         if(var_1629.handler.navigator.enteredGuestRoomData.officialRoomPicRef != null)
         {
            if(var_1629.handler.container.config.getBoolean("new.navigator.official.room.thumbnails.in.amazon"))
            {
               _loc1_ = String(var_1629.handler.container.config.getProperty("navigator.thumbnail.url_base"));
               _loc2_ = _loc1_ + var_1629.handler.navigator.enteredGuestRoomData.flatId + ".png";
            }
            else
            {
               _loc2_ = var_1629.handler.container.config.getProperty("image.library.url") + var_1629.handler.navigator.enteredGuestRoomData.officialRoomPicRef;
            }
         }
         else
         {
            _loc1_ = String(var_1629.handler.container.config.getProperty("navigator.thumbnail.url_base"));
            _loc2_ = _loc1_ + var_1629.handler.navigator.enteredGuestRoomData.flatId + ".png";
         }
         return _loc2_;
      }
      
      public function get right() : int
      {
         var _loc1_:IWindow = null;
         if(!_window)
         {
            return 0;
         }
         if(var_1798)
         {
            _loc1_ = _window.findChildByName("side_bar_expand");
            return !!_loc1_ ? _loc1_.width + -5 : 0;
         }
         return _window.width + -5;
      }
   }
}
