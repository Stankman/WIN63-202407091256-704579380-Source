package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.class_1657;
   
   public class RoomSessionPetPackageEvent extends RoomSessionEvent
   {
      
      public static const ROOM_SESSION_OPEN_PET_PACKAGE_REQUESTED:String = "RSOPPE_OPEN_PET_PACKAGE_REQUESTED";
      
      public static const ROOM_SESSION_OPEN_PET_PACKAGE_RESULT:String = "RSOPPE_OPEN_PET_PACKAGE_RESULT";
       
      
      private var var_455:int = -1;
      
      private var var_145:class_1657;
      
      private var _nameValidationStatus:int = 0;
      
      private var _nameValidationInfo:String = null;
      
      public function RoomSessionPetPackageEvent(param1:String, param2:IRoomSession, param3:int, param4:class_1657, param5:int, param6:String, param7:Boolean = false, param8:Boolean = false)
      {
         super(param1,param2,param7,param8);
         var_455 = param3;
         var_145 = param4;
         _nameValidationStatus = param5;
         _nameValidationInfo = param6;
      }
      
      public function get objectId() : int
      {
         return var_455;
      }
      
      public function get figureData() : class_1657
      {
         return var_145;
      }
      
      public function get nameValidationStatus() : int
      {
         return _nameValidationStatus;
      }
      
      public function get nameValidationInfo() : String
      {
         return _nameValidationInfo;
      }
   }
}
