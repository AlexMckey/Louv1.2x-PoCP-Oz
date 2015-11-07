/*
   Collections
You are the programmer of a virtual library. In this virtual library, the user can put new books, get the last books from the library (and removes it), check if the library is empty and merge two libraries. In order to implement that, you will write a class named Collection.

A collection regroups values. In this exercise, you are asked to build a class named Collection. This class has to contain the following methods:
        - init (initializes the collection)
        - put(X) (inserts X in the collection)
        - get($) (removes the last element put in the collection and returns it)
        - isEmpty($) (returns true if the collection is empty and false otherwise)
        - union(C) (performs the union of the current collection and the collection C. This means that each element of C must be put at the beginning of the current collection. After the call, C is left empty and the current collection contains the union.)

For the union method, think about using put. You can use an object's method inside this object's other methods. In the future, you might need to call this method on another object of the same class (which can be done in the traditionnal way), but in this case (and in many other cases), you'll probably need to call the method on the object itself. To do so you can use the keyword self:

{self put(X)}

Hint: Think about using a cell containing a list, as attribute.
*/

declare
class Collection
   attr L
   meth init
      L := nil
   end
   meth isEmpty($)
      @L == nil
   end
   meth put(Book)
      L := Book|@L
   end
   meth get($)
      local Book in
	 Book = @L.1
	 L := @L.2
	 Book
      end
   end
   meth union(C)
      local Book in
	 if {C isEmpty($)} then skip
	 else
	    {C get(Book)}
	    {self put(Book)}
	    {self union(C)}
	 end
      end
   end
end

Ca={New Collection init}
Cb={New Collection init}
{Browse Collection.methods.init}

{Ca put(1)}
{Ca put(3)}
{Cb put(2)}
{Cb put(4)}
{Cb put(6)}
{Browse {Cb get($)}}
{Ca union(Cb)}
{Browse {Ca isEmpty($)}}
{Browse {Cb isEmpty($)}}