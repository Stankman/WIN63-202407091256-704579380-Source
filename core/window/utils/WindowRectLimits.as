package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   
   public class WindowRectLimits implements IRectLimiter
   {
       
      
      private var _minWidth:int = -2147483648;
      
      private var _maxWidth:int = 2147483647;
      
      private var var_1984:int = -2147483648;
      
      private var var_1979:int = 2147483647;
      
      private var var_294:IWindow;
      
      public function WindowRectLimits(param1:IWindow)
      {
         super();
         var_294 = param1;
      }
      
      public function get minWidth() : int
      {
         return _minWidth;
      }
      
      public function get maxWidth() : int
      {
         return _maxWidth;
      }
      
      public function get minHeight() : int
      {
         return var_1984;
      }
      
      public function get maxHeight() : int
      {
         return var_1979;
      }
      
      public function set minWidth(param1:int) : void
      {
         _minWidth = param1;
         if(_minWidth > -2147483648 && !var_294.disposed && var_294.width < _minWidth)
         {
            var_294.width = _minWidth;
         }
      }
      
      public function set maxWidth(param1:int) : void
      {
         _maxWidth = param1;
         if(_maxWidth < 2147483647 && !var_294.disposed && var_294.width > _maxWidth)
         {
            var_294.width = _maxWidth;
         }
      }
      
      public function set minHeight(param1:int) : void
      {
         var_1984 = param1;
         if(var_1984 > -2147483648 && !var_294.disposed && var_294.height < var_1984)
         {
            var_294.height = var_1984;
         }
      }
      
      public function set maxHeight(param1:int) : void
      {
         var_1979 = param1;
         if(var_1979 < 2147483647 && !var_294.disposed && var_294.height > var_1979)
         {
            var_294.height = var_1979;
         }
      }
      
      public function get isEmpty() : Boolean
      {
         return _minWidth == -2147483648 && _maxWidth == 2147483647 && var_1984 == -2147483648 && var_1979 == 2147483647;
      }
      
      public function setEmpty() : void
      {
         _minWidth = -2147483648;
         _maxWidth = 2147483647;
         var_1984 = -2147483648;
         var_1979 = 2147483647;
      }
      
      public function limit() : void
      {
         if(!isEmpty && var_294)
         {
            if(var_294.width < _minWidth)
            {
               var_294.width = _minWidth;
            }
            else if(var_294.width > _maxWidth)
            {
               var_294.width = _maxWidth;
            }
            if(var_294.height < var_1984)
            {
               var_294.height = var_1984;
            }
            else if(var_294.height > var_1979)
            {
               var_294.height = var_1979;
            }
         }
      }
      
      public function assign(param1:int, param2:int, param3:int, param4:int) : void
      {
         _minWidth = param1;
         _maxWidth = param2;
         var_1984 = param3;
         var_1979 = param4;
         limit();
      }
      
      public function clone(param1:IWindow) : WindowRectLimits
      {
         var _loc2_:WindowRectLimits = new WindowRectLimits(param1);
         _loc2_._minWidth = _minWidth;
         _loc2_._maxWidth = _maxWidth;
         _loc2_.var_1984 = var_1984;
         _loc2_.var_1979 = var_1979;
         return _loc2_;
      }
   }
}
