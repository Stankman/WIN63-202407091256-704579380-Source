package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionNestBreedingSuccessEvent extends RoomSessionEvent
   {
      
      public static const NEST_BREEDING_SUCCESS:String = "RSPFUE_NEST_BREEDING_SUCCESS";
       
      
      private var var_545:int;
      
      private var var_393:int;
      
      public function RoomSessionNestBreedingSuccessEvent(param1:IRoomSession, param2:int, param3:int, param4:Boolean = false, param5:Boolean = false)
      {
         super("RSPFUE_NEST_BREEDING_SUCCESS",param1,param4,param5);
         var_393 = param2;
         var_545 = param3;
      }
      
      public function get rarityCategory() : int
      {
         return var_545;
      }
      
      public function get petId() : int
      {
         return var_393;
      }
   }
}
