package com.sulake.core.window.tools
{
    import assets.profiler_dialog_xml$0fe01e3b14ed4333575762bbb449772b175443575
    import assets.profiler_task_xml$cb275a2c6f71fd972e2d86029684460e691636210

    import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IIDProfiler;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.runtime.IProfiler;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.ICore;
   import com.sulake.core.utils.Map;
   import com.sulake.core.utils.profiler.ProfilerAgentTask;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ILabelWindow;
   import com.sulake.core.window.components.class_3514;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.graphics.class_3354;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   
   public class ProfilerOutput implements class_3394
   {
      
      private static const ZERO_POINT:Point = new Point();
      
      private static var profiler_dialog_xml:Class = profiler_dialog_xml$0fe01e3b14ed4333575762bbb449772b175443575;
      
      private static var profiler_task_xml:Class = profiler_task_xml$cb275a2c6f71fd972e2d86029684460e691636210;
       
      
      private var _disposed:Boolean = false;
      
      private var _profilerComponent:IProfiler;
      
      private var _core:ICore;
      
      private var _window:class_3514;
      
      private var _windowItemArray:Array;
      
      private var _windowManager:ICoreWindowManager;
      
      private var _windowRenderer:class_3354;
      
      private var _memoryTracking:Boolean = false;
      
      private var _windowToTaskMap:Map;
      
      public function ProfilerOutput(param1:IContext, param2:ICoreWindowManager, param3:class_3354)
      {
         super();
         _core = param1 as ICore;
         _windowItemArray = [];
         _profilerComponent = profiler;
         _windowManager = param2;
         _windowRenderer = param3;
         _windowToTaskMap = new Map();
      }
      
      private static function padAlign(param1:String, param2:int, param3:String = " ", param4:Boolean = false) : String
      {
         var _loc6_:int = 0;
         var _loc5_:int;
         if((_loc5_ = param2 - param1.length) <= 0)
         {
            return param1.substring(0,param2);
         }
         var _loc7_:String = "";
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc7_ += param3;
            _loc6_++;
         }
         return param4 ? _loc7_ + param1 : param1 + _loc7_;
      }
      
      public function get caption() : String
      {
         return "Component Profiler";
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get visible() : Boolean
      {
         return _window && _window.visible;
      }
      
      public function set visible(param1:Boolean) : void
      {
         var bytes:ByteArray;
         var xml:XML;
         var value:Boolean = param1;
         if(!_window && value)
         {
            bytes = new profiler_dialog_xml() as ByteArray;
            xml = new XML(bytes.readUTFBytes(bytes.length));
            _window = _windowManager.buildFromXML(xml,2) as class_3514;
            _window.procedure = profilerWindowEventProc;
            _window.findChildByName("header").caption = padAlign("task",28) + "|" + padAlign("#rounds",8) + "|" + padAlign("latest ms",8) + "|" + padAlign("total ms",8) + "|";
            _window.findChildByName("footer").caption = "<- Click to enable bitmap memory tracking";
            ILabelWindow(_window.findChildByName("footer")).textColor = 4284900966;
         }
         if(_window)
         {
            if(value)
            {
               _window.activate();
               _core.setProfilerMode(true);
               _core.queueInterface(new IIDProfiler(),function(param1:IID, param2:IUnknown):void
               {
                  profiler = param2 as IProfiler;
               });
            }
            else
            {
               _core.setProfilerMode(false);
               _window.dispose();
               _window = null;
            }
         }
      }
      
      public function set profiler(param1:IProfiler) : void
      {
         if(_profilerComponent)
         {
            _profilerComponent.removeStopEventListener(refresh);
            _profilerComponent = null;
         }
         if(!_profilerComponent && param1)
         {
            _profilerComponent = param1;
            _profilerComponent.addStopEventListener(refresh);
         }
      }
      
      public function get profiler() : IProfiler
      {
         return _profilerComponent;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(_window)
            {
               _window.dispose();
               _window = null;
            }
            _profilerComponent.removeStopEventListener(refresh);
            _profilerComponent = null;
            _windowManager = null;
            _windowRenderer = null;
            _windowToTaskMap.dispose();
            _windowToTaskMap = null;
            _disposed = true;
         }
      }
      
      private function profilerWindowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == "WME_CLICK")
         {
            if(param2.tags.indexOf("close") > -1)
            {
               visible = false;
            }
            else if(param2.name == "button_gc")
            {
               _profilerComponent.gc();
            }
         }
         if(param2.name == "footer_enable_toggle")
         {
            if(param1.type == "WE_SELECTED")
            {
               _memoryTracking = true;
               ILabelWindow(_window.findChildByName("footer")).textColor = 4278190080;
            }
            else if(param1.type == "WE_UNSELECTED")
            {
               _memoryTracking = false;
               ILabelWindow(_window.findChildByName("footer")).textColor = 4284900966;
            }
         }
      }
      
      public function refresh(param1:Event) : void
      {
         if(!_window)
         {
            return;
         }
         _windowToTaskMap.reset();
         var _loc4_:Array = _profilerComponent.getProfilerAgentsInArray();
         var _loc3_:IItemListWindow = _window.findChildByName("list") as IItemListWindow;
         var _loc2_:uint = 0;
         while(_loc4_.length > 0)
         {
            _loc2_ = recursiveRedraw(_loc4_.pop(),_loc3_,_loc2_,0);
         }
         if(_memoryTracking)
         {
            _window.findChildByName("footer").caption = "Assets - Libraries: " + _profilerComponent.numAssetLibraryInstances + " " + "Bitmaps: " + _profilerComponent.numBitmapAssetInstances + " / " + _profilerComponent.numAllocatedBitmapDataBytes + " bytes \n" + "Tracked bitmap data: " + _profilerComponent.numTrackedBitmapDataInstances + " / " + _profilerComponent.numTrackedBitmapDataBytes + " bytes";
         }
      }
      
      private function recursiveRedraw(param1:ProfilerAgentTask, param2:IItemListWindow, param3:uint, param4:uint) : uint
      {
         var _loc5_:IWindowContainer = null;
         var _loc6_:IBitmapWrapperWindow = null;
         var _loc8_:* = 0;
         if(param3 >= param2.numListItems)
         {
            _loc5_ = createListItem(param2);
         }
         else
         {
            _loc5_ = param2.getListItemAt(param3) as IWindowContainer;
         }
         var _loc7_:String = param1.name;
         if(param4 > 0)
         {
            _loc7_ = padAlign(_loc7_,param4 + _loc7_.length,"-",true);
         }
         var _loc9_:IWindow;
         (_loc9_ = _loc5_.findChildByName("text") as IWindow).caption = padAlign(_loc7_,28," ",false) + "|" + padAlign(String(param1.rounds),8," ",true) + "|" + padAlign(String(param1.latest),8," ",true) + "|" + padAlign(String(param1.total),8," ",true) + "|\r";
         _loc5_.findChildByName("caption").caption = param1.caption;
         _loc5_.findChildByName("check").setStateFlag(8,!param1.paused);
         _windowToTaskMap.add(_loc5_,param1);
         if(!param1.paused)
         {
            _loc6_ = _loc5_.findChildByName("canvas") as IBitmapWrapperWindow;
            refreshBitmapImage(_loc6_,param1);
         }
         param3++;
         _loc8_ = 0;
         while(_loc8_ < param1.numSubTasks)
         {
            param3 = recursiveRedraw(param1.getSubTaskAt(_loc8_),param2,param3,param4 + 1);
            _loc8_++;
         }
         return param3;
      }
      
      private function refreshBitmapImage(param1:IBitmapWrapperWindow, param2:ProfilerAgentTask) : void
      {
         var _loc4_:BitmapData;
         if((_loc4_ = param1.bitmap) == null)
         {
            _loc4_ = new BitmapData(param1.width,param1.height,false,4294967295);
            param1.bitmap = _loc4_;
         }
         var _loc3_:Rectangle = _loc4_.rect;
         var _loc6_:int;
         var _loc5_:int = (_loc6_ = param2.latest) > _loc4_.height ? _loc4_.height : _loc6_;
         _loc3_.x += 1;
         _loc3_.width -= 1;
         _loc4_.copyPixels(_loc4_,_loc3_,ZERO_POINT);
         _loc3_.x += _loc3_.width - 2;
         _loc3_.y += _loc3_.height - _loc5_;
         _loc3_.width = 1;
         _loc3_.height = _loc5_;
         _loc4_.fillRect(_loc3_,_loc6_ > _loc4_.height ? 4294901760 : 4278190335);
         param1.invalidate();
      }
      
      private function createListItem(param1:IItemListWindow) : IWindowContainer
      {
         var _loc3_:ByteArray = null;
         _loc3_ = new profiler_task_xml() as ByteArray;
         var _loc4_:XML = new XML(_loc3_.readUTFBytes(_loc3_.length));
         var _loc2_:IWindowContainer = _windowManager.buildFromXML(_loc4_,2) as IWindowContainer;
         param1.addListItem(_loc2_);
         var _loc5_:IWindow;
         (_loc5_ = _loc2_.findChildByName("check")).addEventListener("WME_CLICK",onCheckMouseClick);
         return _loc2_;
      }
      
      private function onCheckMouseClick(param1:WindowEvent) : void
      {
         var _loc3_:IWindow = param1.window;
         var _loc2_:ProfilerAgentTask = _windowToTaskMap.getValue(_loc3_.parent);
         if(_loc2_)
         {
            _loc2_.paused = !_loc3_.getStateFlag(8);
         }
      }
   }
}
