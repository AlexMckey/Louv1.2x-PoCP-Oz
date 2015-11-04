declare Reverse
fun {Reverse L}
   local C in
      C = {NewCell nil}
      for E in L do
	 C := E | @C
      end
      @C
   end
end

{Browse {Reverse [1 2 3 4]}}