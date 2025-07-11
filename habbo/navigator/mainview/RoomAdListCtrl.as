package com.sulake.habbo.navigator.mainview
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.communication.messages.incoming.navigator.class_1675;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomAdEventTabAdClickedComposer;
   
   public class RoomAdListCtrl extends GuestRoomListCtrl
   {
       
      
      public function RoomAdListCtrl(param1:HabboNavigator, param2:int, param3:Boolean)
      {
         super(param1,param2,param3);
      }
      
      override protected function getListEntry(param1:int) : IWindowContainer
      {
         var _loc2_:IWindowContainer = IWindowContainer(_navigator.getXmlWindow("grs_room_ads_details_phase_one"));
         _loc2_.background = true;
         _loc2_.addEventListener("WME_MOVE",onMouseMove);
         _loc2_.addEventListener("WME_OVER",onMouseOver);
         _loc2_.addEventListener("WME_OUT",onMouseOut);
         _loc2_.addEventListener("WME_CLICK",onMouseClick);
         _loc2_.setParamFlag(1,true);
         _loc2_.setParamFlag(128,true);
         _loc2_.color = getBgColor(param1);
         _loc2_.tags.push(param1);
         return _loc2_;
      }
      
      override protected function refreshEntryDetails(param1:IWindowContainer, param2:class_1675) : void
      {
         param1.visible = true;
         var _loc3_:ITextWindow = ITextWindow(param1.getChildByName("adname"));
         _loc3_.visible = true;
         Util.cutTextToWidth(_loc3_,param2.roomAdName,param1.width);
         _navigator.refreshButton(param1,"doormode_doorbell_small",param2.doorMode == 1,null,0);
         _navigator.refreshButton(param1,"doormode_password_small",param2.doorMode == 2,null,0);
         _navigator.refreshButton(param1,"doormode_invisible_small",param2.doorMode == 3,null,0);
         var_2977.refreshUserCount(param2.maxUserCount,param1,param2.userCount,"${navigator.usercounttooltip.users}",308,2);
      }
      
      private function getRoomAt(param1:int) : class_1675
      {
         return getRooms()[param1];
      }
      
      override protected function onMouseClick(param1:WindowEvent) : void
      {
         var _loc4_:IWindow;
         var _loc3_:int = int((_loc4_ = param1.target).tags[0]);
         var _loc2_:class_1675 = getRoomAt(_loc3_);
         if(_navigator)
         {
            _navigator.send(new RoomAdEventTabAdClickedComposer(_loc2_.flatId,_loc2_.roomAdName,_loc2_.roomAdExpiresInMin));
         }
         super.onMouseClick(param1);
      }
   }
}
