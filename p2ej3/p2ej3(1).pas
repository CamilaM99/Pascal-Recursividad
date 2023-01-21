{3.- Escribir un programa que:
a. Implemente un módulo recursivo que genere una lista de números enteros “random” mayores a 0 y menores a 100. Finalizar con el número 0.
b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista. 
c. Implemente un módulo recursivo que devuelva el máximo valor de la lista. 
d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado se encuentra en la lista o falso en caso contrario. 
}





program p2ej3;

type 

lista = ^nodo;

nodo = record
	dato:integer;
	sig:lista;
end;

//a. Implemente un módulo recursivo que genere una lista de números enteros “random” mayores a 0 y menores a 100. Finalizar con el número 0.
procedure crearLista(var l:lista);
var n:integer; nue:lista;
begin
	 //n:=random(10); 
	 //writeln(n);
	 writeln('ingrese un numero '); readln(n);
	 if (n > 0) then begin
		crearLista(l);
		new(nue);
		nue^.dato:= n;
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
	if (l = nil) then //si la lista esta vacia entonces no hay un numero minimo
		minimo:= 999
	else begin
		aux:= minimo(l^.sig);
		if (aux < l^.dato) then 
			minimo:= aux
		else
			minimo:=l^.dato;
	end;
end;


//c. Implemente un módulo recursivo que devuelva el máximo valor de la lista. 
function maximo (l:lista):integer;
var aux:integer;
begin
	if (l = nil) then
		maximo:= -1
	else begin
		aux:=maximo(l^.sig);
		if (aux > l^.dato) then 
			maximo:=aux
		else
			maximo:=l^.dato;
	end;
end;

//d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado se encuentra en la lista o falso en caso contrario. 
function buscar (l:lista; n:integer):boolean;
begin
	if (l = nil) then 
		buscar:= false
	else
		if (l <> nil ) and (n <> l^.dato) then
		buscar:= buscar(l^.sig,n); 
end;



//programa principal
var l:lista;  min,max,n:integer;
begin
	randomize;
	l:=nil;
	crearLista(l); //A
	min:=minimo(l);//B
	if (min = 999) then begin
		writeln;
		writeln('---> La lista esta vacia');
	end
	else begin
		writeln;
		writeln('---> El valor minimo de la lista es ', min);
	end;
	max:=maximo(l); //C
	if (max = -1) then begin
		writeln;
		writeln('---> La lista esta vacia');
	end
	else begin
		writeln;
		writeln('---> El valor maximo de la lista es ',max);
	end;
	writeln; //D
	writeln('---> valor a buscar ' );
	readln(n);
	if (buscar(l,n)) then
		writeln('-->se econtro el dato')
	else 
		writeln('-->el dato no existe')
end.
