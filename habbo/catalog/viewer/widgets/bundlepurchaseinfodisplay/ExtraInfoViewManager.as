package com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.widgets.BundlePurchaseExtraInfoWidget;
   import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.listitem.ExtraInfoBonusAchievementItem;
   import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.listitem.ExtraInfoBonusBadgeItem;
   import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.listitem.ExtraInfoBundlesInfoItem;
   import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.listitem.ExtraInfoDiscountValueItem;
   import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.listitem.ExtraInfoPromoItem;
   
   public class ExtraInfoViewManager implements IDisposable, IUpdateReceiver
   {
      
      private static const SLIDE_ANIMATION_LENGTH:Number = 0.5;
      
      private static const MAX_ANIM_Y_OFFSET:int = 28;
       
      
      private var var_1629:BundlePurchaseExtraInfoWidget;
      
      private var _catalog:HabboCatalog;
      
      private var _items:Map;
      
      private var var_4325:int = 0;
      
      private var _disposed:Boolean = false;
      
      private var var_2566:Number = 0;
      
      public function ExtraInfoViewManager(param1:BundlePurchaseExtraInfoWidget, param2:HabboCatalog)
      {
         super();
         var_1629 = param1;
         _catalog = param2;
         _items = new Map();
         _catalog.registerUpdateReceiver(this,10);
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function set disposed(param1:Boolean) : void
      {
         _disposed = param1;
      }
      
      public function dispose() : void
      {
         if(!disposed)
         {
            _catalog.removeUpdateReceiver(this);
            var_1629 = null;
            _catalog = null;
            for each(var _loc1_ in _items)
            {
               _loc1_.dispose();
            }
            _items = null;
            disposed = true;
         }
      }
      
      public function clear() : void
      {
         while(var_1629.window.numChildren > 0)
         {
            var_1629.window.removeChildAt(0);
         }
         for each(var _loc1_ in _items)
         {
            _loc1_.dispose();
         }
         _items = new Map();
         render();
      }
      
      public function addItem(param1:ExtraInfoItemData) : int
      {
         var _loc2_:ExtraInfoListItem = null;
         var _loc3_:int = var_4325++;
         switch(param1.type)
         {
            case 0:
               _loc2_ = new ExtraInfoPromoItem(var_1629,_loc3_,param1,_catalog);
               break;
            case 1:
               _loc2_ = new ExtraInfoBundlesInfoItem(var_1629,_loc3_,param1,_catalog);
               break;
            case 2:
               _loc2_ = new ExtraInfoDiscountValueItem(_loc3_,param1,_catalog);
               break;
            case 3:
               _loc2_ = new ExtraInfoBonusBadgeItem(_loc3_,param1,_catalog);
               break;
            case 4:
               _loc2_ = new ExtraInfoBonusAchievementItem(_loc3_,param1);
         }
         _loc2_.creationSeconds = var_2566;
         _items.add(_loc3_,_loc2_);
         var _loc4_:IWindow;
         (_loc4_ = _loc2_.getRenderedWindow()).width = var_1629.window.width;
         var_1629.window.addChild(_loc4_);
         sortWindows();
         render();
         return _loc2_.id;
      }
      
      public function removeItem(param1:int) : void
      {
         var _loc2_:ExtraInfoListItem = getItem(param1);
         if(_loc2_)
         {
            _loc2_.removalSeconds = var_2566;
            if(_loc2_.alignment == 2)
            {
               reallyRemoveItem(_loc2_.id);
            }
            render();
         }
      }
      
      public function getItem(param1:int) : ExtraInfoListItem
      {
         return ExtraInfoListItem(_items.getValue(param1));
      }
      
      private function reallyRemoveItem(param1:int) : void
      {
         var _loc2_:ExtraInfoListItem = getItem(param1);
         var_1629.window.removeChild(_loc2_.getRenderedWindow());
         _items.remove(param1);
      }
      
      private function calculateBounce(param1:Number, param2:Boolean = false) : Number
      {
         if(param2)
         {
            return 1 - Math.abs(Math.cos((var_2566 - param1) / 0.5 * (3.141592653589793 / 2)));
         }
         return 1 - Math.abs(Math.sin((var_2566 - param1) / 0.5 * (3.141592653589793 / 2)));
      }
      
      private function render() : void
      {
         var _loc5_:IWindow = null;
         var _loc4_:Number = NaN;
         var _loc1_:int = 0;
         var _loc3_:int = int(var_1629.window.height);
         var _loc6_:Array = _items.getValues();
         for each(var _loc2_ in _loc6_)
         {
            _loc5_ = _loc2_.getRenderedWindow();
            _loc4_ = 0;
            if(var_2566 - 0.5 <= _loc2_.creationSeconds)
            {
               _loc4_ = calculateBounce(_loc2_.creationSeconds);
            }
            if(_loc2_.isItemRemoved)
            {
               _loc4_ = calculateBounce(_loc2_.removalSeconds,true);
               if(var_2566 > _loc2_.removalSeconds + 0.5)
               {
                  reallyRemoveItem(_loc2_.id);
                  break;
               }
            }
            if(_loc2_.alignment == 0)
            {
               _loc5_.y = _loc1_;
               _loc5_.y -= _loc4_ * Math.min(_loc5_.height,28);
               _loc1_ += _loc5_.height;
            }
            else if(_loc2_.alignment == 1)
            {
               _loc5_.y = _loc3_ - _loc5_.height;
               _loc5_.y += _loc4_ * Math.min(_loc5_.height,28);
               _loc3_ -= _loc5_.height;
            }
            else if(_loc2_.alignment == 2)
            {
               _loc5_.y = 0;
            }
         }
      }
      
      private function sortWindows() : void
      {
         var _loc2_:int = var_1629.window.numChildren - 1;
         for each(var _loc1_ in _items)
         {
            if(_loc1_.alwaysOnTop)
            {
               var_1629.window.setChildIndex(_loc1_.getRenderedWindow(),_loc2_);
            }
         }
      }
      
      private function get isAnimationInProgress() : Boolean
      {
         return true;
      }
      
      public function update(param1:uint) : void
      {
         var_2566 += param1 / 1000;
         if(isAnimationInProgress)
         {
            render();
         }
      }
   }
}
