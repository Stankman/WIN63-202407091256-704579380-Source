package com.sulake.habbo.ui.widget.enums
{
   public class AvatarExpressionEnum
   {
      
      public static const NONE:AvatarExpressionEnum = new AvatarExpressionEnum(0);
      
      public static const WAVE:AvatarExpressionEnum = new AvatarExpressionEnum(1);
      
      public static const BLOW:AvatarExpressionEnum = new AvatarExpressionEnum(2);
      
      public static const LAUGH:AvatarExpressionEnum = new AvatarExpressionEnum(3);
      
      public static const CRY:AvatarExpressionEnum = new AvatarExpressionEnum(4);
      
      public static const const_423:AvatarExpressionEnum = new AvatarExpressionEnum(5);
      
      public static const JUMP:AvatarExpressionEnum = new AvatarExpressionEnum(6);
      
      public static const RESPECT:AvatarExpressionEnum = new AvatarExpressionEnum(7);
       
      
      private var var_3773:int = 0;
      
      public function AvatarExpressionEnum(param1:int)
      {
         super();
         var_3773 = param1;
      }
      
      public function get ordinal() : int
      {
         return var_3773;
      }
      
      public function equals(param1:AvatarExpressionEnum) : Boolean
      {
         return param1 && param1.var_3773 == var_3773;
      }
   }
}
