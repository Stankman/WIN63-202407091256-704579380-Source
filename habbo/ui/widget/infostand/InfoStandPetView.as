package com.sulake.habbo.ui.widget.infostand
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.class_3420;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.components.class_3437;
   import com.sulake.core.window.components.IWidgetWindow;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.tracking.HabboTracking;
   import com.sulake.habbo.tracking.IHabboTracking;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetFurniActionMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetUserActionMessage;
   import com.sulake.habbo.window.widgets.IRarityItemPreviewOverlayWidget;
   import com.sulake.habbo.window.widgets.class_3570;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class InfoStandPetView
   {
      
      private static const STATUS_BAR_WIDTH:int = 162;
      
      private static const STATUS_BAR_HEIGTH:int = 16;
      
      private static const STATUS_BAR_HIGHLIGHT_HEIGHT:int = 4;
      
      private static const STATUS_BAR_BORDER_COLOR:uint = 14342874;
      
      private static const STATUS_BAR_BG_COLOR:uint = 3815994;
      
      private static const STATUS_BAR_HAPPINESS_HIGHLIGHT_COLOR:uint = 2085362;
      
      private static const STATUS_BAR_HAPPINESS_CONTENT_COLOR:uint = 39616;
      
      private static const STATUS_BAR_EXPERIENCE_HIGHLIGHT_COLOR:uint = 10513106;
      
      private static const STATUS_BAR_EXPERIENCE_CONTENT_COLOR:uint = 8734654;
      
      private static const STATUS_BAR_ENERGY_HIGHLIGHT_COLOR:uint = 9094430;
      
      private static const STATUS_BAR_ENERGY_CONTENT_COLOR:uint = 6200576;
      
      private static const STATUS_BAR_WELLBEING_HIGHLIGHT_COLOR:uint = 9094430;
      
      private static const STATUS_BAR_WELLBEING_CONTENT_COLOR:uint = 6200576;
      
      private static const STATE_HAPPINESS:String = "happiness";
      
      private static const STATE_EXPERIENCE:String = "experience";
      
      private static const STATE_ENERGY:String = "energy";
      
      private static const STATE_WELLBEING:String = "wellbeing";
      
      private static const STATE_GROWTH:String = "growth";
      
      private static const BUTTONS_MAX_WIDTH:int = 250;
      
      private static const BUTTON_HEIGHT:int = 25;
      
      private static const BUTTON_MARGIN:int = 5;
       
      
      private var _catalog:IHabboCatalog;
      
      private var _habboTracking:IHabboTracking;
      
      private var var_1629:InfoStandWidget;
      
      private var _window:IItemListWindow;
      
      private var var_1638:class_3437;
      
      private var _buttonsContainer:IWindowContainer;
      
      private var var_1693:IItemListWindow;
      
      private var var_1746:PetCommandTool;
      
      private var var_328:Map;
      
      private var var_2714:int;
      
      public function InfoStandPetView(param1:InfoStandWidget, param2:String, param3:IHabboCatalog)
      {
         super();
         var_1629 = param1;
         _catalog = param3;
         _habboTracking = HabboTracking.getInstance();
         createWindow(param2);
         var_328 = new Map();
      }
      
      public function dispose() : void
      {
         var_1629 = null;
         _catalog = null;
         _habboTracking = null;
         var_1638 = null;
         _buttonsContainer = null;
         var_1693 = null;
         if(_window)
         {
            _window.dispose();
         }
         _window = null;
         if(var_1746)
         {
            var_1746.dispose();
         }
         var_1746 = null;
         if(var_328)
         {
            var_328.dispose();
            var_328 = null;
         }
      }
      
      public function get window() : IItemListWindow
      {
         return _window;
      }
      
      private function updateWindow() : void
      {
         if(var_1693 == null || var_1638 == null || _buttonsContainer == null)
         {
            return;
         }
         _buttonsContainer.width = _buttonsContainer.width;
         _buttonsContainer.visible = _buttonsContainer.width > 0;
         var_1693.height = var_1693.scrollableRegion.height;
         var_1638.height = var_1693.height + 20;
         _window.width = Math.max(var_1638.width,_buttonsContainer.width);
         _window.height = _window.scrollableRegion.height;
         if(var_1638.width < _buttonsContainer.width)
         {
            var_1638.x = _window.width - var_1638.width;
            _buttonsContainer.x = 0;
         }
         else
         {
            _buttonsContainer.x = _window.width - _buttonsContainer.width;
            var_1638.x = 0;
         }
         var_1629.refreshContainer();
      }
      
      public function updateImage(param1:int, param2:BitmapData) : void
      {
         if(var_2714 == param1)
         {
            image = param2;
            updateWindow();
            updatePetCommandToolImage(param2);
         }
      }
      
      private function updatePetCommandToolImage(param1:BitmapData) : void
      {
         if(var_1746 != null)
         {
            var_1746.updatePetImage(param1);
         }
      }
      
      public function update(param1:InfoStandPetData) : void
      {
         var _loc3_:String = null;
         var _loc2_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc4_:Number = NaN;
         name = param1.name;
         image = param1.image;
         ownerName = param1.ownerName;
         breedText = var_1629.localizations.getLocalization(getBreedLocalizationKey(param1.type,param1.breedId));
         updatePetRespect(param1.petRespect,param1.type != 16);
         ageText = param1.age;
         setLevelText(param1.level,param1.levelMax,param1.type != 16);
         setSpecialSkillLevel(param1.level,param1.skillTresholds,param1.type);
         setRarityLevel(param1.rarityLevel,param1.type);
         if(param1.type == 16)
         {
            showStatusContainer("default",false);
            showStatusContainer("monsterplant",true);
            _loc3_ = class_3786.formatSeconds(param1.remainingWellBeingSeconds);
            updateStateElement("wellbeing",param1.remainingWellBeingSeconds,param1.maxWellBeingSeconds,6200576,9094430,_loc3_);
            updateStateWidget("growth",param1.remainingGrowingSeconds);
            showButton("petrespect",false);
            if(param1.energy > 0)
            {
               _loc2_ = param1.energy as Number;
               _loc5_ = param1.energyMax as Number;
               showButton("pettreat",_loc2_ / _loc5_ < 0.98);
            }
            else
            {
               showButton("pettreat",false);
            }
            showButton("train",false);
            showButton("buy_food",false);
            showButton("kick",false);
            showButton("pick",param1.canRemovePet);
            showRarityItem(param1.rarityLevel >= 0,param1);
         }
         else
         {
            showStatusContainer("default",true);
            showStatusContainer("monsterplant",false);
            showButton("petrespect",true);
            showButton("pettreat",false);
            showButton("train",param1.isOwnPet);
            showButton("pick",param1.isOwnPet);
            showButton("buy_food",true);
            showButton("kick",param1.canRemovePet);
            updateStateElement("happiness",param1.nutrition,param1.nutritionMax,39616,2085362);
            updateStateElement("experience",param1.experience,param1.experienceMax,8734654,10513106);
            updateStateElement("energy",param1.energy,param1.energyMax,6200576,9094430);
            updateRespectButton();
         }
         showButton("move",param1.isOwnPet && param1.type == 16);
         showButton("rotate",param1.isOwnPet && param1.type == 16);
         updateWindow();
         var_2714 = param1.id;
         var_328.remove(param1.id);
         var_328.add(param1.id,param1);
         if(var_1746 && var_1746.isVisible() && param1.isOwnPet)
         {
            _loc6_ = getLowerSkillTreshold(param1.level,param1.skillTresholds);
            _loc4_ = param1.experience / param1.experienceMax;
            var_1746.showCommandToolForPet(param1.id,param1.name,param1.image,param1.type,param1.level - _loc6_,_loc4_,getUpperSkillTreshold(param1.level,param1.skillTresholds) - _loc6_,param1.skillTresholds);
         }
      }
      
      private function setRarityLevel(param1:int, param2:int) : void
      {
         var _loc6_:Array = [16,26];
         var _loc5_:String = param2 != 16 ? "default" : "monsterplant";
         var _loc3_:IItemListWindow = getStatusContainer(_loc5_);
         var _loc4_:ITextWindow;
         if((_loc4_ = _loc3_.getListItemByName("status_rarity_level") as ITextWindow) == null)
         {
            return;
         }
         _loc4_.visible = _loc6_.indexOf(param2) > -1;
         var_1629.localizations.registerParameter("infostand.pet.text.raritylevel","level",var_1629.localizations.getLocalization("infostand.pet.raritylevel." + param1));
         updateWindow();
      }
      
      public function getCurrentPetId() : int
      {
         return var_2714;
      }
      
      public function updateEnabledTrainingCommands(param1:int, param2:CommandConfiguration) : void
      {
         if(var_1746 == null)
         {
            return;
         }
         var_1746.setEnabledCommands(param1,param2);
      }
      
      private function getBreedLocalizationKey(param1:int, param2:int) : String
      {
         return "pet.breed." + param1 + "." + param2;
      }
      
      private function createPercentageBar(param1:int, param2:int, param3:uint, param4:uint) : BitmapData
      {
         param2 = Math.max(param2,1);
         param1 = Math.max(param1,0);
         if(param1 > param2)
         {
            param1 = param2;
         }
         var _loc10_:Number = param1 / param2;
         var _loc9_:int = 1;
         var _loc7_:BitmapData;
         (_loc7_ = new BitmapData(162,16,false)).fillRect(new Rectangle(0,0,_loc7_.width,_loc7_.height),14342874);
         var _loc8_:Rectangle = new Rectangle(_loc9_,_loc9_,_loc7_.width - _loc9_ * 2,_loc7_.height - _loc9_ * 2);
         _loc7_.fillRect(_loc8_,3815994);
         var _loc6_:Rectangle;
         (_loc6_ = new Rectangle(_loc9_,_loc9_ + 4,_loc7_.width - _loc9_ * 2,_loc7_.height - _loc9_ * 2 - 4)).width = _loc10_ * _loc6_.width;
         _loc7_.fillRect(_loc6_,param3);
         var _loc5_:Rectangle;
         (_loc5_ = new Rectangle(_loc9_,_loc9_,_loc7_.width - _loc9_ * 2,4)).width = _loc10_ * _loc5_.width;
         _loc7_.fillRect(_loc5_,param4);
         return _loc7_;
      }
      
      public function openTrainView() : void
      {
         var _loc3_:int = 0;
         var _loc2_:Number = NaN;
         if(var_1746 == null)
         {
            var_1746 = new PetCommandTool(var_1629);
         }
         var _loc1_:InfoStandPetData = var_328.getValue(var_2714) as InfoStandPetData;
         if(_loc1_ != null)
         {
            var_1746.showWindow(true);
            _loc3_ = getLowerSkillTreshold(_loc1_.level,_loc1_.skillTresholds);
            _loc2_ = _loc1_.experience / _loc1_.experienceMax;
            var_1746.showCommandToolForPet(_loc1_.id,_loc1_.name,_loc1_.image,_loc1_.type,_loc1_.level - _loc3_,_loc2_,getUpperSkillTreshold(_loc1_.level,_loc1_.skillTresholds) - _loc3_,_loc1_.skillTresholds);
         }
      }
      
      public function closeTrainView() : void
      {
         if(var_1746 && var_1746.getPetId() == var_2714)
         {
            var_1746.showWindow(false);
         }
      }
      
      private function createWindow(param1:String) : void
      {
         var _loc22_:BitmapDataAsset = null;
         var _loc20_:BitmapData = null;
         var _loc14_:BitmapDataAsset = null;
         var _loc9_:BitmapData = null;
         var _loc2_:BitmapDataAsset = null;
         var _loc4_:BitmapData = null;
         var _loc11_:BitmapDataAsset = null;
         var _loc3_:BitmapData = null;
         var _loc10_:BitmapDataAsset = null;
         var _loc7_:BitmapData = null;
         var _loc8_:BitmapDataAsset = null;
         var _loc5_:BitmapData = null;
         var _loc18_:XmlAsset = var_1629.assets.getAssetByName("pet_view") as XmlAsset;
         _window = var_1629.windowManager.buildFromXML(_loc18_.content as XML) as IItemListWindow;
         if(_window == null)
         {
            throw new Error("Failed to construct window from XML!");
         }
         var_1638 = _window.getListItemByName("info_border") as class_3437;
         if(var_1638 != null)
         {
            var_1693 = var_1638.findChildByName("infostand_element_list") as IItemListWindow;
         }
         _window.name = param1;
         var_1629.mainContainer.addChild(_window);
         var _loc16_:IWindow;
         if((_loc16_ = var_1638.findChildByTag("close")) != null)
         {
            _loc16_.addEventListener("WME_CLICK",onClose);
         }
         _buttonsContainer = _window.getListItemByName("button_list") as IWindowContainer;
         if(_buttonsContainer == null)
         {
            return;
         }
         var _loc6_:Array = [];
         _buttonsContainer.groupChildrenWithTag("CMD_BUTTON",_loc6_,-1);
         for each(var _loc15_ in _loc6_)
         {
            _loc15_.addEventListener("WME_CLICK",onButtonClicked);
         }
         var _loc19_:IBitmapWrapperWindow;
         if((_loc19_ = var_1638.findChildByName("petrespect_icon") as IBitmapWrapperWindow) != null)
         {
            _loc20_ = (_loc22_ = var_1629.assets.getAssetByName("icon_petrespect") as BitmapDataAsset).content as BitmapData;
            _loc19_.bitmap = _loc20_.clone();
         }
         var _loc24_:IBitmapWrapperWindow;
         if((_loc24_ = var_1638.findChildByName("status_happiness_icon") as IBitmapWrapperWindow) != null)
         {
            _loc9_ = (_loc14_ = var_1629.assets.getAssetByName("icon_pet_happiness") as BitmapDataAsset).content as BitmapData;
            _loc24_.bitmap = _loc9_.clone();
         }
         var _loc17_:IBitmapWrapperWindow;
         if((_loc17_ = var_1638.findChildByName("status_experience_icon") as IBitmapWrapperWindow) != null)
         {
            _loc2_ = var_1629.assets.getAssetByName("icon_pet_experience") as BitmapDataAsset;
            _loc4_ = _loc2_.content as BitmapData;
            _loc17_.bitmap = _loc4_.clone();
         }
         var _loc21_:IBitmapWrapperWindow;
         if((_loc21_ = var_1638.findChildByName("status_energy_icon") as IBitmapWrapperWindow) != null)
         {
            _loc3_ = (_loc11_ = var_1629.assets.getAssetByName("icon_pet_energy") as BitmapDataAsset).content as BitmapData;
            _loc21_.bitmap = _loc3_.clone();
         }
         var _loc13_:IBitmapWrapperWindow;
         if((_loc13_ = var_1638.findChildByName("skill_level_indicator") as IBitmapWrapperWindow) != null)
         {
            _loc7_ = (_loc10_ = var_1629.assets.getAssetByName("pet_skill_level_0") as BitmapDataAsset).content as BitmapData;
            _loc13_.bitmap = _loc7_.clone();
         }
         var _loc12_:IBitmapWrapperWindow;
         if((_loc12_ = var_1638.findChildByName("status_wellbeing_icon") as IBitmapWrapperWindow) != null)
         {
            _loc5_ = (_loc8_ = var_1629.assets.getAssetByName("icon_pet_wellbeing") as BitmapDataAsset).content as BitmapData;
            _loc12_.bitmap = _loc5_.clone();
         }
         for each(var _loc23_ in _loc6_)
         {
            if(_loc23_.parent)
            {
               _loc23_.parent.width = _loc23_.width;
            }
            _loc23_.addEventListener("WE_RESIZED",onButtonResized);
         }
      }
      
      private function set name(param1:String) : void
      {
         if(var_1693 == null)
         {
            return;
         }
         var _loc2_:ITextWindow = var_1693.getListItemByName("name_text") as ITextWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.text = param1;
         _loc2_.visible = true;
      }
      
      private function set image(param1:BitmapData) : void
      {
         if(var_1693 == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         var _loc2_:IWindowContainer = var_1693.getListItemByName("image_container") as IWindowContainer;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc4_:IBitmapWrapperWindow;
         if((_loc4_ = _loc2_.findChildByName("avatar_image") as IBitmapWrapperWindow) == null)
         {
            return;
         }
         var _loc3_:BitmapData = new BitmapData(_loc4_.width,_loc4_.height,true,0);
         var _loc5_:Point;
         (_loc5_ = new Point(0,0)).x = Math.round((_loc4_.width - param1.width) / 2);
         _loc5_.y = Math.round((_loc4_.height - param1.height) / 2);
         _loc3_.copyPixels(param1,param1.rect,_loc5_);
         _loc4_.bitmap = _loc3_;
         _loc4_.invalidate();
         updateWindow();
      }
      
      private function setLevelText(param1:int, param2:int, param3:Boolean = true) : void
      {
         if(var_1693 == null)
         {
            return;
         }
         var _loc5_:IWindowContainer;
         if((_loc5_ = var_1693.getListItemByName("image_container") as IWindowContainer) == null)
         {
            return;
         }
         var _loc4_:ITextWindow;
         if((_loc4_ = _loc5_.findChildByName("level_text") as ITextWindow) == null)
         {
            return;
         }
         _loc4_.visible = param3;
         var_1629.localizations.registerParameter("pet.level","level",param1.toString());
         var_1629.localizations.registerParameter("pet.level","maxlevel",param2.toString());
         updateWindow();
      }
      
      private function setSpecialSkillLevel(param1:int, param2:Array, param3:int) : void
      {
         var _loc9_:int = 0;
         var _loc10_:BitmapDataAsset = null;
         var _loc6_:BitmapData = null;
         if(var_1693 == null)
         {
            return;
         }
         var _loc4_:IWindowContainer;
         if((_loc4_ = var_1693.getListItemByName("image_container") as IWindowContainer) == null)
         {
            return;
         }
         var _loc5_:IWindow;
         (_loc5_ = _loc4_.findChildByName("status_skill_text")).visible = var_1629.config.getBoolean("pet.enhancements.enabled") && param3 == 15;
         var _loc7_:ITextWindow;
         if((_loc7_ = _loc4_.findChildByName("status_skill_text") as ITextWindow) != null)
         {
            _loc7_.caption = "${infostand.pet.text.skill." + param3 + "}";
         }
         var _loc8_:IBitmapWrapperWindow;
         if((_loc8_ = _loc4_.findChildByName("skill_level_indicator") as IBitmapWrapperWindow) != null)
         {
            _loc8_.visible = var_1629.config.getBoolean("pet.enhancements.enabled") && param3 == 15;
            _loc9_ = getSkillLevelIndex(param1,param2);
            _loc6_ = (_loc10_ = var_1629.assets.getAssetByName("pet_skill_level_" + _loc9_) as BitmapDataAsset).content as BitmapData;
            _loc8_.bitmap = _loc6_.clone();
         }
         updateWindow();
      }
      
      private function set ownerName(param1:String) : void
      {
         var_1629.localizations.registerParameter("infostand.text.petowner","name",param1);
         updateWindow();
      }
      
      private function set breedText(param1:String) : void
      {
         if(var_1693 == null)
         {
            return;
         }
         var _loc2_:ITextWindow = var_1693.getListItemByName("breed_text") as ITextWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.text = param1;
         updateWindow();
      }
      
      private function set ageText(param1:int) : void
      {
         if(var_1693 == null)
         {
            return;
         }
         var _loc2_:ITextWindow = var_1693.getListItemByName("age_text") as ITextWindow;
         if(_loc2_ == null)
         {
            return;
         }
         var_1629.localizations.registerParameter("pet.age","age",param1.toString());
         updateWindow();
      }
      
      private function updatePetRespect(param1:int, param2:Boolean) : void
      {
         var_1629.localizations.registerParameter("infostand.text.petrespect","count",param1.toString());
         if(var_1693 == null)
         {
            return;
         }
         var _loc5_:IWindowContainer;
         var _loc3_:ITextWindow = (_loc5_ = var_1693.getListItemByName("petrespect_container") as IWindowContainer).findChildByName("petrespect_text") as ITextWindow;
         var _loc4_:IBitmapWrapperWindow = _loc5_.findChildByName("petrespect_icon") as IBitmapWrapperWindow;
         _loc3_.visible = param2;
         _loc4_.visible = param2;
         _loc4_.x = _loc3_.x + _loc3_.width + 2;
         updateWindow();
      }
      
      private function showStatusContainer(param1:String, param2:Boolean) : void
      {
         var _loc3_:IItemListWindow = getStatusContainer(param1);
         if(_loc3_ != null)
         {
            _loc3_.visible = param2;
         }
      }
      
      private function getStatusContainer(param1:String) : IItemListWindow
      {
         if(var_1693 == null)
         {
            return null;
         }
         var _loc2_:IWindowContainer = var_1693.getListItemByName("status_container") as IWindowContainer;
         if(_loc2_ == null)
         {
            return null;
         }
         return _loc2_.findChildByName("status_item_list_" + param1) as IItemListWindow;
      }
      
      private function updateStateWidget(param1:String, param2:int) : void
      {
         var _loc6_:* = false;
         var _loc9_:* = false;
         var _loc8_:ITextWindow = null;
         var _loc7_:IItemListWindow = null;
         if(var_1693 == null)
         {
            return;
         }
         var _loc3_:IWindowContainer = var_1693.getListItemByName("status_container") as IWindowContainer;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc5_:class_3420;
         var _loc4_:IWidgetWindow;
         if((_loc5_ = (_loc4_ = _loc3_.findChildByName(param1 + "_status_widget") as IWidgetWindow).widget) == null)
         {
            return;
         }
         var _loc10_:* = param1;
         if("growth" === _loc10_)
         {
            (_loc5_ as class_3570).seconds = param2;
            _loc6_ = param2 > 0;
            _loc9_ = _loc4_.visible != _loc6_;
            _loc4_.visible = _loc6_;
            if((_loc8_ = _loc3_.findChildByName(param1 + "_status_text") as ITextWindow) != null)
            {
               _loc8_.visible = _loc6_;
            }
            if(_loc9_)
            {
               if((_loc7_ = _loc3_.findChildByName("status_item_list_monsterplant") as IItemListWindow) != null)
               {
                  _loc7_.arrangeListItems();
               }
            }
         }
      }
      
      private function updateStateElement(param1:String, param2:int, param3:int, param4:uint, param5:uint, param6:String = null) : void
      {
         var _loc8_:BitmapData = null;
         if(var_1693 == null)
         {
            return;
         }
         var _loc7_:IWindowContainer;
         if((_loc7_ = var_1693.getListItemByName("status_container") as IWindowContainer) == null)
         {
            return;
         }
         var _loc10_:ITextWindow;
         if((_loc10_ = _loc7_.findChildByName("status_" + param1 + "_value_text") as ITextWindow) != null)
         {
            _loc10_.text = param6 != null ? param6 : param2 + "/" + param3;
         }
         var _loc9_:IBitmapWrapperWindow;
         if((_loc9_ = _loc7_.findChildByName("status_" + param1 + "_bitmap") as IBitmapWrapperWindow) != null)
         {
            if((_loc8_ = createPercentageBar(param2,param3,param4,param5)) != null)
            {
               _loc9_.bitmap = _loc8_;
               _loc9_.width = _loc8_.width;
               _loc9_.height = _loc8_.height;
               _loc9_.invalidate();
            }
         }
         updateWindow();
      }
      
      protected function onButtonClicked(param1:WindowMouseEvent) : void
      {
         var _loc5_:RoomWidgetMessage = null;
         var _loc6_:String = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc2_:IWindow = param1.target as IWindow;
         switch(_loc2_.name)
         {
            case "btn_move":
               _loc6_ = "RWFAM_MOVE";
               break;
            case "btn_rotate":
               _loc6_ = "RWFUAM_ROTATE";
               break;
            case "btn_pick":
               _loc6_ = "RWUAM_PICKUP_PET";
               if(var_1746 && var_1746.getPetId() == var_2714)
               {
                  var_1746.showWindow(false);
               }
               break;
            case "btn_kick":
               _loc6_ = "RWUAM_PICKUP_PET";
               if(var_1746 && var_1746.getPetId() == var_2714)
               {
                  var_1746.showWindow(false);
               }
               break;
            case "btn_train":
               openTrainView();
               break;
            case "btn_buy_food":
               if(_catalog)
               {
                  _catalog.openCatalogPage("pet_accessories");
                  if(_habboTracking && !_habboTracking.disposed)
                  {
                     _habboTracking.trackGoogle("infostandBuyPetFoodButton","click");
                  }
               }
               break;
            case "btn_petrespect":
               var_1629.userData.petRespectLeft -= 1;
               updateRespectButton();
               _loc6_ = " RWUAM_RESPECT_PET";
               break;
            case "btn_pettreat":
               _loc6_ = "RWUAM_TREAT_PET";
         }
         if(_loc6_ != null)
         {
            if(_loc6_ == "RWFAM_MOVE" || _loc6_ == "RWFUAM_ROTATE")
            {
               _loc4_ = var_1629.petData.roomIndex;
               _loc7_ = 100;
               _loc5_ = new RoomWidgetFurniActionMessage(_loc6_,_loc4_,_loc7_,-1,_loc3_);
               var_1629.messageListener.processWidgetMessage(_loc5_);
            }
            else
            {
               _loc8_ = var_1629.petData.id;
               _loc5_ = new RoomWidgetUserActionMessage(_loc6_,_loc8_);
               var_1629.messageListener.processWidgetMessage(_loc5_);
            }
         }
         updateWindow();
      }
      
      private function onClose(param1:WindowMouseEvent) : void
      {
         var_1629.close();
      }
      
      private function updateRespectButton() : void
      {
         var _loc1_:int = var_1629.userData.petRespectLeft;
         var_1629.localizations.registerParameter("infostand.button.petrespect","count",_loc1_.toString());
         showButton("petrespect",_loc1_ > 0);
      }
      
      protected function showButton(param1:String, param2:Boolean) : void
      {
         if(_buttonsContainer == null)
         {
            return;
         }
         var _loc3_:IWindow = _buttonsContainer.getChildByName(param1);
         if(_loc3_ != null)
         {
            _loc3_.visible = param2;
            arrangeButtons();
         }
      }
      
      protected function onButtonResized(param1:WindowEvent) : void
      {
         var _loc2_:IWindow = param1.window.parent;
         if(_loc2_ && _loc2_.tags.indexOf("CMD_BUTTON_REGION") > -1)
         {
            _loc2_.width = param1.window.width;
         }
      }
      
      private function arrangeButtons() : void
      {
         var _loc5_:int = 250;
         _buttonsContainer.width = _loc5_;
         var _loc2_:Array = [];
         _buttonsContainer.groupChildrenWithTag("CMD_BUTTON_REGION",_loc2_,-1);
         var _loc1_:* = _loc5_;
         var _loc3_:int = 0;
         for each(var _loc4_ in _loc2_)
         {
            if(_loc4_.visible)
            {
               if(_loc1_ - _loc4_.width < 0)
               {
                  _loc1_ = _loc5_;
                  _loc3_ += 25 + 5;
               }
               _loc4_.x = _loc1_ - _loc4_.width;
               _loc4_.y = _loc3_;
               _loc1_ = _loc4_.x - 5;
            }
         }
         _buttonsContainer.height = _loc3_ + 25;
         updateWindow();
      }
      
      private function getSkillLevelIndex(param1:int, param2:Array) : int
      {
         var _loc3_:int = 0;
         for each(var _loc4_ in param2)
         {
            if(_loc4_ > 0 && param1 >= _loc4_)
            {
               _loc3_++;
            }
         }
         return _loc3_;
      }
      
      private function getLowerSkillTreshold(param1:int, param2:Array) : int
      {
         var _loc3_:* = 0;
         for each(var _loc4_ in param2)
         {
            if(_loc4_ > param1)
            {
               break;
            }
            _loc3_ = _loc4_;
         }
         return _loc3_;
      }
      
      private function getUpperSkillTreshold(param1:int, param2:Array) : int
      {
         var _loc5_:int = getLowerSkillTreshold(param1,param2);
         var _loc4_:int = param2.indexOf(_loc5_);
         var _loc3_:* = _loc5_;
         if(_loc4_ < param2.length - 1)
         {
            _loc3_ = int(param2[_loc4_ + 1]);
         }
         return _loc3_;
      }
      
      private function showRarityItem(param1:Boolean, param2:InfoStandPetData) : void
      {
         if(var_1693 == null)
         {
            return;
         }
         var _loc3_:IWindowContainer = var_1693.getListItemByName("status_container") as IWindowContainer;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc6_:class_3420;
         var _loc4_:IWidgetWindow;
         if((_loc6_ = (_loc4_ = _loc3_.findChildByName("rarity_item_overlay_widget") as IWidgetWindow).widget) == null)
         {
            return;
         }
         var _loc5_:IRarityItemPreviewOverlayWidget;
         (_loc5_ = IRarityItemPreviewOverlayWidget(_loc6_)).rarityLevel = param2.rarityLevel;
      }
   }
}
