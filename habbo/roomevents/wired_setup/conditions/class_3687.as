package com.sulake.habbo.roomevents.wired_setup.conditions
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.class_3398;
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.class_1659;
   
   public class class_3687 extends DefaultConditionType
   {
       
      
      public function class_3687()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3848.STATES_MATCH;
      }
      
      override public function get negativeCode() : int
      {
         return class_3848.NOT_STATES_MATCH;
      }
      
      override public function get hasStateSnapshot() : Boolean
      {
         return true;
      }
      
      override public function onEditStart(param1:class_1659) : void
      {
         select(getStateInput(cont),param1.getBoolean(0));
         select(getRotationInput(cont),param1.getBoolean(1));
         select(getLocationInput(cont),param1.getBoolean(2));
         select(getAltitudeInput(cont),param1.getBoolean(3));
      }
      
      private function select(param1:class_3398, param2:Boolean) : void
      {
         if(param2)
         {
            param1.select();
         }
         else
         {
            param1.unselect();
         }
      }
      
      override public function readIntParamsFromForm() : Array
      {
         var _loc1_:Array = [];
         _loc1_.push(getIntState(getStateInput(cont)));
         _loc1_.push(getIntState(getRotationInput(cont)));
         _loc1_.push(getIntState(getLocationInput(cont)));
         _loc1_.push(getIntState(getAltitudeInput(cont)));
         return _loc1_;
      }
      
      override protected function get legacyInputMode() : Boolean
      {
         return true;
      }
      
      private function getStateInput(param1:IWindowContainer) : class_3398
      {
         return class_3398(param1.findChildByName("include_state_checkbox"));
      }
      
      private function getRotationInput(param1:IWindowContainer) : class_3398
      {
         return class_3398(param1.findChildByName("include_rotation_checkbox"));
      }
      
      private function getLocationInput(param1:IWindowContainer) : class_3398
      {
         return class_3398(param1.findChildByName("include_location_checkbox"));
      }
      
      private function getAltitudeInput(param1:IWindowContainer) : class_3398
      {
         return class_3398(param1.findChildByName("include_altitude_checkbox"));
      }
      
      private function getIntState(param1:class_3398) : int
      {
         return !!param1.isSelected ? 1 : 0;
      }
   }
}
