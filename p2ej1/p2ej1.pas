{1.- Implementar un programa que invoque a los siguientes módulos.
a. Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y los almacene en un vector con dimensión física igual a 10.
b. Implementar un módulo que imprima el contenido del vector.
c. Implementar un módulo recursivo que imprima el contenido del vector.
d. Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y retorne la cantidad de caracteres leídos. 
El programa debe informar el valor retornado.
e. Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y retorne una lista con los caracteres leídos.
f. Implemente un módulo recursivo que reciba la lista generada en d. e imprima los valores de la lista en el mismo orden que están almacenados.
g. Implemente un módulo recursivo que reciba la lista generada en d. e imprima los valores de la lista en orden inverso al que están almacenados
}
program p2ej1;

const 
dimf = 10;

type 
vector = array [1..dimf] of char;
lista =^nodo;

nodo = record 
	dato:char;
	sig:lista;
end;

//modulo no recursivo que lee una secuencia de caracteres finalizada en punto, almacenada en un vector de dimf = 10
{procedure generarVector (var v:vector; var diml:integer);
var c:char;
begin
	writeln ('ingrese un caracter');
	readln(c);
	while (c <> '.') and (diml < dimf) do begin 
		diml:=diml+1;
		v[diml]:=c;
		writeln ('ingrese un caracter');
		readln(c);
	end;
end;

var v:vector; diml:integer;
begin
	diml:=0;
	generarVector(v,diml);
end.
}

//A
//modulo recursivo que lee una secuencia de caracteres finalizada en punto, almacenada en un vector de dimf = 10
procedure generarVector (var v:vector; var diml:integer);
var c:char;
begin
	writeln('ingrese un caracter');
	readln(c);
	if (c <> '.') and (diml < dimf) then begin
		diml:=diml+1;
		v[diml]:=c;
		generarVector(v,diml);
	end;
end;

//B
//Implementar un módulo que imprima el contenido del vector.
procedure imprimirVector (v:vector; diml:integer);
var i:integer;
begin
	writeln;
	writeln('---- vector de caracteres ----');
	for i:=1 to diml do begin
		writeln('pos ', i, ' caracter ', v[i]);
	end;
end;


//C
//Implementar un módulo recursivo que imprima el contenido del vector.
procedure imprimirVectorRecursivo(v:vector; diml:integer; i:integer);
begin
	if (i <= diml) then begin
		writeln('pos ',i,' caracter ',v[i]);
		imprimirVectorRecursivo(v,diml,i+1);
	end;
end;

procedure invocarImprimirRecursivo(v:vector; diml:integer);
var i:integer;
begin
	i:=1;
	writeln;
	writeln('---- vector de caracteres impreso de manera recursiva ----');
	imprimirVectorRecursivo(v,diml,i);
end;

//D 
//Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y retorne la cantidad de caracteres leídos. 
//El programa debe informar el valor retornado.
function cantCaracteres ():integer;
var c:char;
begin
	writeln('---- PUNTO D, ingrese un caracter ----');
	readln(c);
	if (c <> '.') then 
		cantCaracteres:= cantCaracteres() +1
	else 
		cantCaracteres:=0;
end;

//E
//Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y retorne una lista con los caracteres leídos.
procedure generarListaRecursivo (var l:lista);
var nue:lista; c:char;
begin
	writeln('----PUNTO E, ingrese un caracter ----');
	readln(c);
	if ( c <> '.') then begin
		generarListaRecursivo(l);
		new(nue);
		nue^.dato:=c;
		nue^.sig:= l;
		l:=nue;
	end
	else 
		l:=nil;
end;

//F
//Implemente un módulo recursivo que reciba la lista generada en d. e imprima los valores de la lista en el mismo orden que están almacenados.
procedure imprimirListaRecursivo (l:lista);
begin
	if (l <> nil) then begin
		writeln('  ', l^.dato);
		imprimirListaRecursivo(l^.sig);
	end;
end;

//G
//Implemente un módulo recursivo que reciba la lista generada en d. e imprima los valores de la lista en orden inverso al que están almacenados
procedure imprimirInversoLista (l:lista);
begin
	if (l <> nil) then begin
		imprimirInversoLista(l^.sig);
		writeln('  ', l^.dato);
	end;
end;


var v:vector; diml,cant :integer; l:lista;
begin
	diml:=0;
	l:=nil;
	
	generarVector(v,diml); //A
	
	if (diml = 0) then 
		writeln('---- vector sin elementos ----')
	else begin
		imprimirVector(v,diml); //B
		invocarImprimirRecursivo(v,diml);//C
		writeln;
	end;
	
	cant:= cantCaracteres();
	writeln;
	writeln('la cant de caracteres leidos en el punto D es:  ', cant); //D
	
	writeln;
	generarListaRecursivo(l); //E
	
	writeln;
	writeln('---- lista impresa en orden ----');
	imprimirListaRecursivo(l); //F
	
	writeln;
	writeln('---- lista impresa al reves ----');
	imprimirInversoLista(l); //G
end.
