package com.sulake.room.utils
{
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class class_3817
   {
       
      
      public function class_3817()
      {
         super();
      }
      
      public static function line(param1:BitmapData, param2:Point, param3:Point, param4:int) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc8_:int = 0;
         var _loc12_:int = 0;
         var _loc11_:int = 0;
         var _loc10_:int = 0;
         var _loc7_:int = param2.x;
         var _loc9_:int = param2.y;
         _loc5_ = param3.x - param2.x;
         _loc6_ = param3.y - param2.y;
         _loc12_ = _loc5_ > 0 ? 1 : -1;
         _loc11_ = _loc6_ > 0 ? 1 : -1;
         _loc5_ = Math.abs(_loc5_);
         _loc6_ = Math.abs(_loc6_);
         param1.lock();
         param1.setPixel32(_loc7_,_loc9_,param4);
         if(_loc5_ == 0 && _loc6_ == 0)
         {
            return;
         }
         if(_loc5_ > _loc6_)
         {
            _loc8_ = _loc5_ - 1;
            while(_loc8_ >= 0)
            {
               _loc10_ += _loc6_;
               _loc7_ += _loc12_;
               if(_loc10_ >= _loc5_ / 2)
               {
                  _loc10_ -= _loc5_;
                  _loc9_ += _loc11_;
               }
               param1.setPixel32(_loc7_,_loc9_,param4);
               _loc8_--;
            }
         }
         else
         {
            _loc8_ = _loc6_ - 1;
            while(_loc8_ >= 0)
            {
               _loc10_ += _loc5_;
               _loc9_ += _loc11_;
               if(_loc10_ >= _loc6_ / 2)
               {
                  _loc10_ -= _loc6_;
                  _loc7_ += _loc12_;
               }
               param1.setPixel32(_loc7_,_loc9_,param4);
               _loc8_--;
            }
         }
         param1.setPixel32(param3.x,param3.y,param4);
         param1.unlock();
      }
      
      public static function getFlipHBitmapData(param1:BitmapData) : BitmapData
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:BitmapData = null;
         _loc2_ = new BitmapData(param1.width,param1.height,true,16777215);
         var _loc3_:Matrix = new Matrix();
         _loc3_.scale(-1,1);
         _loc3_.translate(param1.width,0);
         _loc2_.draw(param1,_loc3_);
         return _loc2_;
      }
      
      public static function getFlipVBitmapData(param1:BitmapData) : BitmapData
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:BitmapData = null;
         _loc2_ = new BitmapData(param1.width,param1.height,true,16777215);
         var _loc3_:Matrix = new Matrix();
         _loc3_.scale(1,-1);
         _loc3_.translate(0,param1.height);
         _loc2_.draw(param1,_loc3_);
         return _loc2_;
      }
      
      public static function getFlipHVBitmapData(param1:BitmapData) : BitmapData
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:BitmapData = null;
         _loc2_ = new BitmapData(param1.width,param1.height,true,16777215);
         var _loc3_:Matrix = new Matrix();
         _loc3_.scale(-1,-1);
         _loc3_.translate(param1.width,param1.height);
         _loc2_.draw(param1,_loc3_);
         return _loc2_;
      }
   }
}
