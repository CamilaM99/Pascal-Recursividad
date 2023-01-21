{2.- Realizar un programa que lea números hasta leer el valor 0 e imprima, para cada número leído, sus dígitos en el orden en que aparecen 
en el número. Debe implementarse un módulo recursivo que reciba el número e imprima lo pedido. Ejemplo si se lee el valor 256, se debe imprimir 2  5  6}

program p2ej2;

procedure leerEImprmir( n:integer);
begin
	if (n <> 0) then begin
		leerEImprmir(n div 10); // div entrega el resultado de una division pero sin decimales
		writeln(n mod 10);//mod entrega el resto de la division
	end;
end;

var n:integer;
begin
	writeln('---- ingrese un numero ----');
	readln(n);
	while (n <> 0) do begin
		leerEImprmir(n);
		writeln('---- ingrese un numero ----');
		readln(n);
	end;
	writeln(250 div 8);
end.
