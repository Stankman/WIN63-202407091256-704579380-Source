package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetShowWarningTextEvent;
   
   public class WarningCatalogWidget extends CatalogWidget implements class_3558
   {
       
      
      public function WarningCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      override public function init() : Boolean
      {
         if(!super.init())
         {
            return false;
         }
         _window.findChildByName("warning_text").caption = "";
         events.addEventListener("CWE_SHOW_WARNING_TEXT",onWarningText);
         return true;
      }
      
      private function onWarningText(param1:CatalogWidgetShowWarningTextEvent) : void
      {
         _window.findChildByName("warning_text").caption = param1.text;
      }
   }
}
