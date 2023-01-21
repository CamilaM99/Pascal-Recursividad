{4.- Escribir un programa que:
a. Implemente un módulo recursivo que genere un vector de 20 números enteros “random” mayores a 0 y menores a 100. 
b. Implemente un módulo recursivo que devuelva el máximo valor del vector. 
c. Implementar un módulo recursivo que devuelva la suma de los valores contenidos en el vector.
}

program p2ej4_2;
const

dimf = 6;
type 

vector = array [1..dimf] of integer;

//a. Implemente un módulo recursivo que genere un vector de 20 números enteros “random” mayores a 0 y menores a 100. 
procedure generarVector (var v:vector; var diml:integer);
var n:integer;
begin
	
	//n:=random(100);
	//writeln('pos ', diml,' =  ',n);
	readln(n);
	if (diml < dimf) and (n <> 0) then begin //prueba
		v[diml]:= n;
		diml:=diml+1;
		generarVector(v,diml);
	end;
end;

//b. Implemente un módulo recursivo que devuelva el máximo valor del vector. 
 
function maximo (v:vector; diml:integer):integer;
var aux:integer;
begin
	if (diml = 1) then 
		maximo:= v[diml]
	else begin
		diml:=diml-1;
		aux:= maximo(v,diml);
		if (aux > v[diml]) then 
			maximo:=aux
		else
			maximo:=v[diml];
	end;
end;


{esta de mas }
function minimo (v:vector; diml:integer):integer;
var aux:integer;
begin
	if (diml = 1) then 
		minimo:= v[diml]
	else begin
		diml:=diml-1;
		aux:= minimo(v,diml);
		if (aux < v[diml]) then 
			minimo:=aux
		else
			minimo:=v[diml];
	end;
end;  

//c. Implementar un módulo recursivo que devuelva la suma de los valores contenidos en el vector.
function suma (v:vector; diml:integer):integer;
begin
	if (diml = 1) then 
		suma:=v[diml]
	else
		suma:= v[diml] + suma(v,diml-1); //lo que vale la suma de lo anterior y el valor en el que me posiciono
end;


var v:vector; diml:integer;
begin
	diml:=1;
	generarVector(v,diml);
	writeln('valor maximo ', maximo(v,diml));
	writeln('valor minimo ', minimo(v,diml));
	writeln('la suma de todos los datos del vector es ', suma(v,diml));
end.
