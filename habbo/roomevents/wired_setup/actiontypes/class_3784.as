package com.sulake.habbo.roomevents.wired_setup.actiontypes
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IRadioButtonWindow;
   import com.sulake.core.window.components.ISelectorWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.class_1659;
   
   public class class_3784 extends class_3664
   {
      
      private static const STRING_PARAM_DELIMITER:String = "\t";
       
      
      public function class_3784()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3849.BOT_TALK_DIRECT_TO_AVTR;
      }
      
      override public function readStringParamFromForm() : String
      {
         var _loc1_:String = String(getInput(cont,"bot_name").text);
         var _loc2_:String = String(getInput(cont,"chat_message").text);
         return _loc1_ + "\t" + _loc2_;
      }
      
      override public function onEditStart(param1:class_1659) : void
      {
         var _loc2_:Array = param1.stringParam.split("\t");
         getInput(cont,"bot_name").text = _loc2_.length >= 1 ? _loc2_[0] : "";
         getInput(cont,"chat_message").text = _loc2_.length == 2 ? _loc2_[1] : "";
         getSelector(cont,"type_selector").setSelected(getRadio(cont,"radio_" + param1.intParams[0]));
      }
      
      override public function readIntParamsFromForm() : Array
      {
         return [getSelector(cont,"type_selector").getSelected().id];
      }
      
      override protected function get legacyInputMode() : Boolean
      {
         return true;
      }
      
      private function getInput(param1:IWindowContainer, param2:String) : ITextFieldWindow
      {
         return ITextFieldWindow(param1.findChildByName(param2));
      }
      
      private function getSelector(param1:IWindowContainer, param2:String) : ISelectorWindow
      {
         return ISelectorWindow(param1.findChildByName(param2));
      }
      
      private function getRadio(param1:IWindowContainer, param2:String) : IRadioButtonWindow
      {
         return IRadioButtonWindow(param1.findChildByName(param2));
      }
   }
}
