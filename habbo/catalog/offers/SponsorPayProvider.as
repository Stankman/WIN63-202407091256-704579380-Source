package com.sulake.habbo.catalog.offers
{
    import assets.class_14

    import flash.events.TimerEvent;
   import flash.external.ExternalInterface;
   import flash.utils.Timer;
   
   public class SponsorPayProvider implements IOfferProvider
   {
      
      private static const LOADED_CALLBACK:String = "sponsorPayLoaded";
      
      private static const ON_START_CALLBACK:String = "sponsorPayOnStart";
      
      private static const NO_OFFERS_CALLBACK:String = "sponsorPayNoOffers";
      
      private static const ON_CLOSE_CALLBACK:String = "sponsorPayOnClose";
      
      private static const ON_CONVERSION_CALLBACK:String = "sponsorPayOnConversion";
      
      private static const const_735:String = "SponsorPay.loadIntegration";
      
      private static const SHOW_VIDEO_FUNCTION:String = "SponsorPay.showVideo";
      
      private static const BACKGROUND_LOAD_FUNCTION:String = "SponsorPay.backgroundLoad";
      
      private static const const_695:int = 150000;
       
      
      private var _disposed:Boolean;
      
      private var _offerCenter:OfferCenter;
      
      private var _loaded:Boolean;
      
      private var var_408:Boolean;
      
      private var _showingPopup:Boolean;
      
      private var var_2235:Timer;
      
      public function SponsorPayProvider(param1:OfferCenter)
      {
         super();
         _offerCenter = param1;
         if(!enabled)
         {
            return;
         }
         ExternalInterface.addCallback("sponsorPayLoaded",sponsorPayLoaded);
         ExternalInterface.addCallback("sponsorPayOnStart",sponsorPayOnStart);
         ExternalInterface.addCallback("sponsorPayNoOffers",sponsorPayNoOffers);
         ExternalInterface.addCallback("sponsorPayOnClose",sponsorPayOnClose);
         ExternalInterface.addCallback("sponsorPayOnConversion",sponsorPayOnConversion);
         var_2235 = new Timer(150000,1);
         var_2235.addEventListener("timer",onResetTimer);
      }
      
      private function onResetTimer(param1:TimerEvent) : void
      {
         sponsorPayOnClose();
      }
      
      public function load() : void
      {
         if(_loaded)
         {
            sponsorPayLoaded();
            return;
         }
         if(enabled)
         {
            try
            {
               ExternalInterface.call("SponsorPay.loadIntegration",appId);
               _loaded = true;
            }
            catch(e:Error)
            {
               class_14.log("External interface not working. Could not call SponsorPay.loadIntegration: " + e);
            }
         }
      }
      
      private function get appId() : String
      {
         return _offerCenter.configuration.getProperty("offers.sponsorpay.appid");
      }
      
      public function showVideo() : void
      {
         if(_loaded && enabled)
         {
            try
            {
               ExternalInterface.call("SponsorPay.showVideo");
               _showingPopup = true;
               var_2235.reset();
               var_2235.start();
               updateVideoStatus();
            }
            catch(e:Error)
            {
               class_14.log("External interface not working. Could not call SponsorPay.showVideo: " + e);
            }
         }
      }
      
      public function sponsorPayLoaded() : void
      {
         if(_showingPopup)
         {
            return;
         }
         var_408 = false;
         try
         {
            if(ExternalInterface.available)
            {
               ExternalInterface.call("SponsorPay.backgroundLoad");
            }
            else
            {
               class_14.log("External interface not available. Could not call SponsorPay.backgroundLoad.");
            }
         }
         catch(e:Error)
         {
            class_14.log("External interface not working. Could not call SponsorPay.backgroundLoad: " + e);
         }
      }
      
      public function sponsorPayOnStart(param1:String) : void
      {
         var_408 = true;
         updateVideoStatus();
      }
      
      public function sponsorPayNoOffers() : void
      {
         var_408 = false;
         updateVideoStatus();
      }
      
      public function sponsorPayOnClose() : void
      {
         _showingPopup = false;
         if(var_2235)
         {
            var_2235.stop();
         }
         try
         {
            if(ExternalInterface.available)
            {
               ExternalInterface.call("SponsorPay.backgroundLoad");
            }
            else
            {
               class_14.log("External interface not available. Could not call SponsorPay.backgroundLoad.");
            }
         }
         catch(e:Error)
         {
            class_14.log("External interface not working. Could not call SponsorPay.backgroundLoad: " + e);
         }
         finally
         {
            updateVideoStatus();
         }
      }
      
      public function sponsorPayOnConversion() : void
      {
         if(_offerCenter != null)
         {
            _offerCenter.showSuccess();
         }
      }
      
      private function updateVideoStatus() : void
      {
         if(_offerCenter != null)
         {
            _offerCenter.updateVideoStatus();
         }
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         if(ExternalInterface.available)
         {
            ExternalInterface.addCallback("sponsorPayLoaded",null);
            ExternalInterface.addCallback("sponsorPayOnStart",null);
            ExternalInterface.addCallback("sponsorPayNoOffers",null);
            ExternalInterface.addCallback("sponsorPayOnClose",null);
            ExternalInterface.addCallback("sponsorPayOnConversion",null);
         }
         if(var_2235 != null)
         {
            var_2235.removeEventListener("timer",onResetTimer);
            var_2235.stop();
            var_2235 = null;
         }
         _offerCenter = null;
         _disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get videoAvailable() : Boolean
      {
         return var_408;
      }
      
      public function get showingPopup() : Boolean
      {
         return _showingPopup;
      }
      
      public function get enabled() : Boolean
      {
         return appId != "" && ExternalInterface.available;
      }
   }
}
