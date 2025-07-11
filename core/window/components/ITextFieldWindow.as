package com.sulake.core.window.components
{
   public interface ITextFieldWindow extends ITextWindow, class_3403, IInteractiveWindow
   {
       
      
      function get editable() : Boolean;
      
      function set editable(param1:Boolean) : void;
      
      function get selectable() : Boolean;
      
      function set selectable(param1:Boolean) : void;
      
      function get displayAsPassword() : Boolean;
      
      function set displayAsPassword(param1:Boolean) : void;
      
      function get displayRaw() : Boolean;
      
      function set displayRaw(param1:Boolean) : void;
      
      function setSelection(param1:int, param2:int) : void;
      
      function get selectionBeginIndex() : int;
      
      function get selectionEndIndex() : int;
      
      function get restrict() : String;
      
      function set restrict(param1:String) : void;
      
      function requestChangeEvent() : void;
      
      function getWordAt(param1:int, param2:int) : String;
   }
}
