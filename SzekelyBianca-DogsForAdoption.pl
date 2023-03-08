/*Five men are side by side at a pet store where there is an adoption event.
Each man is adopting a dog.
Figure out the names and the breeds of the dogs and the information about their owner.

1.The man adopting the Rottweiler is at the first position.
2.The Nurse is next to the one who likes Hiking.
3.The man who likes Jogging is at one of the ends.
4.The guy adopting the Dachshund is exactly to the right of the man wearing the Yellow shirt.
5.The one adopting Rex is at the fourth position.
6.The Waiter is somewhere between the man wearing the Black shirt and the Painter, in that order.
7.Rex is being adopted by Kevin.
8.The one who likes Reading is next to the one who is adopting the Dachshund.
9.Ryan is adopting the Poodle.
10.The man who likes Drawing is somewhere between the man who likes Cooking and the one who likes Reading, in that order.
11.The man adopting the Beagle is at one of the ends.
12.The guy adopting Spike is exactly to the left of the Waiter.
13.At the fourth position is the man who likes Hiking.
14.Bob is an Actor.
15.The one adopting Apollo is at the fifth position.
16.The man adopting the Chihuahua is next to the man adopting the Dachshund.
17.The guy wearing the Blue shirt is at the fourth position.
18.Hank is adopting Spike.
19.The man wearing the Red shirt is next to the man who is adopting the Dachshund.
20.The guy wearing the White shirt is somewhere between the one adopting Luke and the one who likes Jogging, in that order.
21.The Designer is wearing the White shirt.
 */
nextToLeft(A, B, Ls) :- append(_, [A,B|_], Ls).

nextTo(A,B, Ls):-append(_,[B,A|_], Ls).
nextTo(A,B, Ls):-append(_,[A,B|_], Ls).

atAnyEnd(A, Ls):- Ls=[A|_].
atAnyEnd(A, Ls):- Ls=[_,_,_,_,A].

somewhereLeft(A,B, Ls):- append(_, [A, B|_], Ls).
somewhereLeft(A,B, Ls):- append(_, [A,_, B|_], Ls).
somewhereLeft(A,B, Ls):- append(_, [A,_,_, B|_], Ls).
somewhereLeft(A,B, Ls):- append(_, [A,_,_,_, B|_], Ls).

somewhereBetween(A, B, C, Ls):- somewhereLeft(A, B, Ls), somewhereLeft(B,C, Ls).

dogs(Dogs):-
    %each dog in the group is represented as:
    %dog('Shirt','Name','Dog','Breed','Profession','Hobby')

    length(Dogs,5),
    %1
    Dogs=[dog(_,_,_,rottweiler,_,_),_,_,_,_],
    %2
    nextTo(dog(_,_,_,_,nurse,_),dog(_,_,_,_,_,hiking),Dogs),
    %3
    atAnyEnd(dog(_,_,_,_,_,jogging),Dogs),
    %4
    nextToLeft(dog(yellow,_,_,_,_,_),dog(_,_,_,dachshund,_,_),Dogs),
    %5
    Dogs=[_,_,_,dog(_,_,rex,_,_,_),_],
    %6
    somewhereBetween(dog(black,_,_,_,_,_),dog(_,_,_,_,waiter,_),dog(_,_,_,_,painter,_),Dogs),
    %7
    member(dog(_,kevin,rex,_,_,_),Dogs),
    %8
    nextTo(dog(_,_,_,_,_,reading),dog(_,_,_,dachshund,_,_),Dogs),
    %9
    member(dog(_,ryan,_,poodle,_,_),Dogs),
    %10
    somewhereBetween(dog(_,_,_,_,_,cooking),dog(_,_,_,_,_,drawing),dog(_,_,_,_,_,reading),Dogs),
    %11
    atAnyEnd(dog(_,_,_,beagle,_,_),Dogs),
    %12
    nextToLeft(dog(_,_,spike,_,_,_),dog(_,_,_,_,waiter,_),Dogs),
    %13
    Dogs=[_,_,_,dog(_,_,_,_,_,hiking),_],
    %14
    member(dog(_,bob,_,_,actor,_),Dogs),
    %15
    Dogs=[_,_,_,_,dog(_,_,apollo,_,_,_)],
    %16
    nextTo(dog(_,_,_,chiuaua,_,_),dog(_,_,_,dachshund,_,_),Dogs),
    %17
    Dogs=[_,_,_,dog(blue,_,_,_,_,_),_],
    %18
    member(dog(_,hank,spike,_,_,_),Dogs),
    %19
    nextTo(dog(red,_,_,_,_,_),dog(_,_,_,dachshund,_,_),Dogs),
    %20
    somewhereBetween(dog(_,_,luke,_,_,_),dog(white,_,_,_,_,_),dog(_,_,_,_,_,jogging),Dogs),
    %21
    member(dog(white,_,_,_,designer,_),Dogs),
    %one dog is called jake
    member(dog(_,_,jake,_,_,_),Dogs),
    %one man is called dylan
    member(dog(_,dylan,_,_,_,_),Dogs).

	poodle_dog(Dog):-
	dogs(DogsList),
		member(dog(_,_,Dog,poodle,_,_), DogsList),!.

	painter_man(Man):-
	dogs(DogsList),
	member(dog(_,Man,_,_,painter,_),DogsList),!.
/*
Examples:

 dogs(D).
 D=[dog(black,bob,luke,rottweiler,actor,cooking),
 dog(white,ryan,jake,poodle,designer,drawing),
 dog(yellow,hank,spike,chiuaua,nurse,reading),
 dog(blue,kevin,rex,dachshund,waiter,hiking),
 dog(red,dylan,apollo,beagle,painter,jogging)]

 poodle_dog(Dog).
 Dog=jake

 painter_man(Man).
 Man=dylan
*/


