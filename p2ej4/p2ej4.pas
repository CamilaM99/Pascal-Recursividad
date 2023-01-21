{4.- Escribir un programa que:
a. Implemente un módulo recursivo que genere un vector de 20 números enteros “random” mayores a 0 y menores a 100. 
b. Implemente un módulo recursivo que devuelva el máximo valor del vector. 
c. Implementar un módulo recursivo que devuelva la suma de los valores contenidos en el vector.
}

program p2ej4; 

type

vector = array [1..20] of integer;

procedure generarVector (var v:vector; var diml:integer );
var n:integer;
begin	
		//n:=random(100);
		//writeln(n);
		readln(n);
	if (diml < 20) and (n <> 0) then begin
		v[diml]:= n;
		diml:=diml+1;
		generarVector(v,diml);
	end;
end;

function maximo(v:vector; diml:integer):integer;
var aux:integer;
begin
	if (diml = 1) then 
		maximo:=v[diml]
	else begin
		aux:= maximo(v,diml-1);
		if (aux < v[diml]) then
			maximo:=v[diml]
		else
			maximo:= aux;
	end;
end;




function suma(v:vector; diml:integer):integer;
	begin
		if (diml = 1)then
			suma:= v[diml]
		else
			suma:= suma(v,diml-1)+v[diml]; 
	end;


var v:vector; diml:integer;
begin
	randomize;
	diml:=1;
	generarVector(v,diml);//A
	writeln('el valor maximo del vector es ', maximo(v,diml));//B
	writeln('la suma de todos los valores del vector es ', suma(v,diml));//C
end.
