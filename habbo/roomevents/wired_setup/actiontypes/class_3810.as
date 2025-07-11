package com.sulake.habbo.roomevents.wired_setup.actiontypes
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IRadioButtonWindow;
   import com.sulake.core.window.components.ISelectorWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.class_3398;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.class_1659;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   import com.sulake.habbo.roomevents.Util;
   import com.sulake.habbo.roomevents.wired_setup.common.SliderWindowController;
   import flash.events.Event;
   
   public class class_3810 extends DefaultActionType
   {
       
      
      private var _roomEvents:HabboUserDefinedRoomEvents;
      
      private var var_3218:SliderWindowController;
      
      private var var_3521:int = 5;
      
      private const MAX_REWARDS:int = 20;
      
      public function class_3810()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3849.GIVE_REWARD;
      }
      
      override public function validate() : String
      {
         var _loc3_:int = 0;
         var _loc2_:IWindowContainer = null;
         var _loc4_:String = null;
         var _loc1_:IWindowContainer = IWindowContainer(cont.findChildByName("rewards_container"));
         var _loc5_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < _loc1_.numChildren)
         {
            _loc2_ = IWindowContainer(_loc1_.getChildAt(_loc3_));
            if(_loc2_.visible)
            {
               if((_loc4_ = validateReward(_loc2_,getUniquePrizeCheckBox(cont).isSelected)) != null)
               {
                  return _loc4_;
               }
               _loc5_ += int(getPropabilityInput(_loc2_).text);
            }
            _loc3_++;
         }
         if(_loc5_ > 100)
         {
            return "The sum of probabilities cannot exceed 100. You now have " + _loc5_ + ".";
         }
         return null;
      }
      
      override public function readIntParamsFromForm() : Array
      {
         var _loc1_:Array = [];
         _loc1_.push(getUserRewardIntervalSelector(cont).getSelected().id);
         _loc1_.push(!!getUniquePrizeCheckBox(cont).isSelected ? 1 : 0);
         _loc1_.push(!!getPrizeLimitCheckBox(cont).isSelected ? var_3218.getValue() : 0);
         var _loc2_:int = int(getDonationRateIntervalInput(cont).caption);
         _loc1_.push(_loc2_ >= 1 ? _loc2_ : 1);
         return _loc1_;
      }
      
      override public function readStringParamFromForm() : String
      {
         var _loc5_:int = 0;
         var _loc4_:IWindowContainer = null;
         var _loc1_:String = null;
         var _loc2_:String = "";
         var _loc3_:IWindowContainer = IWindowContainer(cont.findChildByName("rewards_container"));
         _loc5_ = 0;
         while(_loc5_ < _loc3_.numChildren)
         {
            if((_loc4_ = IWindowContainer(_loc3_.getChildAt(_loc5_))).visible)
            {
               _loc1_ = getRewardData(_loc4_);
               if(_loc1_ != null)
               {
                  _loc2_ += (_loc2_ == "" ? "" : ";") + _loc1_;
               }
            }
            _loc5_++;
         }
         return _loc2_;
      }
      
      private function validateReward(param1:IWindowContainer, param2:Boolean) : String
      {
         var _loc5_:int = 0;
         var _loc4_:String = String(getRewardCodeInput(param1).text);
         var _loc3_:String = String(getPropabilityInput(param1).text);
         if(_loc4_ == "" && _loc3_ == "")
         {
            return null;
         }
         if(_loc4_.indexOf(",") > 0)
         {
            return "Product/badge codes must not contain \',\' characters.";
         }
         if(_loc4_.indexOf(";") > 0)
         {
            return "Product/badge codes must not contain \';\' characters.";
         }
         var _loc6_:int = 100;
         if(_loc4_.length > _loc6_)
         {
            return "Product/badge codes cannot contain more than " + _loc6_ + " characters.";
         }
         if(_loc4_ == "")
         {
            return "Remember to define product/badge codes for all rewards (fill all fields or leave all fields empty).";
         }
         if(!param2)
         {
            if(_loc3_ == "")
            {
               return "Remember to define probabilities for all rewards (fill all fields or leave all fields empty).";
            }
            if(isNaN(Number(_loc3_)))
            {
               return "Make sure are probabilities are numbers.";
            }
            if((_loc5_ = int(_loc3_)) < 1 || _loc5_ > 100)
            {
               return "Make sure all probabilities are numbers between 1 and 100.";
            }
         }
         return null;
      }
      
      private function getRewardData(param1:IWindowContainer) : String
      {
         var _loc3_:String = String(getRewardCodeInput(param1).text);
         var _loc5_:String = String(getPropabilityInput(param1).text);
         var _loc2_:Boolean = Boolean(getIsBadgeCheckBox(param1).isSelected);
         _loc3_ = replaceAll(_loc3_,";","");
         _loc3_ = replaceAll(_loc3_,",","");
         if(_loc3_ == "")
         {
            return null;
         }
         var _loc4_:int = int(isNaN(Number(_loc5_)) ? 0 : int(_loc5_));
         return (_loc2_ ? "0" : "1") + "," + _loc3_ + "," + _loc4_;
      }
      
      private function setRewardData(param1:int, param2:IWindowContainer, param3:String) : void
      {
         var _loc4_:Array = param3 == null ? [] : param3.split(",");
         getRewardCodeInput(param2).text = !!_loc4_[1] ? _loc4_[1] : "";
         getPropabilityInput(param2).text = !!_loc4_[2] ? _loc4_[2] : "";
         if(_loc4_[0] && _loc4_[0] == "0")
         {
            getIsBadgeCheckBox(param2).select();
         }
         else
         {
            getIsBadgeCheckBox(param2).unselect();
         }
      }
      
      private function replaceAll(param1:String, param2:String, param3:String) : String
      {
         var _loc4_:int = 100;
         while(param1.indexOf(param2) > -1)
         {
            param1 = param1.replace(param2,param3);
            _loc4_--;
            if(_loc4_ < 1)
            {
               break;
            }
         }
         return param1;
      }
      
      override public function onInit(param1:IWindowContainer, param2:IWindowContainer, param3:HabboUserDefinedRoomEvents) : void
      {
         var _loc6_:int = 0;
         var _loc5_:IWindowContainer = null;
         super.onInit(param1,param2,param3);
         _roomEvents = param3;
         var_3218 = new SliderWindowController(param3,getPrizeLimitSliderContainer(param1),param3.assets,1,1000,1);
         var_3218.addEventListener("change",onSliderChange);
         var_3218.setValue(1);
         getPrizeLimitCheckBox(param1).procedure = onPrizeLimitCheckBox;
         getUniquePrizeCheckBox(param1).procedure = onUniquePrizeCheckBox;
         param1.findChildByName("add_reward_txt").procedure = onAddReward;
         var _loc4_:IWindowContainer = IWindowContainer(param1.findChildByName("rewards_container"));
         _loc6_ = 0;
         while(_loc6_ < 20)
         {
            _loc5_ = IWindowContainer(_roomEvents.getXmlWindow("ude_action_inputs_17_reward"));
            _loc4_.addChild(_loc5_);
            _loc5_.y = _loc6_ * 14;
            _loc5_.id = _loc6_;
            _loc6_++;
         }
      }
      
      override public function onEditStart(param1:class_1659) : void
      {
         var _loc7_:int = 0;
         var _loc5_:IWindowContainer = null;
         var _loc2_:int = int(param1.intParams[0]);
         getUserRewardIntervalSelector(cont).setSelected(getIntervalRadio(cont,_loc2_));
         if(_loc2_ > 0 && param1.intParams.length == 4)
         {
            getDonationRateIntervalInput(cont).caption = String(param1.intParams[3]);
         }
         else
         {
            getDonationRateIntervalInput(cont).caption = "1";
         }
         var _loc6_:*;
         if(_loc6_ = param1.intParams[1] == 1)
         {
            getUniquePrizeCheckBox(cont).select();
         }
         else
         {
            getUniquePrizeCheckBox(cont).unselect();
         }
         var _loc3_:int = int(param1.intParams[2]);
         if(_loc3_ > 0)
         {
            var_3218.setValue(_loc3_);
            getPrizeLimitCheckBox(cont).select();
         }
         else
         {
            getPrizeLimitCheckBox(cont).unselect();
         }
         refreshPrizeLimit(cont);
         var _loc8_:Array = param1.stringParam.split(";");
         var _loc4_:IWindowContainer = IWindowContainer(cont.findChildByName("rewards_container"));
         _loc7_ = 0;
         while(_loc7_ < 20)
         {
            _loc5_ = IWindowContainer(_loc4_.getChildAt(_loc7_));
            setRewardData(_loc7_,_loc5_,_loc8_[_loc7_]);
            if(_loc8_[_loc7_])
            {
               var_3521 = _loc7_ + 1;
            }
            _loc7_++;
         }
         setEntryVisibilities(cont);
         setPropabilityVisibilities(cont);
      }
      
      override protected function get legacyInputMode() : Boolean
      {
         return true;
      }
      
      private function getRewardCodeInput(param1:IWindowContainer) : ITextFieldWindow
      {
         return ITextFieldWindow(param1.findChildByName("reward_code_input"));
      }
      
      private function getPropabilityInput(param1:IWindowContainer) : ITextFieldWindow
      {
         return ITextFieldWindow(param1.findChildByName("propability_input"));
      }
      
      private function getIsBadgeCheckBox(param1:IWindowContainer) : class_3398
      {
         return class_3398(param1.findChildByName("is_badge_checkbox"));
      }
      
      private function getPrizeLimitSliderContainer(param1:IWindowContainer) : IWindowContainer
      {
         return IWindowContainer(param1.findChildByName("slider_container"));
      }
      
      private function getUniquePrizeCheckBox(param1:IWindowContainer) : class_3398
      {
         return class_3398(param1.findChildByName("unique_prize_checkbox"));
      }
      
      private function getPrizeLimitCheckBox(param1:IWindowContainer) : class_3398
      {
         return class_3398(param1.findChildByName("prize_limit_checkbox"));
      }
      
      private function getIntervalRadio(param1:IWindowContainer, param2:int) : IRadioButtonWindow
      {
         return IRadioButtonWindow(param1.findChildByName("interval_" + param2 + "_radio"));
      }
      
      private function getUserRewardIntervalSelector(param1:IWindowContainer) : ISelectorWindow
      {
         return ISelectorWindow(param1.findChildByName("user_reward_interval_selector"));
      }
      
      private function getDonationRateIntervalInput(param1:IWindowContainer) : ITextFieldWindow
      {
         return ITextFieldWindow(param1.findChildByName("interval_input"));
      }
      
      private function onSliderChange(param1:Event) : void
      {
         var _loc2_:SliderWindowController = null;
         var _loc4_:Number = NaN;
         var _loc3_:int = 0;
         if(param1.type == "change")
         {
            _loc2_ = param1.target as SliderWindowController;
            if(_loc2_)
            {
               _loc3_ = _loc4_ = _loc2_.getValue();
               setPrizeLimitAmount("" + _loc3_);
            }
         }
      }
      
      private function onPrizeLimitCheckBox(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == "WME_CLICK")
         {
            refreshPrizeLimit(IWindowContainer(param2.parent));
         }
      }
      
      private function onUniquePrizeCheckBox(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == "WME_CLICK")
         {
            setPropabilityVisibilities(IWindowContainer(param2.parent));
         }
      }
      
      private function onAddReward(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == "WME_CLICK")
         {
            var_3521++;
            setEntryVisibilities(IWindowContainer(param2.parent.parent));
         }
      }
      
      private function refreshPrizeLimit(param1:IWindowContainer) : void
      {
         var _loc2_:Boolean = Boolean(getPrizeLimitCheckBox(param1).isSelected);
         param1.findChildByName("prize_limit_warning_txt").visible = !_loc2_;
         getPrizeLimitSliderContainer(param1).visible = _loc2_;
         setPrizeLimitAmount(_loc2_ ? "" + var_3218.getValue() : "");
      }
      
      private function setPrizeLimitAmount(param1:String) : void
      {
         _roomEvents.localization.registerParameter("wiredfurni.params.prizelimit","amount",param1);
      }
      
      private function setEntryVisibilities(param1:IWindowContainer) : void
      {
         var _loc4_:int = 0;
         var _loc3_:IWindowContainer = null;
         var _loc2_:IWindowContainer = IWindowContainer(param1.findChildByName("rewards_container"));
         _loc4_ = 0;
         while(_loc4_ < 20)
         {
            _loc3_ = IWindowContainer(_loc2_.getChildAt(_loc4_));
            _loc3_.visible = _loc4_ < var_3521;
            _loc4_++;
         }
         _loc2_.height = Util.getLowestPoint(_loc2_);
         param1.height = Util.getLowestPoint(param1);
         _roomEvents.userDefinedRoomEventsCtrl.refresh();
      }
      
      private function setPropabilityVisibilities(param1:IWindowContainer) : void
      {
         var _loc5_:int = 0;
         var _loc3_:IWindowContainer = null;
         var _loc2_:IWindowContainer = IWindowContainer(param1.findChildByName("rewards_container"));
         var _loc4_:Boolean = Boolean(getUniquePrizeCheckBox(param1).isSelected);
         param1.findChildByName("propability_txt").visible = !_loc4_;
         _loc5_ = 0;
         while(_loc5_ < 20)
         {
            _loc3_ = IWindowContainer(_loc2_.getChildAt(_loc5_));
            getPropabilityInput(_loc3_).visible = !_loc4_;
            _loc5_++;
         }
      }
   }
}
