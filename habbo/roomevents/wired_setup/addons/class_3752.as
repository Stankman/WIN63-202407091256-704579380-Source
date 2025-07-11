package com.sulake.habbo.roomevents.wired_setup.addons
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.class_1659;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   
   public class class_3752 extends DefaultAddonType
   {
       
      
      private var _cont:IWindowContainer;
      
      public function class_3752()
      {
         super();
      }
      
      override public function get code() : int
      {
         return class_3833.VARIABLE_TEXT_CONVERTER;
      }
      
      override public function onInit(param1:IWindowContainer, param2:IWindowContainer, param3:HabboUserDefinedRoomEvents) : void
      {
         super.onInit(param1,param2,param3);
         _cont = param1;
         textInput.addEventListener("WKE_KEY_DOWN",onTextChange);
         textInput.addEventListener("WKE_KEY_UP",onTextChange);
      }
      
      override public function onEditStart(param1:class_1659) : void
      {
         textInput.text = param1.stringParam.replace(/\n/g,"\r");
         onTextChange(null);
      }
      
      override public function readStringParamFromForm() : String
      {
         var _loc2_:String = String(textInput.text);
         return _loc2_.replace(/\n\r/g,"\n").replace(/\r/g,"\n");
      }
      
      override protected function get legacyInputMode() : Boolean
      {
         return true;
      }
      
      private function onTextChange(param1:WindowEvent) : void
      {
         textInputHint.visible = textInput.text.length == 0;
      }
      
      protected function get textInput() : ITextFieldWindow
      {
         return _cont.findChildByName("text_input") as ITextFieldWindow;
      }
      
      protected function get textInputHint() : ITextWindow
      {
         return _cont.findChildByName("text_input_hint") as ITextWindow;
      }
   }
}
