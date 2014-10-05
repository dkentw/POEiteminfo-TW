;**************************************************************
;******* Function collection for AHK by Rubberduck ************
;**************************************************************
;******* sorted alphabetically ********************************

;**** Function Abs(In_Val)
;**** negative In_Values are returned positive -5 => 5 
Abs(In_Val)
{
   local Ret_Val
   Transform, Ret_Val, Abs, %In_Val%
   return Ret_Val  
}

;**** Function Asc(In_Val)
;**** Returns Ascii-Code of FIRST Char in In_Val
Asc(In_Val)
{
   local Ret_Val
   Transform, Ret_Val, Asc, %In_Val%
   return Ret_Val  
}

;**** Function Ceil(In_Val)
;**** Rounds In_Val "UP" to nearest Integer 3.14 => 4
Ceil(In_Val)
{
   local Ret_Val
   Transform, Ret_Val, Ceil, %In_Val%
   return Ret_Val  
}

;**** Function Chr(In_Val)
;**** Returns Char of In_Var(Ascii-Code 0..255)
Chr(In_Val)
{
   local Ret_Val
   Transform, Ret_Val, Chr, %In_Val%
   return Ret_Val  
}

;**** Function cos(In_Val)
;**** Returns the cosinus of In_Val
Cos(In_Val)
{
   local Ret_Val
   Transform, Ret_Val, Cos, %In_Val%
   return Ret_Val  
}

;**** Function DecToHex(In_Val)
;**** Returns a decimal as Hex with leading "0x"
;**** E.g. 255 => 0xFF |-255 => 0xFFFFFFFFFFFFFF01
;**** WARNING: NOT SURE IF I DID IT THE RIGHT WAY
DecToHex(In_Val) 
{ 
   local Ret_Val
   SetFormat, Integer, Hex
   if (In_Val>=0)
      Ret_Val :=In_Val*1 
   else
      Ret_Val :=In_Val+0xFFFFFFFFFFFFFFF+1  
   SetFormat, Integer, D
   return, Ret_Val 
}

;**** Function DegToRad(In_Deg)
;**** converts degrees to radians
DegToRad(In_Deg)
{
   return, In_Deg * 0.01745329252
}

;**** Function Div(In_Dividend,In_Divisor)
;**** Integer-Division: e.g. 200 div 45, 45 goes 4 times
;**** So the returned result is 4 (an Integer)
;**** (look in AHK's Helpfile "Transform")
Div(In_Dividend,In_Divisor)
{
   local Ret_Val
   Transform, Ret_Val, Floor, In_Dividend/In_Divisor
   return, Ret_Val
}

;**** Function Floor(In_Val)
;**** Rounds In_Val "DOWN" to nearest Integer 7.89 => 7
Floor(In_Val)
{
   local Ret_Val
   Transform, Ret_Val, Floor, %In_Val%
   return Ret_Val  
}

;**** Function GetRelPos(...parameters see below.....)
;**** In_X,In_Y = Position of the Startpoint
;**** In_Angle = Angle from In_X,In_Y to Targetpoint (0..360) 
;**** 0,360 are NORTH
;**** In_Radius = Distance from In_X,In_Y to Targetpoint
;**** Tx,Ty = Returns the Position of the Targetpoint
;**** Function was done by Laszlo because I am a Math-Idiot
GetRelPos(In_X,In_Y,In_Angle,In_Radius,Byref Tx, Byref Ty) 
{ 
   Transform SinVal, Sin, In_Angle*0.01745329252 
   Transform CosVal, Cos, In_Angle*0.01745329252 
   Tx := In_X - SinVal*In_Radius 
   Ty := In_Y + CosVal*In_Radius 
} 

;**** Function HTML(In_Val)
;**** Ä => Ä Translates Chars>127 to Html-Code
;**** (look in AHK's Helpfile "Transform")
HTML(In_Val)
{
   Transform, Ret_Val, HTML, %In_Val%
   return Ret_Val  
}

;**** Function LeapYear(In_Year)
;**** Checks if a year (format YYYY) is a leap year
;**** Returns 1 if yes, else 0, -1 if wrong format
LeapYear(In_Year)
{
  local len, t4, t100, t400
  StringLen, len, In_Year
  if (len<>4)
     return -1
  T4:=Mod(In_Year,4)
  T100:=Mod(In_Year,100)
  T400:=Mod(In_Year,400)
  if (T4=0) AND (((T100=0)and(T400=0)) or (T100<>0))
       return, 1
  else
       return 0
}

;**** Function Max(In_Val1,In_Val2)
;**** Returns the the bigger one of In_Val1 and In_Val2
;**** Thanks to Laszlo who this before me
Max(In_Val1,In_Val2) 
{ 
   IfLess In_Val1,%In_Val2%, Return In_Val2 
   Return In_Val1 
} 

;**** Function Min(In_Val1,In_Val2)
;**** Returns the the smaller one of In_Val1 and In_Val2
;**** Thanks to Laszlo who this before me
Min(In_Val1,In_Val2)  
{ 
   IfLess In_Val1,%In_Val2%, Return In_Val1 
   Return In_Val2 
} 

;**** Function Mod(In_Dividend,In_Divisor)
;**** Modulo-Division: eg. 200 mod 45, 45 goes 4 times
;**** in 200 because 45*4=180. The Modulo-Rest is 20
;**** (look in AHK's Helpfile "Transform")
Mod(In_Dividend,In_Divisor)
{
   Transform, Ret_Val, Mod, %In_Dividend%, %In_Divisor%
   return Ret_Val  
}

;**** Function Pow(In_Val1,In_Val2)
;**** eg. 2^4 = 16 (look in AHK's Helpfile "Transform")
Pow(In_Val1,In_Val2)
{
   Transform, Ret_Val, Pow, %In_Val1%, %In_Val2%
   return Ret_Val  
}

;**** Function RadToDeg(In_Rad)
;**** converts radians to degrees
RadToDeg(In_Rad)
{
   return, In_Rad * 57.29578
}

;**** Function RGBtoHex(R,G,B)
;**** R,G and B are decimals. Returned is a hex e.g. 0xFFACBC 
RGBtoHex(R,G,B) 
{ 
   local Ret_Val
   SetFormat, Integer, Hex
   Ret_Val := (R << 16) | (G << 8) | B 
   SetFormat, Integer, D
   return, Ret_Val 
}



;**** Function Round(In_Val)
;**** Returns In_Val rounded to In_Digits digits
;**** (look in AHK's Helpfile "Transform")
Round(In_Val,In_Digits)
{
   Transform, Ret_Val, Round, %In_Val%, %In_Digits%
   return Ret_Val  
}

;**** Function Sin(In_Val)
;**** Returns the sinus of In_Val
Sin(In_Val)
{
   Transform, Ret_Val, Sin, %In_Val%
   return Ret_Val  
}

;**** Function StringDelete(In_String,In_Start,In_Count)
;**** Deletes In_Count character within In_String starting
;**** at Position In_Start (inclusive)
StringDelete(In_String,In_Start,In_Count)
{
  If (In_Start<0)or(In_Count=0)
    return %In_String%
  loop, %In_Count%
     StringReplaceChar(In_String,In_Start,"")
  return, %In_String% 
}

;**** Function StringFlip(In_String). Returns a flipped
;**** In_String. ABCDEFG results in returning GFEDCBA
StringFlip(In_String)
{
   local Ret_Val, Length, Ch
   Ret_Val =
   StringLen, Length, In_String
   loop, %Length%
   {
      Ch:=StringGetChar(In_String,A_Index,L)
      Ret_Val=%Ret_Val%%Ch%
   }
   return, %Ret_Val%
}

;**** Function StringGetChar(In_String,In_Posi,Param3)
;**** Returns the Character at Position In_Posi from 
;**** In_String. If Param3=R In_Posi is from right side
;**** of string. If In_Posi is bigger than length of 
;**** In_String an empty Result is returned
StringGetChar(In_String,In_Posi,Param3)
{
  local Length, Ret_Val
  Ret_Val = 
  StringLen, Length, In_String
  if (In_Posi>Length)or(length=0)or(In_Posi<1)
     return Ret_Val
  If (Param3=R)
     StringMid,Ret_Val,In_String,Length+1-In_Posi,1 
  else        
     StringMid,Ret_Val,In_String,In_Posi,1 
  return, %Ret_Val%   
}

;**** StringInsert(In_String,In_Posi,In_Insert) 
;**** Is inserting In_Insert at position In_Posi
StringInsert(In_String,In_Posi,In_Insert)
{
  local Length, Before, After, Ret_Val
  StringLen, Length, In_String
  if (In_Posi>Length)or(length=0)or(In_Posi<0)or(In_Insert=)
     return, %In_String% 
  StringLeft, Before, In_String, In_Posi
  StringRight, After, In_String, Length-In_Posi
  Ret_Val=%Before%%In_Insert%%After%   
  return, %Ret_Val% 
}

;**** StringReplaceChar(ByRef In_String,In_Posi,New_Char)
;**** Replaces an character at position In_Posi within
;**** In_String with New_Char. If New_Char is a String
;**** ONLY the first character in New_Char is used
;**** If New_Char is empty the character at In_Posi
;**** is deleted from In_String
StringReplaceChar(ByRef In_String,In_Posi,New_Char)
{
  local Length, Before, After, Rep_Char
  StringLen, Length, In_String
  if (In_Posi>Length)or(length=0)or(In_Posi<0)
     return ;//nothing is done
  StringLeft, Rep_Char, New_Char, 1
  StringLeft, Before, In_String, In_Posi-1
  StringRight, After, In_String, Length-In_Posi
  In_String=%Before%%Rep_Char%%After%   
}

;**** Function Swap(Byref val1, ByRef Val2)
;**** Val1 becomes Val1 and Val2 becomes Val1
Swap_Values(Byref val1, ByRef Val2)
{
   local dummy
   dummy:=val1
   val1:=val2
   val2:=dummy
}

;**** Function Sqrt(In_Val) 
;**** Returns square root of In_Val
Sqrt(In_Val)
{
   Transform, Ret_Val, Sqrt, %In_Val%
   return Ret_Val  
}