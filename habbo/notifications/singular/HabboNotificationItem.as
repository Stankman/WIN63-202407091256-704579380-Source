package com.sulake.habbo.notifications.singular
{
   public class HabboNotificationItem
   {
       
      
      private var _style:HabboNotificationItemStyle;
      
      private var _content:String;
      
      private var var_319:SingularNotificationController;
      
      public function HabboNotificationItem(param1:String, param2:HabboNotificationItemStyle, param3:SingularNotificationController)
      {
         super();
         _content = param1;
         _style = param2;
         var_319 = param3;
      }
      
      public function get style() : HabboNotificationItemStyle
      {
         return _style;
      }
      
      public function get content() : String
      {
         return _content;
      }
      
      public function dispose() : void
      {
         _content = null;
         if(_style != null)
         {
            _style.dispose();
            _style = null;
         }
         var_319 = null;
      }
      
      public function ExecuteUiLinks() : void
      {
         if(_style.internalLink)
         {
            var_319.onInternalLink(_style.internalLink);
         }
      }
   }
}
