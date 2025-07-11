package com.sulake.habbo.session.handler
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.habbo.session.IRoomHandlerListener;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.session.events.RoomSessionErrorMessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.class_1366;
   import com.sulake.habbo.communication.messages.incoming.handshake.class_485;
   
   public class GenericErrorHandler extends BaseHandler
   {
       
      
      public function GenericErrorHandler(param1:IConnection, param2:IRoomHandlerListener)
      {
         super(param1,param2);
         if(param1 == null)
         {
            return;
         }
         param1.addMessageEvent(new class_485(onGenericError));
      }
      
      private function onGenericError(param1:IMessageEvent) : void
      {
         var _loc4_:String = null;
         var _loc2_:class_1366 = (param1 as class_485).getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:IRoomSession = listener.getSession(var_1662);
         if(_loc3_ == null)
         {
            return;
         }
         switch(_loc2_.errorCode - 4008)
         {
            case 0:
               _loc4_ = "RSEME_KICKED";
               if(listener && listener.events)
               {
                  listener.events.dispatchEvent(new RoomSessionErrorMessageEvent(_loc4_,_loc3_));
               }
               return;
            default:
               return;
         }
      }
   }
}
