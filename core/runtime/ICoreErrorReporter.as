package com.sulake.core.runtime
{
   [SecureSWF(rename="true")]
   public interface ICoreErrorReporter
   {
       
      
      function logError(param1:String, param2:Boolean, param3:int = -1, param4:Error = null) : void;
      
      function set errorLogger(param1:ICoreErrorLogger) : void;
   }
}
