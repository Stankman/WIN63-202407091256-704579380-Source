package com.sulake.habbo.roomevents.wired_setup.common.utils
{
   public class ChronoFieldMaskFilter
   {
       
      
      private var _name:String;
      
      private var var_1877:int;
      
      private var _amount:int;
      
      public function ChronoFieldMaskFilter(param1:String, param2:int, param3:int)
      {
         super();
         _name = param1;
         var_1877 = param2;
         _amount = param3;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get mask() : int
      {
         return var_1877;
      }
      
      public function get amount() : int
      {
         return _amount;
      }
   }
}
