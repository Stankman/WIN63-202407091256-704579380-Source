package com.sulake.core.window.components
{
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.theme.IThemeManager;
   import com.sulake.core.window.utils.PropertyStruct;
   import flash.geom.Rectangle;
   
   public class InteractiveController extends WindowController implements IInteractiveWindow
   {
       
      
      protected var var_2993:uint;
      
      protected var var_2184:String;
      
      protected var var_3651:Boolean;
      
      protected var var_3612:Boolean;
      
      private var var_2847:Map;
      
      public function InteractiveController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         param4 |= 1;
         var _loc12_:IThemeManager;
         var_2993 = int((_loc12_ = param5.getWindowFactory().getThemeManager()).getPropertyDefaults(param3).method_20("tool_tip_delay").value);
         var_2184 = String(_loc12_.getPropertyDefaults(param3).method_20("tool_tip_caption").value);
         var_3651 = _loc12_.getPropertyDefaults(param3).method_20("tool_tip_is_dynamic").value;
         var_3612 = _loc12_.getPropertyDefaults(param3).method_20("interactive_cursor_disabled").value;
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
      }
      
      public static function processInteractiveWindowEvents(param1:IInteractiveWindow, param2:WindowEvent) : void
      {
         if(param1.toolTipIsDynamic)
         {
            if(param2.type == "WME_OVER")
            {
               param1.context.getWindowServices().getToolTipAgentService().begin(param1);
            }
            else if(param2.type == "WME_MOVE")
            {
               param1.context.getWindowServices().getToolTipAgentService().updateCaption(param1);
            }
            else if(param2.type == "WME_OUT")
            {
               param1.context.getWindowServices().getToolTipAgentService().end(param1);
            }
         }
         else if(param1.toolTipCaption != null && param1.toolTipCaption.length > 0)
         {
            if(param2.type == "WME_OVER")
            {
               param1.context.getWindowServices().getToolTipAgentService().begin(param1);
            }
            else if(param2.type == "WME_OUT")
            {
               param1.context.getWindowServices().getToolTipAgentService().end(param1);
            }
         }
      }
      
      public static function readInteractiveWindowProperties(param1:IInteractiveWindow, param2:Array) : void
      {
         for each(var _loc3_ in param2)
         {
            switch(_loc3_.key)
            {
               case "tool_tip_caption":
                  if(_loc3_.value != param1.toolTipCaption)
                  {
                     param1.toolTipCaption = _loc3_.value as String;
                  }
                  break;
               case "tool_tip_delay":
                  if(_loc3_.value != param1.toolTipDelay)
                  {
                     param1.toolTipDelay = _loc3_.value as uint;
                  }
                  break;
               case "tool_tip_is_dynamic":
                  if(_loc3_.value != param1.toolTipIsDynamic)
                  {
                     param1.toolTipIsDynamic = _loc3_.value as Boolean;
                  }
                  break;
               case "interactive_cursor_disabled":
                  if(_loc3_.value != param1.interactiveCursorDisabled)
                  {
                     param1.interactiveCursorDisabled = _loc3_.value as Boolean;
                  }
                  break;
            }
         }
      }
      
      public static function writeInteractiveWindowProperties(param1:IInteractiveWindow, param2:Array) : Array
      {
         param2.push(param1.createProperty("tool_tip_caption",param1.toolTipCaption));
         param2.push(param1.createProperty("tool_tip_delay",param1.toolTipDelay));
         param2.push(param1.createProperty("tool_tip_is_dynamic",param1.toolTipIsDynamic));
         param2.push(param1.createProperty("interactive_cursor_disabled",param1.interactiveCursorDisabled));
         return param2;
      }
      
      public function set toolTipCaption(param1:String) : void
      {
         var_2184 = param1 == null ? String(getDefaultProperty("tool_tip_caption").value) : param1;
      }
      
      public function get toolTipCaption() : String
      {
         return var_2184;
      }
      
      public function set toolTipDelay(param1:uint) : void
      {
         var_2993 = param1;
      }
      
      public function get toolTipDelay() : uint
      {
         return var_2993;
      }
      
      public function setMouseCursorForState(param1:uint, param2:uint) : uint
      {
         if(testStateFlag(32))
         {
            return 1;
         }
         if(!var_2847)
         {
            var_2847 = new Map();
         }
         var _loc3_:uint = uint(var_2847[param1]);
         if(param2 == 0 || param2 == -1)
         {
            var_2847.remove(param1);
         }
         else
         {
            var_2847[param1] = param2;
         }
         return _loc3_;
      }
      
      public function getMouseCursorByState(param1:uint) : uint
      {
         if(!var_2847)
         {
            return 0;
         }
         return var_2847.getValue(param1);
      }
      
      override public function update(param1:WindowController, param2:WindowEvent) : Boolean
      {
         if(param1 == this)
         {
            processInteractiveWindowEvents(this,param2);
         }
         return super.update(param1,param2);
      }
      
      public function showToolTip(param1:IToolTipWindow) : void
      {
      }
      
      public function hideToolTip() : void
      {
      }
      
      override public function get properties() : Array
      {
         return writeInteractiveWindowProperties(this,super.properties);
      }
      
      override public function set properties(param1:Array) : void
      {
         readInteractiveWindowProperties(this,param1);
         super.properties = param1;
      }
      
      public function set toolTipIsDynamic(param1:Boolean) : void
      {
         var_3651 = param1;
      }
      
      public function get toolTipIsDynamic() : Boolean
      {
         return var_3651;
      }
      
      public function get interactiveCursorDisabled() : Boolean
      {
         return var_3612;
      }
      
      public function set interactiveCursorDisabled(param1:Boolean) : void
      {
         var_3612 = param1;
      }
   }
}
