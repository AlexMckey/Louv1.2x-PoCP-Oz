declare
fun {Shuffle L}
   local Arr Len RetList Rand in
      fun {Rand N}
	 {Number.abs ({OS.rand} mod N) } + 1
      end
      RetList = {NewCell nil}
      Len = {Length L}
      Arr = {NewArray 1 Len 0}
      for I in 1..Len do
         Arr.I:={Nth L I}
      end
      for J in Len..1;~1 do
         local RndI Temp in
            RndI =  {Rand J}
            Temp = Arr.RndI
            Arr.RndI := Arr.J
            Arr.J := Temp
         end
         RetList := Arr.J|@RetList
      end
      @RetList
   end
end

{Browse {Shuffle [1 2 3 4]}}
{Browse {Shuffle [1 4]}}