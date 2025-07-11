package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetBuilderSubscriptionUpdatedEvent;
   import com.sulake.habbo.utils.HabboWebTools;
   
   public class BuilderSubscriptionCatalogWidget extends CatalogWidget implements class_3558, IDisposable
   {
       
      
      private var _catalog:HabboCatalog;
      
      private var var_3662:String;
      
      public function BuilderSubscriptionCatalogWidget(param1:IWindowContainer, param2:HabboCatalog)
      {
         super(param1);
         _catalog = param2;
      }
      
      override public function init() : Boolean
      {
         if(!super.init())
         {
            return false;
         }
         var_3662 = _catalog.getProperty("builders_club.buy_membership_page");
         updateSubscriptionInfo();
         _window.procedure = windowProcedure;
         events.addEventListener("CWE_BUILDER_SUBSCRIPTION_UPDATED",onBuilderSubscriptionUpdated);
         return true;
      }
      
      private function updateSubscriptionInfo() : void
      {
         var _loc4_:Number = _catalog.builderSecondsLeft;
         var _loc2_:IWindow = _window.findChildByName("subscribe_button");
         var _loc3_:IWindow = _window.findChildByName("subscribe_button_sms");
         var _loc1_:IWindow = _window.findChildByName("subscribe_button_big");
         var _loc5_:IWindow;
         if((_loc5_ = _window.findChildByName("try_button")) == null || _loc2_ == null || _loc1_ == null)
         {
            return;
         }
         if(_loc4_ > 0 || _catalog.getCatalogNavigator("BUILDERS_CLUB").getOptionalNodeByName(_catalog.getProperty("builders_club.try_page")) == null)
         {
            _loc1_.visible = true;
            _loc2_.visible = false;
            _loc5_.visible = false;
            _loc3_.visible = false;
         }
         else
         {
            _loc1_.visible = false;
            _loc2_.visible = false;
            _loc5_.visible = true;
            _loc3_.visible = false;
         }
         if(var_3662 != null && var_3662 != "")
         {
            _loc3_.visible = true;
            if(!_loc5_.visible)
            {
               _loc3_.x = _loc5_.x;
               _loc3_.y = _loc5_.y;
            }
            if(_loc1_.visible)
            {
               _loc1_.visible = false;
               _loc2_.visible = false;
            }
         }
      }
      
      private function onBuilderSubscriptionUpdated(param1:CatalogWidgetBuilderSubscriptionUpdatedEvent) : void
      {
         updateSubscriptionInfo();
      }
      
      private function windowProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != "WME_CLICK")
         {
            return;
         }
         switch(param2.name)
         {
            case "subscribe_button_big":
            case "subscribe_button":
               HabboWebTools.openWebPageAndMinimizeClient(_catalog.getProperty("web.shop.subscription.relativeUrl"));
               break;
            case "subscribe_button_sms":
               HabboWebTools.openWebPageAndMinimizeClient(var_3662);
               break;
            case "try_button":
               _catalog.openCatalogPage(_catalog.getProperty("builders_club.try_page"),"BUILDERS_CLUB");
         }
      }
   }
}
