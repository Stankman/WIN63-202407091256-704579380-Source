package com.sulake.habbo.catalog.purse
{
   import com.sulake.core.runtime.ICoreConfiguration;
   import com.sulake.core.utils.Map;
   
   public class class_3473
   {
      
      public static const DUCKET:int = 0;
      
      public static const const_1189:int = 3;
      
      public static const const_1039:int = 5;
      
      public static const SEASONAL_1:int = 101;
      
      public static const SEASONAL_2:int = 102;
      
      public static const SEASONAL_3:int = 103;
      
      public static const SEASONAL_4:int = 104;
      
      public static const SEASONAL_5:int = 105;
      
      public static const NO_OP_1:int = 1;
      
      public static const NO_OP_2:int = 2;
      
      public static const NO_OP_4:int = 4;
      
      public static const SILVER:int = 1000;
      
      private static const const_432:Map = createSeasonalCurrencyIconMap();
       
      
      public function class_3473()
      {
         super();
      }
      
      private static function createSeasonalCurrencyIconMap() : Map
      {
         var _loc1_:Map = new Map();
         _loc1_.add("snowflakes",[27,27]);
         _loc1_.add("horseshoes",[31,30]);
         _loc1_.add("nuts",[39,38]);
         _loc1_.add("stars",[45,44]);
         _loc1_.add("clouds",[46,47]);
         _loc1_.add("pumpkins",[49,50]);
         _loc1_.add("seashells",[55,55]);
         _loc1_.add("flowers",[59,58]);
         _loc1_.add("candy",[61,60]);
         _loc1_.add("popsicles",[63,62]);
         _loc1_.add("golden_fishes",[65,64]);
         return _loc1_;
      }
      
      public static function values() : Array
      {
         return [0,101,102,103,104,105,1,2,4];
      }
      
      public static function getIconStyleFor(param1:int, param2:ICoreConfiguration, param3:Boolean, param4:Boolean = false) : int
      {
         var _loc5_:String = null;
         var _loc6_:Array = null;
         if(param1 == -1)
         {
            return param3 ? 34 : 35;
         }
         if(param1 == 0)
         {
            return param3 ? 32 : 33;
         }
         if(param1 == 3)
         {
            return param3 ? 36 : 37;
         }
         if(param1 == 5)
         {
            if(param2.getBoolean("diamonds.enabled"))
            {
               return param3 ? 41 : 42;
            }
            return param3 ? 53 : 54;
         }
         if(param1 == 1000)
         {
            return param3 ? 56 : 57;
         }
         if(isSeasonal(param1))
         {
            _loc5_ = String(param2.getProperty("seasonalcurrency.id." + param1));
            if(const_432.hasKey(_loc5_))
            {
               _loc6_ = const_432.getValue(_loc5_);
               return param3 ? _loc6_[1] : _loc6_[0];
            }
         }
         var _loc7_:String = "currencyiconstyle." + (param3 ? "big" : "small") + "." + param1 + (param4 ? ".combo" : "");
         return param2.getInteger(_loc7_,0);
      }
      
      public static function isVisible(param1:int) : Boolean
      {
         if([1,2,4].indexOf(param1) != 1)
         {
            return false;
         }
         return true;
      }
      
      public static function isSeasonal(param1:int) : Boolean
      {
         return param1 >= 101 && param1 <= 105;
      }
   }
}
