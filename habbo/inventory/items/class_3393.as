package com.sulake.habbo.inventory.items
{
   import com.sulake.habbo.room.IStuffData;
   
   public interface class_3393
   {
       
      
      function get id() : int;
      
      function get ref() : int;
      
      function get type() : int;
      
      function get stuffData() : IStuffData;
      
      function get extra() : Number;
      
      function get category() : int;
      
      function get recyclable() : Boolean;
      
      function get tradeable() : Boolean;
      
      function get groupable() : Boolean;
      
      function get sellable() : Boolean;
      
      function get locked() : Boolean;
      
      function set locked(param1:Boolean) : void;
      
      function get isWallItem() : Boolean;
   }
}
