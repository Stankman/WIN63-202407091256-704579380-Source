package com.sulake.core.window.services
{
   import flash.display.DisplayObject;
   
   public class WindowMouseDragger extends WindowMouseOperator implements IMouseDraggingService
   {
       
      
      public function WindowMouseDragger(param1:DisplayObject)
      {
         super(param1);
      }
      
      override public function operate(param1:int, param2:int) : void
      {
         _mouse.x = param1;
         _mouse.y = param2;
         getMousePositionRelativeTo(_window,_mouse,var_1893);
         _window.offset(var_1893.x - _offset.x,var_1893.y - _offset.y);
      }
   }
}
