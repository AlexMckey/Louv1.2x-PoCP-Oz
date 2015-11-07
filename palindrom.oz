/*
  Palindrome
We can check if a string is a palindrome by checking two times this string (from the beginning to the end, and from the end to the beginning). However, we can also make this check by the mean of a data structure that allows us to remove the first and the last elements to compare them. You will have to write such a data structure to implement the palindrome function, with the help of the algorithm given below.

In this exercise, you are asked to implement the Sequence class and to write the Palindrome function. Here is the methods of the Sequence class:
        - init (initialization of the sequence)
        - isEmpty($) (checks if the sequence is empty)
        - first($) (returns the first element)
        - last($) (returns the last element)
        - insertFirst(X) (inserts X at the start of the sequence)
        - insertLast(X) (inserts X at the end of the sequence)
        - removeFirst (removes the first element of the sequence)
        - removeLast (removes the last element of the sequence)

When the class sequence is implemented, you have to implement the Palindrome function. The Palindrome function takes a list Xs as input and returns true if and only if Xs is a palindrome. Here is the structure and the algorithm described in the comments:
       fun {Palindrome Xs}
           S={New Sequence init}
           fun {Check}
               % If S is empty then Xs is a palindrome.
               % Otherwise, we compare the first and the last element of S
                       % If there are equals, remove them and continue.
                       % Otherwise, Xs is not a palindrome.
           end
       in
           % Insert all elements of Xs in S (in order)
           {Check}
       end

You have to provide the complete Palindrome function, not only the body. Furthermore, the signature of the Palindrome function must be:
        fun {Palindrome Xs}
If you do not write the signature exactly like this (even the spaces!), an error may be raised.
*/

declare
class Sequence
   attr l

   meth init
      l := nil
   end

   meth isEmpty($)
      @l == nil
   end
   
   meth first($)
      @l.1
   end

   meth last($)
      {Nth @l {Length @l}}
   end

   meth insertFirst(X)
      l := X|@l
   end

   meth insertLast(X)
      local L Len in
	 Len = {Length @l}
         L = @l
         l := X|nil
         for I in Len..1;~1 do
            l := {Nth L I}|@l
         end
      end
   end

   meth removeFirst
      l := @l.2
   end

   meth removeLast
      local L Len in
	 L = @l
	 Len = {Length @l}-1
         l := nil
         for I in Len..1;~1 do
            l := {Nth L I}|@l
         end
      end
   end
end

fun {Palindrome Xs}
   S = {New Sequence init}
   fun {Check}
      if {S isEmpty($)} then true
      else
         if {S first($)} == {S last($)} then
            {S removeFirst}
            {S removeLast}
            {Check}
         else false end
      end
   end
in
   for I in Xs do
      {S insertFirst(I)}
   end
   {Check}
end

{Browse {Palindrome ['s' 'd' 'a']}}
{Browse {Palindrome ['s' 'd' 'a' 'd' 's']}}
{Browse {Palindrome [1 2 3 3 2 1]}}
{Browse {Palindrome [1 2 3 2 1]}}
{Browse {Palindrome nil}}
{Browse {Palindrome ['s']}} 