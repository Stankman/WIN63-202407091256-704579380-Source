package com.sulake.habbo.utils
{
   import com.sulake.habbo.utils.air.INativeApplicationProxy;
   import flash.system.Capabilities;
   
   public class class_497
   {
      
      public static const DEVICE_TYPE_PHONE:int = 0;
      
      public static const DEVICE_TYPE_TABLET:int = 1;
      
      public static const DEVICE_TYPE_DESKTOP:int = 2;
      
      public static const PLATFORM_DESKTOP:int = -1;
      
      public static const PLATFORM_ANDROID:int = 0;
      
      public static const PLATFORM_IOS:int = 1;
      
      private static const MAX_DYNAMIC_TEXTURE_DIMENSION_SD:int = 512;
      
      private static const MAX_DYNAMIC_TEXTURE_DIMENSION_HD:int = 2048;
      
      private static const ORIGINAL_DPI_IPHONE_RETINA:int = 326;
      
      private static const ORIGINAL_DPI_IPAD_RETINA:int = 264;
      
      private static var var_911:Number;
      
      private static var var_1611:Number;
      
      private static var var_321:int = -1;
      
      private static var var_119:int = -1;
      
      private static var var_644:Boolean;
      
      private static var var_1001:INativeApplicationProxy;
      
      public static var PHONE_SCALE_FACTOR:Number = 0.65;
       
      
      public function class_497()
      {
         super();
      }
      
      public static function init() : void
      {
         initOs();
         initScale();
         initDeviceType();
         initLowMem();
      }
      
      public static function set nativeApplicationProxy(param1:INativeApplicationProxy) : void
      {
         var_1001 = param1;
      }
      
      public static function get nativeApplicationProxy() : INativeApplicationProxy
      {
         return var_1001;
      }
      
      public static function get isDeviceHD() : Boolean
      {
         if(Math.max(Capabilities.screenResolutionX,Capabilities.screenResolutionY) < 1600)
         {
            return false;
         }
         return scale > 0.75;
      }
      
      public static function get isSmallScreenDevice() : Boolean
      {
         return !isDeviceHD || isPhone();
      }
      
      public static function get isWideScreenDevice() : Boolean
      {
         return false;
      }
      
      public static function get requiresWideMargins() : Boolean
      {
         return isiPhoneX;
      }
      
      public static function get isiPhoneX() : Boolean
      {
         return false;
      }
      
      public static function get isLowMemoryDevice() : Boolean
      {
         return var_644;
      }
      
      public static function smartScaleFactor() : int
      {
         return isDeviceHD ? 2 : 1;
      }
      
      public static function get scale() : Number
      {
         return var_911;
      }
      
      public static function evenScale(param1:int) : int
      {
         param1 *= scale;
         return (param1 | 1) - 1;
      }
      
      public static function get maxDynamicTextureDimension() : int
      {
         return isLowMemoryDevice ? 512 : 2048;
      }
      
      public static function isAndroid() : Boolean
      {
         return platformId() == 0;
      }
      
      public static function isIos() : Boolean
      {
         return platformId() == 1;
      }
      
      public static function isDesktop() : Boolean
      {
         return platformId() == -1;
      }
      
      public static function isPhone() : Boolean
      {
         return var_321 == 0;
      }
      
      public static function platformId() : int
      {
         return var_119;
      }
      
      public static function platformString() : String
      {
         switch(var_119 - -1)
         {
            case 0:
               return "desktop";
            case 1:
               return "android";
            case 2:
               return "ios";
            default:
               return "unknown";
         }
      }
      
      public static function deviceType() : int
      {
         return var_321;
      }
      
      private static function initOs() : void
      {
         var _loc1_:String = Capabilities.version.toLowerCase();
         if(_loc1_.indexOf("and") > -1)
         {
            var_119 = 0;
            return;
         }
         if(_loc1_.indexOf("ios") > -1)
         {
            var_119 = 1;
            return;
         }
         var_119 = -1;
      }
      
      public static function initScale() : void
      {
      }
      
      private static function initDeviceType() : void
      {
         var _loc1_:String = Capabilities.version.toLowerCase();
         if(_loc1_.indexOf("win") > -1 || _loc1_.indexOf("mac") > -1 || _loc1_.indexOf("lnx") > -1)
         {
            var_321 = 2;
            return;
         }
         var_321 = 0;
      }
      
      private static function initLowMem() : void
      {
         var _loc1_:Array = null;
         var _loc2_:String = null;
         if(var_119 == 1)
         {
            _loc1_ = ["iPhone4,1","iPad2,1","iPad2,2","iPad2,3","iPad2,4","iPad2,5","iPad2,6","iPad2,7","iPod5,1"];
            _loc2_ = Capabilities.os;
            for each(var _loc3_ in _loc1_)
            {
               if(_loc2_.indexOf(_loc3_) != -1)
               {
                  var_644 = true;
                  return;
               }
            }
            var_644 = false;
         }
         else if(var_119 != 0)
         {
         }
      }
      
      private static function isLowMemProfile(param1:String) : Boolean
      {
         var _loc2_:Array = ["baseline","baselineConstrained"];
         return _loc2_.indexOf(param1) != -1;
      }
      
      public static function isIOSSimulator() : Boolean
      {
         return isIos() && Capabilities.os.indexOf("x86") != -1;
      }
      
      public static function getDeviceStringForLogging() : String
      {
         var _loc1_:String = null;
         if(isAndroid())
         {
            _loc1_ += "ANDROID";
         }
         else if(isIos())
         {
            _loc1_ += "IOS";
         }
         else
         {
            _loc1_ += "FLASH";
         }
         _loc1_ += ".";
         if(isDesktop())
         {
            _loc1_ += "UNKNOWN";
         }
         else if(isPhone())
         {
            _loc1_ += "PHONE";
         }
         else
         {
            _loc1_ += "TABLET";
         }
         return _loc1_;
      }
   }
}
