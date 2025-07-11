package com.sulake.habbo.ui.widget.crafting.controller
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.habbo.session.furniture.class_3365;
   import com.sulake.habbo.ui.widget.crafting.CraftingWidget;
   import com.sulake.habbo.ui.widget.crafting.renderer.CraftingRecipeItemRenderer;
   import com.sulake.habbo.ui.widget.crafting.utils.CraftingFurnitureItem;
   import com.sulake.habbo.communication.messages.parser.crafting.class_1640;
   
   public class CraftingRecipeListController extends CraftingGridControllerBase
   {
       
      
      private var var_3484:CraftingFurnitureItem;
      
      private var _items:Vector.<CraftingRecipeItemRenderer>;
      
      public function CraftingRecipeListController(param1:CraftingWidget)
      {
         super(param1);
         _items = new Vector.<CraftingRecipeItemRenderer>(0);
      }
      
      override public function dispose() : void
      {
         clearItems();
         var_3484 = null;
         super.dispose();
      }
      
      public function clearItems() : void
      {
         if(_items)
         {
            for each(var _loc1_ in _items)
            {
               _loc1_.dispose();
            }
            _items.length = 0;
         }
         if(container)
         {
            container.destroyGridItems();
         }
      }
      
      public function populateRecipeItems(param1:Vector.<CraftingFurnitureItem>) : void
      {
         var _loc4_:int = 0;
         var _loc3_:CraftingRecipeItemRenderer = null;
         if(!container)
         {
            return;
         }
         var _loc2_:IWindowContainer = getItemTemplate();
         container.removeGridItems();
         _loc4_ = 0;
         while(_loc4_ < param1.length)
         {
            _loc3_ = new CraftingRecipeItemRenderer(param1[_loc4_],_loc2_.clone() as IWindowContainer,var_1629);
            container.addGridItem(_loc3_.window);
            _items.push(_loc3_);
            _loc4_++;
         }
      }
      
      public function showRecipe(param1:CraftingFurnitureItem, param2:Vector.<class_1640>) : void
      {
         var _loc3_:int = 0;
         var _loc7_:Boolean = false;
         var _loc9_:class_3365 = null;
         var _loc4_:Array = null;
         var _loc8_:int = 0;
         var _loc11_:CraftingFurnitureItem = null;
         var_3484 = param1;
         if(!param2)
         {
            var_1629.setInfoState(7);
            return;
         }
         var_1629.mixerCtrl.clearItems();
         var _loc10_:Boolean = true;
         var _loc6_:Vector.<String> = new Vector.<String>(0);
         for each(var _loc5_ in param2)
         {
            _loc7_ = false;
            if(!(_loc9_ = var_1629.sessionDataManager.getFloorItemDataByName(_loc5_.furnitureClassName)))
            {
               _loc9_ = var_1629.sessionDataManager.getWallItemDataByName(_loc5_.furnitureClassName);
               _loc7_ = true;
               if(!_loc9_)
               {
                  return;
               }
            }
            if((_loc4_ = var_1629.handler.container.inventory.getNonRentedInventoryIds("furni",_loc9_.id,_loc7_)) == null || _loc4_.length < _loc5_.count)
            {
               _loc10_ = false;
            }
            _loc8_ = 0;
            while(_loc8_ < _loc5_.count)
            {
               _loc11_ = new CraftingFurnitureItem(null,null,_loc9_);
               if(_loc4_ && _loc4_.length)
               {
                  _loc3_ = _loc4_.shift();
               }
               else
               {
                  _loc3_ = 0;
                  if(_loc6_.indexOf(_loc9_.localizedName) == -1)
                  {
                     _loc6_.push(_loc9_.localizedName);
                  }
               }
               var_1629.mixerCtrl.addItemToMixer(_loc11_,_loc3_);
               _loc8_++;
            }
         }
         if(_loc10_)
         {
            var_1629.setInfoState(8,var_3484.furnitureData);
         }
         else
         {
            var_1629.setInfoState(7,var_3484.furnitureData,_loc6_);
         }
      }
      
      private function get container() : IItemGridWindow
      {
         return !!mainWindow ? mainWindow.findChildByName("itemgrid_products") as IItemGridWindow : null;
      }
   }
}
