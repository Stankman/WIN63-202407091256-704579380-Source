package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionPollEvent extends RoomSessionEvent
   {
      
      public static const OFFER:String = "RSPE_POLL_OFFER";
      
      public static const ERROR:String = "RSPE_POLL_ERROR";
      
      public static const CONTENT:String = "RSPE_POLL_CONTENT";
       
      
      private var var_280:int = -1;
      
      private var _headline:String;
      
      private var var_449:String;
      
      private var var_268:int = 0;
      
      private var _startMessage:String = "";
      
      private var _endMessage:String = "";
      
      private var _questionArray:Array = null;
      
      private var var_782:Boolean = false;
      
      public function RoomSessionPollEvent(param1:String, param2:IRoomSession, param3:int)
      {
         var_280 = param3;
         super(param1,param2);
      }
      
      public function get id() : int
      {
         return var_280;
      }
      
      public function get headline() : String
      {
         return _headline;
      }
      
      public function set headline(param1:String) : void
      {
         _headline = param1;
      }
      
      public function get summary() : String
      {
         return var_449;
      }
      
      public function set summary(param1:String) : void
      {
         var_449 = param1;
      }
      
      public function get numQuestions() : int
      {
         return var_268;
      }
      
      public function set numQuestions(param1:int) : void
      {
         var_268 = param1;
      }
      
      public function get startMessage() : String
      {
         return _startMessage;
      }
      
      public function set startMessage(param1:String) : void
      {
         _startMessage = param1;
      }
      
      public function get endMessage() : String
      {
         return _endMessage;
      }
      
      public function set endMessage(param1:String) : void
      {
         _endMessage = param1;
      }
      
      public function get questionArray() : Array
      {
         return _questionArray;
      }
      
      public function set questionArray(param1:Array) : void
      {
         _questionArray = param1;
      }
      
      public function get npsPoll() : Boolean
      {
         return var_782;
      }
      
      public function set npsPoll(param1:Boolean) : void
      {
         var_782 = param1;
      }
   }
}
