package com.sulake.core.window.graphics.renderer
{
   import com.sulake.core.window.IWindow;
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   
   public class FillSkinRenderer extends SkinRenderer
   {
       
      
      public function FillSkinRenderer(param1:String)
      {
         super(param1);
      }
      
      override public function draw(param1:IWindow, param2:BitmapData, param3:Rectangle, param4:uint, param5:Boolean) : void
      {
         param2.fillRect(param3,param1.color);
      }
   }
}
