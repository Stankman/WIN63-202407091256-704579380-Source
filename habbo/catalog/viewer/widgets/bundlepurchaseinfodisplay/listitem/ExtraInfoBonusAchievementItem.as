package com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.listitem
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.ExtraInfoItemData;
   import com.sulake.habbo.catalog.viewer.widgets.bundlepurchaseinfodisplay.ExtraInfoListItem;
   
   public class ExtraInfoBonusAchievementItem extends ExtraInfoListItem
   {
       
      
      public function ExtraInfoBonusAchievementItem(param1:int, param2:ExtraInfoItemData)
      {
         super(null,param1,param2,0);
      }
      
      override public function getRenderedWindow() : IWindowContainer
      {
         return null;
      }
   }
}
