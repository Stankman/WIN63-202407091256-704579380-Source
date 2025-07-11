package com.sulake.habbo.window.widgets
{
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
   import com.sulake.core.window.components.IWidgetWindow;
   import com.sulake.core.window.iterators.EmptyIterator;
   import com.sulake.core.window.utils.IIterator;
   import com.sulake.core.window.utils.PropertyStruct;
   import com.sulake.core.window.utils.class_3501;
   import com.sulake.habbo.window.HabboWindowManagerComponent;
   import com.sulake.habbo.window.enum.class_3719;
   import com.sulake.habbo.window.enum.class_3827;
   import flash.display.BitmapData;
   
   public class ProgressIndicatorWidget implements class_3528
   {
      
      public static const TYPE:String = "progress_indicator";
      
      private static const STYLE_KEY:String = "progress_indicator:style";
      
      private static const SIZE_KEY:String = "progress_indicator:size";
      
      private static const const_1148:String = "progress_indicator:position";
      
      private static const MODE_KEY:String = "progress_indicator:mode";
      
      private static const STYLE_DEFAULT:PropertyStruct = new PropertyStruct("progress_indicator:style","flat","String",false,class_3827.ALL);
      
      private static const SIZE_DEFAULT:PropertyStruct = new PropertyStruct("progress_indicator:size",1,"uint");
      
      private static const POSITION_DEFAULT:PropertyStruct = new PropertyStruct("progress_indicator:position",0,"uint");
      
      private static const MODE_DEFAULT:PropertyStruct = new PropertyStruct("progress_indicator:mode","position","String",false,class_3719.ALL);
      
      private static const MAXIMUM_SIZE:uint = 1000;
       
      
      private var _disposed:Boolean;
      
      private var var_1759:IWidgetWindow;
      
      private var _windowManager:HabboWindowManagerComponent;
      
      private var var_509:IItemListWindow;
      
      private var var_810:uint;
      
      private var _style:String;
      
      private var var_1263:String;
      
      public function ProgressIndicatorWidget(param1:IWidgetWindow, param2:HabboWindowManagerComponent)
      {
         var_810 = uint(POSITION_DEFAULT.value);
         _style = String(STYLE_DEFAULT.value);
         var_1263 = String(MODE_DEFAULT.value);
         super();
         var_1759 = param1;
         _windowManager = param2;
         var_509 = _windowManager.buildFromXML(_windowManager.assets.getAssetByName("progress_indicator_xml").content as XML) as IItemListWindow;
         var_1759.setParamFlag(147456);
         var_1759.rootWindow = var_509;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(var_509 != null)
            {
               var_509.dispose();
               var_509 = null;
            }
            if(var_1759 != null)
            {
               var_1759.rootWindow = null;
               var_1759 = null;
            }
            _windowManager = null;
            _disposed = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get iterator() : IIterator
      {
         return EmptyIterator.INSTANCE;
      }
      
      public function get properties() : Array
      {
         var _loc1_:Array = [];
         if(_disposed)
         {
            return _loc1_;
         }
         _loc1_.push(STYLE_DEFAULT.withValue(_style));
         _loc1_.push(SIZE_DEFAULT.withValue(size));
         _loc1_.push(POSITION_DEFAULT.withValue(var_810));
         _loc1_.push(MODE_DEFAULT.withValue(var_1263));
         return _loc1_;
      }
      
      public function set properties(param1:Array) : void
      {
         if(_disposed)
         {
            return;
         }
         for each(var _loc2_ in param1)
         {
            switch(_loc2_.key)
            {
               case "progress_indicator:style":
                  style = String(_loc2_.value);
                  break;
               case "progress_indicator:size":
                  size = uint(_loc2_.value);
                  break;
               case "progress_indicator:position":
                  position = uint(_loc2_.value);
                  break;
               case "progress_indicator:mode":
                  mode = String(_loc2_.value);
                  break;
            }
         }
      }
      
      public function get style() : String
      {
         return _style;
      }
      
      public function set style(param1:String) : void
      {
         _style = param1;
         refresh();
      }
      
      public function get size() : uint
      {
         return var_509.numListItems;
      }
      
      public function set size(param1:uint) : void
      {
         param1 = Math.min(Math.max(param1,1),1000);
         if(param1 != size)
         {
            while(param1 < size)
            {
               var_509.removeListItemAt(size - 1);
            }
            while(param1 > size)
            {
               var_509.addListItem(var_509.getListItemAt(0).clone());
            }
            refresh();
         }
      }
      
      public function get position() : uint
      {
         return var_810;
      }
      
      public function set position(param1:uint) : void
      {
         var_810 = param1;
         refresh();
      }
      
      public function get mode() : String
      {
         return var_1263;
      }
      
      public function set mode(param1:String) : void
      {
         var_1263 = param1;
         refresh();
      }
      
      private function refresh() : void
      {
         var _loc3_:int = 0;
         var _loc4_:IStaticBitmapWrapperWindow = null;
         var _loc2_:* = false;
         var _loc1_:BitmapData = null;
         _loc3_ = 0;
         while(_loc3_ < size)
         {
            _loc4_ = var_509.getListItemAt(_loc3_) as IStaticBitmapWrapperWindow;
            switch(var_1263)
            {
               case "position":
                  _loc2_ = _loc3_ + 1 == position;
                  break;
               case "progress":
                  _loc2_ = _loc3_ < position;
            }
            _loc4_.assetUri = "progress_disk_" + _style + (_loc2_ ? "_on" : "_off");
            _loc1_ = class_3501(_loc4_).bitmapData;
            _loc4_.width = _loc1_.width;
            _loc4_.height = _loc1_.height;
            var_509.height = _loc1_.height;
            _loc3_++;
         }
      }
   }
}
