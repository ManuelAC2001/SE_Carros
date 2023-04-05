% marcas disponibles
marca(mazda).

% modelo mx-5
modelo(mazda, mx-5).

% generaciones de cada modelo mx-5
generacion(mx-5, "NA").
generacion(mx-5, "NB").
generacion(mx-5, "NC").

% anio de fabricacion del modelo mx-5
anioFabricacion("NA", 1989).
anioFabricacion("NB", 2005).
anioFabricacion("NC", 2005).

% carroceria de las generaciones del modelo mx-5
carroceria("NA",    convertible).
carroceria("NA",sedan).
carroceria("NA",hatchback).
carroceria("NB",convertible).
carroceria("NC",convertible).



numero_puertas(2, "NA") :-
    modelo(X, Y),
    generacion(Y, "NA"),
    anioFabricacion("NA", Z),
    carroceria("NA", convertible),

    % verificion de la informacion relacionada
    write("Informacion del carro: "), nl,
    write("Marca: "), write(X), nl,
    write("Modelo: "), write(Y), nl,
    write("Carroceria: "), write(convertible), nl,
    write("Anio de fabricacion: "), write(Z), nl.


numero_puertas(2, "NB") :-
    modelo(X, Y),
    generacion(Y, "NB"),
    anioFabricacion("NB", Z),
    carroceria("NB", convertible),

    % verificion de la informacion relacionada
    write("Informacion del carro: "), nl,
    write("Marca: "), write(X), nl,
    write("Modelo: "), write(Y), nl,
    write("Carroceria: "), write(convertible), nl,
    write("Anio de fabricacion: "), write(Z), nl.

numero_puertas(4, "NA") :-
    modelo(X, Y),
    generacion(Y, "NA"),
    anioFabricacion("NA", Z),
    carroceria("NA", sedan),

    % verificion de la informacion relacionada    
    write("Informacion del carro: "), nl,
    write("Marca: "), write(X), nl,
    write("Modelo: "), write(Y), nl,
    write("Carroceria: "), write(sedan), nl,
    write("Anio de fabricacion: "), write(Z), nl.
