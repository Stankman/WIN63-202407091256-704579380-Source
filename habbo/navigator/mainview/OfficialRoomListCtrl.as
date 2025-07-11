package com.sulake.habbo.navigator.mainview
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.*;
   import com.sulake.habbo.navigator.*;
   import com.sulake.habbo.communication.messages.incoming.navigator.class_1653;
   
   public class OfficialRoomListCtrl implements IViewCtrl
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var _content:IWindowContainer;
      
      private var var_19:IItemListWindow;
      
      private var var_3113:PromotedRoomsListCtrl;
      
      public function OfficialRoomListCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_3113 = new PromotedRoomsListCtrl(_navigator);
      }
      
      public function dispose() : void
      {
         if(var_3113 != null)
         {
            var_3113.dispose();
            var_3113 = null;
         }
      }
      
      public function set content(param1:IWindowContainer) : void
      {
         _content = param1;
         var_19 = !!_content ? IItemListWindow(_content.findChildByName("item_list_official")) : null;
      }
      
      public function get content() : IWindowContainer
      {
         return _content;
      }
      
      public function refresh() : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = false;
         var _loc3_:IWindowContainer = null;
         var _loc1_:Boolean = false;
         var _loc2_:Array = this.getVisibleEntries();
         var_19.autoArrangeItems = false;
         refreshPromotedRooms();
         _loc4_ = 0;
         while(true)
         {
            _loc5_ = _loc4_ % 2 != 0;
            _loc3_ = IWindowContainer(var_19.getListItemAt(_loc4_ + 1));
            if(_loc4_ < _loc2_.length)
            {
               refreshEntry(true,_loc5_,_loc3_,_loc2_[_loc4_]);
            }
            else
            {
               _loc1_ = refreshEntry(false,_loc5_,_loc3_,null);
               if(_loc1_)
               {
                  break;
               }
            }
            _loc4_++;
         }
         var_19.autoArrangeItems = true;
      }
      
      private function getVisibleEntries() : Array
      {
         var _loc2_:Array = _navigator.data.officialRooms.entries;
         var _loc1_:Array = [];
         var _loc4_:int = 0;
         for each(var _loc3_ in _loc2_)
         {
            if(_loc3_.folderId > 0)
            {
               if(_loc3_.folderId == _loc4_)
               {
                  _loc1_.push(_loc3_);
               }
            }
            else
            {
               _loc4_ = int(_loc3_.open ? _loc3_.index : 0);
               _loc1_.push(_loc3_);
            }
         }
         return _loc1_;
      }
      
      private function refreshEntry(param1:Boolean, param2:Boolean, param3:IWindowContainer, param4:class_1653) : Boolean
      {
         if(param3 == null)
         {
            if(!param1)
            {
               return true;
            }
            param3 = _navigator.officialRoomEntryManager.createEntry(param2);
            var_19.addListItem(param3);
         }
         _navigator.officialRoomEntryManager.refreshEntry(param3,param1,param4);
         return false;
      }
      
      private function refreshPromotedRooms() : void
      {
         var _loc1_:IWindowContainer = IWindowContainer(var_19.getListItemAt(0));
         var_3113.refresh(_loc1_,_navigator.data.promotedRooms.entries);
      }
   }
}
