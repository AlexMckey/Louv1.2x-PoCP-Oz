declare
fun {NewStack} {NewCell nil} end
fun {IsEmpty S} @S==nil end
proc {Push S X} S:=X|@S end
fun {Pop S}
   local Out=@S.1 in
      S:=@S.2
      Out
   end
end


fun {Eval L}
  local Res in
    Res = {NewStack}
    for E in L do
      case E of
        '+' then {Push Res {Pop Res} + {Pop Res}}
      [] '*' then {Push Res {Pop Res} * {Pop Res}}
      [] '-' then {Push Res ~{Pop Res} + {Pop Res}}
      [] '/' then
        local X Y in
          X={Pop Res}
          Y={Pop Res}
          {Push Res Y div X}
        end
      else {Push Res E} end
    end
    {Pop Res}
  end
end

{Browse {Eval [2 3 '+' 4 '*' 10 '/']}}