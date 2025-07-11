package com.sulake.habbo.ui.widget.poll
{
    import assets.class_14

    import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.utils.class_3348;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.widget.RoomWidgetBase;
   import com.sulake.habbo.ui.widget.events.RoomWidgetPollUpdateEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   
   public class PollWidget extends RoomWidgetBase
   {
       
      
      private var var_1982:Map;
      
      public function PollWidget(param1:IRoomWidgetHandler, param2:IHabboWindowManager, param3:IAssetLibrary = null, param4:IHabboLocalizationManager = null)
      {
         super(param1,param2,param3,param4);
         var_1982 = new Map();
      }
      
      override public function dispose() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:PollSession = null;
         if(disposed)
         {
            return;
         }
         if(var_1982 != null)
         {
            _loc2_ = int(var_1982.length);
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc1_ = var_1982.getWithIndex(0) as PollSession;
               if(_loc1_ != null)
               {
                  _loc1_.dispose();
               }
               _loc3_++;
            }
            var_1982.dispose();
            var_1982 = null;
         }
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener("RWPUW_OFFER",showPollOffer);
         param1.addEventListener("RWPUW_ERROR",showPollError);
         param1.addEventListener("RWPUW_CONTENT",showPollContent);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener("RWPUW_OFFER",showPollOffer);
         param1.removeEventListener("RWPUW_ERROR",showPollError);
         param1.removeEventListener("RWPUW_CONTENT",showPollContent);
      }
      
      private function showPollOffer(param1:Event) : void
      {
         var _loc4_:int = int(RoomWidgetPollUpdateEvent(param1).id);
         var _loc3_:PollSession = var_1982.getValue(_loc4_) as PollSession;
         var _loc2_:String = String(RoomWidgetPollUpdateEvent(param1).summary);
         var _loc5_:String = String(RoomWidgetPollUpdateEvent(param1).headline);
         if(!_loc3_)
         {
            _loc3_ = new PollSession(_loc4_,this);
            var_1982.add(_loc4_,_loc3_);
            _loc3_.showOffer(_loc5_,_loc2_);
         }
         else
         {
            class_14.log("Poll with given id already exists!");
            _loc3_.showOffer(_loc5_,_loc2_);
         }
      }
      
      private function showPollError(param1:Event) : void
      {
         var e:Event = param1;
         windowManager.alert("${win_error}",RoomWidgetPollUpdateEvent(e).summary,0,function(param1:class_3348, param2:WindowEvent):void
         {
            param1.dispose();
         });
      }
      
      private function showPollContent(param1:Event) : void
      {
         var _loc4_:int = 0;
         var _loc2_:PollSession = null;
         var _loc3_:RoomWidgetPollUpdateEvent = param1 as RoomWidgetPollUpdateEvent;
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.id;
            _loc2_ = var_1982.getValue(_loc4_) as PollSession;
            if(_loc2_ != null)
            {
               _loc2_.showContent(_loc3_.startMessage,_loc3_.endMessage,_loc3_.questionArray,_loc3_.npsPoll);
            }
         }
      }
      
      public function pollFinished(param1:int) : void
      {
         var _loc2_:PollSession = var_1982.getValue(param1) as PollSession;
         if(_loc2_ != null)
         {
            _loc2_.showThanks();
            _loc2_.dispose();
            var_1982.remove(param1);
         }
      }
      
      public function pollCancelled(param1:int) : void
      {
         var _loc2_:PollSession = var_1982.getValue(param1) as PollSession;
         if(_loc2_ != null)
         {
            _loc2_.dispose();
            var_1982.remove(param1);
         }
      }
   }
}
