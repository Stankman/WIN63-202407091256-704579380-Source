package com.sulake.core.utils
{
   import com.sulake.core.class_79;
   import flash.system.System;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   
   public class class_1595
   {
      
      private static var var_271:uint = 300;
      
      private static var var_303:uint = 400;
      
      private static var var_180:uint = 60000;
      
      private static var var_92:Boolean = false;
       
      
      public function class_1595()
      {
         super();
      }
      
      public static function get softPurgeTriggerMegaBytes() : uint
      {
         return var_271;
      }
      
      public static function set softPurgeTriggerMegaBytes(param1:uint) : void
      {
         var_271 = param1;
      }
      
      public static function get hardPurgeTriggerMegaBytes() : uint
      {
         return var_303;
      }
      
      public static function set hardPurgeTriggerMegaBytes(param1:uint) : void
      {
         var_303 = Math.max(param1,var_271);
      }
      
      public static function get frequencyMilliSeconds() : uint
      {
         return var_180;
      }
      
      public static function set frequencyMilliSeconds(param1:uint) : void
      {
         var_180 = param1;
      }
      
      public static function get isRunning() : Boolean
      {
         return var_92;
      }
      
      protected static function get isMemoryDataAvailable() : Boolean
      {
         return class_1696.majorVersion > 10 || class_1696.majorVersion == 10 && class_1696.majorRevision >= 1;
      }
      
      public static function start() : void
      {
         if(!var_92)
         {
            if(!isMemoryDataAvailable)
            {
               var_180 *= 2;
               var_271 = 0;
               var_303 = 2147483647;
            }
            setTimeout(onInterval,var_180);
            var_92 = true;
         }
      }
      
      public static function stop() : void
      {
         if(var_92)
         {
            var_92 = false;
         }
      }
      
      public static function trigger() : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc1_:Object = System;
         var _loc4_:Number;
         if((_loc4_ = isMemoryDataAvailable ? (_loc1_.totalMemory - _loc1_.freeMemory) / 1024 / 1024 : softPurgeTriggerMegaBytes + 1) > softPurgeTriggerMegaBytes)
         {
            _loc2_ = getTimer();
            class_79.purge();
            _loc3_ = isMemoryDataAvailable ? (_loc1_.totalMemory - _loc1_.freeMemory) / 1024 / 1024 : 0;
            if(_loc3_ > var_303)
            {
               triggerGC();
            }
         }
      }
      
      public static function triggerGC() : void
      {
         System.pauseForGCIfCollectionImminent(0.25);
      }
      
      private static function onInterval() : void
      {
         if(var_92)
         {
            trigger();
            setTimeout(onInterval,var_180);
         }
      }
   }
}
