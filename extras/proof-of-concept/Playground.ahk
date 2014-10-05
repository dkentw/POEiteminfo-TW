IsEmptyString(String)
{
    If (StrLen(String) == 0)
    {
        return True
    }
    Else
    {
        String := RegExReplace(String, "[\r\n ]", "")
        If (StrLen(String) < 1)
        {
            return True
        }
    }
    return False
}


InStr := "`r`n  `r`n"
IsEmpty := IsEmptyString(InStr)
msgbox, IsEmpty: %IsEmpty%

Var := ""
If (Var)
    msgbox, Vars containing empty strings eval to True