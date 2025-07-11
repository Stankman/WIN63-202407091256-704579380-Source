package com.sulake.core.window.components
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.utils.IIterable;
   
   public interface ITabContextWindow extends IWindow, IIterable
   {
       
      
      function get selector() : ISelectorListWindow;
      
      function get container() : IWindowContainer;
      
      function get numTabItems() : uint;
      
      function addTabItem(param1:ITabButtonWindow) : ITabButtonWindow;
      
      function addTabItemAt(param1:ITabButtonWindow, param2:uint) : ITabButtonWindow;
      
      function removeTabItem(param1:ITabButtonWindow) : void;
      
      function getTabItemAt(param1:uint) : ITabButtonWindow;
      
      function getTabItemByName(param1:String) : ITabButtonWindow;
      
      function getTabItemByID(param1:uint) : ITabButtonWindow;
      
      function getTabItemIndex(param1:ITabButtonWindow) : uint;
   }
}
