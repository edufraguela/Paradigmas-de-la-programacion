();;
(*-:unit=0*)

2+5*3;;
(*-:int=17*)

1.0;;
(*-:float=1.*)

1.0*2;;
(*ERROR DE TIPO,'*' es la multiplicación para tipo int.*)
(*CORRECCIÓN: 1.0*.2.0;;*)

2-2.0;;
(*ERROR DE TIPOS,'-' es la resta para tipos int*)
(*CORRECCIÓN: 2.0-.2.0;; o 2-2;;*)

3.0+2.0;;
(*ERROR, '+' es la suma de enteros*)
(*CORRECCIÓN: 3.0+.2.0;;*)

5/3;;
(*-:int=1*)

5 mod 3;;
(*-:int=2*)

3.0*.2.0**3.0;;
(*-:float=24.00*)

3.0=float_of_int 3;;
(*La igualdad es verdadera -> tipo bool
-:bool=true*)

sqrt 4;;
(*ERROR porque el valor 'sqrt' solo es válidopara tipo float*)
(*CORRECCIÓN: sqrt 4.0;;*)

int_of_float 2.1 + int_of_float(-2.9);;
(*-:int=0*)

truncate 2.1 + truncate (-2.9);;
(*-:int=0*)

floor 2.1 +. floor (-2.9);;
(*-:float=-1.*)

ceil 2.1 +. ceil -2.9;;
(*ERROR, dado que tienen que ser tipos float. El error salta porque '-2.9' no está entre parentesis*)
(*CORRECCIÓN: ceil 2.1 +. (-2.9);;*)

'B';;
(*-:char='B'*)

int_of_char 'A';;
(*-:int=65*)

char_of_int 66;;
(*-:char='B'*)

Char.code 'B';;
(*-:int=66*)

Char.chr 67;;
(*-:char 'C'*)

'\067';;
(*-:char='C'*)

Char.chr(Char.code 'a' - Char.code 'A' + Char.code 'Ñ');;
(*-:char='\241'*)

Char.uppercase 'ñ';;
(*-:char='\209'
El resultado es la 'Ñ' mayúscula*)

Char.lowercase 'O';;
(*-:char='o'
El resultado ahora, es el correpondiente caracter en minúscula*)

"this is a string";;
(*-:string="this is a string"*)

String.length "longitud";;
(*-:int=8
Indica la longitud de la cadena*)

"1999" + "1";;
(*ERROR, el '+' solo sirve para int, no para strings*)

"1999" ^ "1";;
(*-:string="19991"
Concatena las dos cadenas *)

int_of_string "1999" +1;;
(*-:int=2000*)

"\064\065";;
(*-:string="@A"*)

string_of_int 010;;
(*-:string="10"*)

not true;;
(*-:bool=false*)

true&&false;;
(*-:bool=false*)

true||false;;
(*-:bool=true*)

true or false;;
(*-:bool=true*)

true and false;;
(*ERROR sintáctico, no existe el valor 'and'*)

(1<2)=false;;
(*-:bool=false*)

"1"<"2";;
(*-:bool=true
El caracter "2" es mayor en la tabla ASCII*)

2<12;;
(*-:bool=true*)

"2"<"12";;
(*-:bool=false
La cadena "12" es más larga*)

"uno"<"dos";;
(*-:bool=false*)

2,5;;
(*-:int*int=(2,5)
Es un par*)

"hola", "adios";;
(*-:string*string=("hola","adios")*)

0,0.0;;
(*-:int*float=(0,0.)*)

fst('a',0);;
(*El valor 'fst' devuelve el primer valor de un par. En este caso:
	-:char='a'*)

snd(false,true);;
(*El valor 'snd' devuelve el segundo valor de un par:
	-:bool=true*)

(1,2,3);;
(*-:int*int*int=(1,2,3)*)

(1,2),3;;
(*-:(int*int)*int=((1,2),3)*)

fst((1,2),3);;
(*-:int*int=(1,2)*)

if 3=4 then 0 else 4;;
(*-:int=4*);;

if 3=4 then "0" else "4";;
(*-:string ="4"*)

if 3=4 then 0 else "4";;
(*ERROR, dado que las dos posibilidades tienen que ser del mismo tipo*)
(*CORRECCIÓN: if 3=4 then 0 else 4;;*)

(if 3<5 then 8 else 10)+4;;
(*-:int=12*)

2.0*.asin 1.0;;
(*- : float = 3.14159265358979312*)

sin(2.0*.asin 1.0/.2.);;
(*- : float = 1.*)

function x->2*x;;
(*- : int -> int = <fun>*)

(function x->2*x)(2+1);;
(*- : int = 6*)

function(x,y)->2*x+y;;
(*- : int * int -> int = <fun>*)

(function(x,y)->2*x+y)(1+2,3);;
(*- : int = 9*)








