{5.- Implementar un módulo que realice una búsqueda dicotómica en un vector, utilizando el siguiente encabezado:
   	Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice); 

Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra en el vector.
}

program p2ej5;
const 
	dimf= 10;

type 
	vector = array [1..dimf] of integer;


procedure generarVector(var v:vector; var diml:integer);
var n:integer;
begin	
	if (diml < dimf) then begin
		n:=random(30);
		writeln(n);
		v[diml]:=n;
		diml:=diml+1;
		generarVector(v,diml);
	end;
end;

procedure ordenarVector(var v:vector; diml:integer);
var  i,j,actual:integer; 
begin
	for i:=2 to diml-1 do begin
		actual:=v[i];
		j:=i-1; 
		while (j > 0) and (actual < v[j]) do begin 
			v[j+1]:=v[j];
			j:=j-1;
		end;	
		v[j+1]:=actual;
	end;
end;

procedure imprimirOrdenado(v:vector; i,diml:integer);
begin
	if (i < diml) then begin
		writeln('pos ',i,' valor ', v[i]);
		i:=i+1;
		imprimirOrdenado(v,i,diml);
	end;
end;


procedure busquedaDicotomica (v: vector; ini,fin: integer; dato:integer; var pos: integer); 
var medio:integer;
begin
	if (ini > fin) then //caso base 1, se cumple cuando no hay datos en el vector y cuando recorrimos todo el vector
			pos:=-1
	else begin
		medio:= (ini + fin) div 2; //ubico la mitad del vector
		if (dato = v[medio]) then //caso base 2, me fijo si el numero es igual al valor de la posicion medio
			pos:= medio
		else
		if (dato > v[medio]) then 
			busquedaDicotomica(v,medio+1,fin,dato,pos)//busco el dato en la parte derecha a partir del medio +1
		else
			busquedaDicotomica(v,ini,medio-1,dato,pos) //busco el dato en la parte izquierda a partir del medio -1
	end;	
end;


var v:vector; diml:integer; i,dato,ini,fin,pos:integer;
begin
	diml:=1;
	generarVector(v,diml);
	ordenarVector(v,diml);
	i:=1;
	imprimirOrdenado(v,i,diml);
	writeln;
	ini:= 1;
	fin:= 10; //suponiendo que el vector si o si esta lleno 
	writeln('ingrese el dato a buscar');
	readln(dato);
	busquedaDicotomica(v,ini,fin,dato,pos);
	if (pos <> -1) then 
		writeln('el dato ', dato,' existe en el vector')
	else
		writeln('el dato ', dato,' NO existe en el vector');
end.
