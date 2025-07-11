package com.sulake.habbo.roomevents.wired_setup.conditions
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.class_3398;
   import com.sulake.core.window.components.class_3520;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.class_1659;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   import com.sulake.habbo.roomevents.wired_setup.common.utils.WiredUserAction;
   
   public class ActorIsPerformingAction extends DefaultConditionType
   {
       
      
      private var _cont:IWindowContainer;
      
      public function ActorIsPerformingAction()
      {
         super();
      }
      
      private static function getActionByCode(param1:int) : WiredUserAction
      {
         var _loc3_:int = 0;
         var _loc4_:WiredUserAction = null;
         var _loc2_:Vector.<WiredUserAction> = WiredUserAction.const_413;
         _loc3_ = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc4_ = _loc2_[_loc3_];
            if(param1 == _loc4_.code)
            {
               return _loc4_;
            }
            _loc3_++;
         }
         return null;
      }
      
      private static function getExtraUsageCheckbox(param1:IWindowContainer) : class_3398
      {
         return class_3398(param1.findChildByName("usage_checkbox"));
      }
      
      private static function getExtraMenu(param1:IWindowContainer) : class_3520
      {
         return class_3520(param1.findChildByName("extra_menu"));
      }
      
      private static function getSelectedCode(param1:class_3520) : int
      {
         var _loc3_:Array = param1.enumerateSelection();
         var _loc2_:int = param1.selection;
         if(_loc2_ == -1)
         {
            return -1;
         }
         return getCodeFromLoc(_loc3_[_loc2_]);
      }
      
      private static function setSelectedByCode(param1:class_3520, param2:int) : void
      {
         var _loc4_:int = 0;
         var _loc3_:Array = param1.enumerateSelection();
         var _loc5_:* = -1;
         _loc4_ = 0;
         while(_loc4_ < _loc3_.length)
         {
            if(getCodeFromLoc(_loc3_[_loc4_]) == param2)
            {
               _loc5_ = _loc4_;
            }
            _loc4_++;
         }
         param1.selection = _loc5_;
      }
      
      private static function getCodeFromLoc(param1:String) : int
      {
         var _loc2_:Array = param1.substr(0,param1.length - 1).split(".");
         var _loc3_:String = String(_loc2_[_loc2_.length - 1]);
         return parseInt(_loc3_);
      }
      
      override public function get code() : int
      {
         return class_3848.PERFORMING_ACTION;
      }
      
      override public function get negativeCode() : int
      {
         return class_3848.NOT_PERFORMING_ACTION;
      }
      
      override protected function get legacyInputMode() : Boolean
      {
         return true;
      }
      
      override public function onInit(param1:IWindowContainer, param2:IWindowContainer, param3:HabboUserDefinedRoomEvents) : void
      {
         var menu:class_3520;
         var allActions:Vector.<WiredUserAction>;
         var i:int;
         var action:WiredUserAction;
         var container:IWindowContainer;
         var cont:IWindowContainer = param1;
         var advancedCont:IWindowContainer = param2;
         var roomEvents:HabboUserDefinedRoomEvents = param3;
         super.onInit(cont,advancedCont,roomEvents);
         _cont = cont;
         menu = getActionMenu();
         menu.addEventListener("WE_SELECTED",onSelectAction);
         allActions = WiredUserAction.const_413;
         i = 0;
         while(i < allActions.length)
         {
            action = allActions[i];
            if(action.hasExtra)
            {
               container = getSubContainer(action.name);
               (function(param1:int):void
               {
                  var code:int = param1;
                  getExtraUsageCheckbox(container).addEventListener("WE_SELECT",function(param1:WindowEvent):void
                  {
                     setExtraUsage(code,true);
                  });
               })(action.code);
               (function(param1:int):void
               {
                  var code:int = param1;
                  getExtraUsageCheckbox(container).addEventListener("WE_UNSELECT",function(param1:WindowEvent):void
                  {
                     setExtraUsage(code,false);
                  });
               })(action.code);
            }
            i++;
         }
      }
      
      override public function onEditStart(param1:class_1659) : void
      {
         setSelectedByCode(getActionMenu(),param1.intParams[0]);
         initializeExtraMenu(param1.stringParam);
      }
      
      override public function readStringParamFromForm() : String
      {
         var _loc2_:int = 0;
         var _loc3_:WiredUserAction = getSelectedAction();
         var _loc1_:IWindowContainer = getSubContainer(_loc3_.name);
         if(_loc3_.hasExtra && Boolean(getExtraUsageCheckbox(_loc1_).isSelected))
         {
            _loc2_ = getSelectedCode(getExtraMenu(_loc1_));
            if(_loc2_ == -1)
            {
               return "";
            }
            return _loc3_.convertCodeToExtraString(_loc2_);
         }
         return "";
      }
      
      override public function readIntParamsFromForm() : Array
      {
         var _loc1_:Array = [];
         var _loc2_:WiredUserAction = getSelectedAction();
         _loc1_.push(_loc2_.code);
         return _loc1_;
      }
      
      private function onSelectAction(param1:WindowEvent) : void
      {
         initializeExtraMenu();
      }
      
      private function setExtraUsage(param1:int, param2:Boolean) : void
      {
         var _loc4_:WiredUserAction = getActionByCode(param1);
         var _loc3_:IWindowContainer = getSubContainer(_loc4_.name);
         var _loc5_:class_3520;
         (_loc5_ = getExtraMenu(_loc3_)).visible = param2;
      }
      
      private function initializeExtraMenu(param1:String = "") : void
      {
         var _loc6_:int = 0;
         var _loc7_:WiredUserAction = null;
         var _loc2_:IWindowContainer = null;
         var _loc8_:class_3520 = null;
         var _loc5_:class_3398 = null;
         var _loc3_:int = getSelectedCode(getActionMenu());
         var _loc4_:Vector.<WiredUserAction> = WiredUserAction.const_413;
         _loc6_ = 0;
         while(_loc6_ < _loc4_.length)
         {
            if((_loc7_ = _loc4_[_loc6_]).hasExtra)
            {
               _loc2_ = getSubContainer(_loc7_.name);
               _loc2_.visible = _loc3_ == _loc7_.code;
               if(_loc3_ == _loc7_.code)
               {
                  _loc8_ = getExtraMenu(_loc2_);
                  _loc5_ = getExtraUsageCheckbox(_loc2_);
                  if(param1 == "")
                  {
                     _loc5_.unselect();
                     _loc8_.selection = -1;
                     _loc8_.visible = false;
                  }
                  else
                  {
                     _loc5_.select();
                     setSelectedByCode(_loc8_,_loc7_.convertExtraStringToCode(param1));
                     _loc8_.visible = true;
                  }
               }
            }
            _loc6_++;
         }
      }
      
      private function getSelectedAction() : WiredUserAction
      {
         var _loc1_:int = getSelectedCode(getActionMenu());
         return getActionByCode(_loc1_);
      }
      
      private function getActionMenu() : class_3520
      {
         return class_3520(_cont.findChildByName("menu_action"));
      }
      
      private function getSubContainer(param1:String) : IWindowContainer
      {
         var _loc2_:String = param1 + "_selection";
         return _cont.getChildByName(_loc2_) as IWindowContainer;
      }
   }
}
