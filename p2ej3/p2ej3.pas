{3.- Escribir un programa que:
a. Implemente un módulo recursivo que genere una lista de números enteros “random” mayores a 0 y menores a 100. Finalizar con el número 0.
b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista. 
c. Implemente un módulo recursivo que devuelva el máximo valor de la lista. 
d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado se encuentra en la lista o falso en caso contrario. }

program p2ej3;

type 

lista = ^nodo;

nodo = record
	dato:integer;
	sig:lista;
end;
//a. Implemente un módulo recursivo que genere una lista de números enteros
// “random” mayores a 0 y menores a 100. Finalizar con el número 0.
procedure generarLista(var l:lista);
var nue:lista; n:integer;
begin
	n:=random(100);
	writeln(n);
	if (n > 0 ) then begin 
		generarLista(l);
		new(nue);
		nue^.dato:=n;
		nue^.sig:=l;
		l:=nue;
	end
	else
		l:=nil;
end;

//b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista. 
function minimo(l:lista):integer;
var aux:integer;
begin
	if (l = nil) then 
		minimo:=999
	else begin
		aux:= minimo(l^.sig); 
	if (aux < l^.dato) then
		minimo:= aux
	else
		minimo:=l^.dato;
	end;
end;

//c. Implemente un módulo recursivo que devuelva el máximo valor de la lista. 
function maximo(l:lista):integer;
var aux:integer;
begin
	if (l = nil) then 
		maximo:=0
	else begin
		aux:= maximo(l^.sig); 
	if (aux > l^.dato) then
		maximo:= aux
	else
		maximo:=l^.dato;
	end;
end;

//d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado
// se encuentra en la lista o falso en caso contrario.
function buscar (l:lista; n:integer): boolean;
begin
	if (l <> nil) and (l^.dato <> n) then 
		buscar:= buscar(l^.sig,n)
	else
		buscar:=l<>nil;
end;

// opcion 2
begin
	if (l = nil) then 
		buscar:= false
	else
		if (l <> nil ) and (n <> l^.dato) then
		buscar:= buscar(l^.sig,n); 
end;

 
//programa principal
var l:lista; n:integer;
begin
	randomize;
	l:=nil;
	generarLista(l);//A
	//B
	if (minimo(l) <> 999) then 
		writeln('  El valor minimo de la lista es ',minimo(l))
	else 
		writeln(' la lista esta vacia');
	//C
	if (maximo(l) <> 0) then 
		writeln('  El valor maximo de la lista es ',maximo(l))
	else 
		writeln(' la lista esta vacia');
	//D
	//el ejercicio no pide que se informe, lo hago para saber que anda 
	writeln('  ingrese el numero a buscar ');
	readln(n);
	if (buscar(l,n)) then 
		writeln('el dato existe')
	else
		writeln('el dato no existe');
end.
