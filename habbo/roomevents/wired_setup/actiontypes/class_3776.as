package com.sulake.habbo.roomevents.wired_setup.actiontypes
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IRadioButtonWindow;
   import com.sulake.core.window.components.ISelectorWindow;
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.class_1659;
   
   public class class_3776 extends DefaultActionType
   {
       
      
      public function class_3776()
      {
         super();
      }
      
      private static function getTeamRadio(param1:IWindowContainer, param2:int) : IRadioButtonWindow
      {
         return IRadioButtonWindow(param1.findChildByName("team_" + param2 + "_radio"));
      }
      
      private static function getTeamSelector(param1:IWindowContainer) : ISelectorWindow
      {
         return ISelectorWindow(param1.findChildByName("team_selector"));
      }
      
      private static function getTypeRadio(param1:IWindowContainer, param2:int) : IRadioButtonWindow
      {
         return IRadioButtonWindow(param1.findChildByName("type_" + param2 + "_radio"));
      }
      
      private static function getTypeSelector(param1:IWindowContainer) : ISelectorWindow
      {
         return ISelectorWindow(param1.findChildByName("type_selector"));
      }
      
      override public function get code() : int
      {
         return class_3849.JOIN_TEAM;
      }
      
      override public function onEditStart(param1:class_1659) : void
      {
         var _loc2_:int = int(param1.intParams[0]);
         var _loc3_:int = int(param1.intParams[1]);
         getTeamSelector(cont).setSelected(getTeamRadio(cont,_loc2_));
         getTypeSelector(cont).setSelected(getTypeRadio(cont,_loc3_));
      }
      
      override public function readIntParamsFromForm() : Array
      {
         var _loc1_:Array = [];
         _loc1_.push(getTeamSelector(cont).getSelected().id);
         _loc1_.push(getTypeSelector(cont).getSelected().id);
         return _loc1_;
      }
      
      override protected function get legacyInputMode() : Boolean
      {
         return true;
      }
   }
}
