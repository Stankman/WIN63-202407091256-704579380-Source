package com.sulake.habbo.window.widgets
{
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IWidgetWindow;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.iterators.EmptyIterator;
   import com.sulake.core.window.utils.IIterator;
   import com.sulake.habbo.window.HabboWindowManagerComponent;
   import com.sulake.habbo.window.utils.class_3723;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getTimer;
   
   public class LimitedItemGridOverlayWidget implements ILimitedItemGridOverlayWidget, IUpdateReceiver
   {
      
      public static const TYPE:String = "limited_item_overlay_grid";
       
      
      private const SHINE_INTERVAL_MS:uint = 10000;
      
      private const SHINE_LENGTH_MS:uint = 250;
      
      private var _disposed:Boolean = false;
      
      private var var_1759:IWidgetWindow;
      
      private var _windowManager:HabboWindowManagerComponent;
      
      private var var_509:IWindowContainer;
      
      private var var_3344:BitmapData;
      
      private var var_2549:IBitmapWrapperWindow;
      
      private var _serialNumber:int;
      
      private var var_2578:uint;
      
      private var var_3422:uint;
      
      private var var_3786:Boolean = false;
      
      public function LimitedItemGridOverlayWidget(param1:IWidgetWindow, param2:HabboWindowManagerComponent)
      {
         var_2578 = getTimer();
         var_3422 = var_2578;
         super();
         var_1759 = param1;
         _windowManager = param2;
         var_3344 = BitmapData(_windowManager.assets.getAssetByName("unique_item_label_plaque_metal").content).clone();
         var_509 = IWindowContainer(_windowManager.buildFromXML(XML(_windowManager.assets.getAssetByName("unique_item_overlay_griditem_xml").content)));
         var_2549 = IBitmapWrapperWindow(var_509.findChildByName("unique_item_overlay_plaque_background_bitmap"));
         var_2549.bitmap = var_3344;
         var_1759.rootWindow = var_509;
      }
      
      public function dispose() : void
      {
         if(!disposed)
         {
            if(var_3786)
            {
               _windowManager.removeUpdateReceiver(this);
            }
            if(var_1759 != null)
            {
               var_1759.rootWindow = null;
               var_1759 = null;
            }
            if(var_509 != null)
            {
               var_509.dispose();
               var_509 = null;
            }
            _windowManager = null;
            _disposed = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function set serialNumber(param1:int) : void
      {
         _serialNumber = param1;
         var _loc2_:IBitmapWrapperWindow = IBitmapWrapperWindow(var_509.findChildByName("unique_item_overlay_plaque_number_bitmap"));
         _loc2_.bitmap = class_3723.createBitmap(_windowManager.assets,serialNumber,_loc2_.width,_loc2_.height);
      }
      
      public function set seriesSize(param1:int) : void
      {
      }
      
      public function get serialNumber() : int
      {
         return _serialNumber;
      }
      
      public function get seriesSize() : int
      {
         return 0;
      }
      
      public function get properties() : Array
      {
         return [];
      }
      
      public function set properties(param1:Array) : void
      {
      }
      
      public function get iterator() : IIterator
      {
         return EmptyIterator.INSTANCE;
      }
      
      public function get animated() : Boolean
      {
         return var_3786;
      }
      
      public function set animated(param1:Boolean) : void
      {
         var_3786 = param1;
         if(var_3786)
         {
            _windowManager.registerUpdateReceiver(this,5);
         }
         else
         {
            _windowManager.removeUpdateReceiver(this);
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:BitmapData = null;
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         if(!disposed)
         {
            var_2578 += param1;
            if(var_2578 - var_3422 > 10000)
            {
               _loc2_ = new BitmapData(var_2549.width,var_2549.height,false);
               _loc3_ = (var_2578 - var_3422 - 10000) / 250;
               if(_loc3_ < 1)
               {
                  _loc4_ = (var_3344.height - var_2549.height) * _loc3_;
                  _loc2_.copyPixels(var_3344,new Rectangle(0,_loc4_,var_2549.width,var_2549.height),new Point(0,0));
                  var_2549.bitmap = _loc2_;
               }
               else
               {
                  var_2549.bitmap = var_3344;
                  var_3422 = var_2578;
               }
            }
         }
      }
   }
}
