package com.sulake.habbo.navigator.mainview.tabpagedecorators
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.navigator.HabboNavigator;
   
   public class CategoriesTabPageDecorator implements ITabPageDecorator
   {
       
      
      private var _navigator:HabboNavigator;
      
      public function CategoriesTabPageDecorator(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
      }
      
      public function refreshCustomContent(param1:IWindowContainer) : void
      {
      }
      
      public function tabSelected() : void
      {
      }
      
      public function navigatorOpenedWhileInTab() : void
      {
         _navigator.mainViewCtrl.startSearch(6,21);
      }
      
      public function refreshFooter(param1:IWindowContainer) : void
      {
      }
      
      public function setSubSelection(param1:int) : void
      {
      }
      
      public function get filterCategory() : String
      {
         return null;
      }
      
      public function processSearchParam(param1:String) : String
      {
         return "";
      }
   }
}
