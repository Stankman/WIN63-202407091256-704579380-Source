package com.sulake.habbo.catalog.marketplace
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.window.IHabboWindowManager;
   
   public interface IMarketPlace
   {
       
      
      function get windowManager() : IHabboWindowManager;
      
      function get localization() : IHabboLocalizationManager;
      
      function registerVisualization(param1:IMarketPlaceVisualization = null) : void;
      
      function onOffers(param1:IMessageEvent) : void;
      
      function onOwnOffers(param1:IMessageEvent) : void;
      
      function onBuyResult(param1:IMessageEvent) : void;
      
      function onCancelResult(param1:IMessageEvent) : void;
      
      function requestOffersByName(param1:String) : void;
      
      function requestOffersByPrice(param1:int) : void;
      
      function requestOffers(param1:int, param2:int, param3:String, param4:int) : void;
      
      function refreshOffers() : void;
      
      function requestOwnItems() : void;
      
      function requestItemStats(param1:int, param2:int) : void;
      
      function buyOffer(param1:int) : void;
      
      function redeemExpiredOffer(param1:int) : void;
      
      function latestOffers() : Map;
      
      function latestOwnOffers() : Map;
      
      function totalItemsFound() : int;
      
      function set itemStats(param1:class_3453) : void;
      
      function get itemStats() : class_3453;
      
      function get creditsWaiting() : int;
      
      function get averagePricePeriod() : int;
      
      function set averagePricePeriod(param1:int) : void;
      
      function getNameLocalizationKey(param1:IMarketPlaceOfferData) : String;
      
      function getDescriptionLocalizationKey(param1:IMarketPlaceOfferData) : String;
      
      function isAccountSafetyLocked() : Boolean;
   }
}
