package com.sulake.core.window.components
{
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.events.WindowEvent;
   import flash.geom.Rectangle;
   
   public class ActivatorController extends ContainerController
   {
       
      
      protected var var_2758:IWindow;
      
      public function ActivatorController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function = null, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
      }
      
      override public function update(param1:WindowController, param2:WindowEvent) : Boolean
      {
         if(param2.type == "WE_CHILD_ACTIVATED")
         {
            setActiveChild(param1 as IWindow);
         }
         else if(param2.type == "WE_PARENT_ACTIVATED")
         {
            return true;
         }
         return super.update(param1,param2);
      }
      
      public function getActiveChild() : IWindow
      {
         return var_2758;
      }
      
      public function setActiveChild(param1:IWindow) : IWindow
      {
         if(param1.parent != this)
         {
            do
            {
               param1 = param1.parent;
               if(param1 == null)
               {
                  throw new Error("Window passed to activator is not a child!");
               }
            }
            while(param1.parent != this);
            
         }
         var _loc2_:IWindow = var_2758;
         if(var_2758 != param1)
         {
            if(var_2758 != null)
            {
               if(!var_2758.disposed)
               {
                  var_2758.deactivate();
               }
            }
            var_2758 = param1;
            if(getChildIndex(param1) != numChildren - 1)
            {
               setChildIndex(param1,numChildren - 1);
            }
         }
         return _loc2_;
      }
   }
}
