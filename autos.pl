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
carroceria("NA",convertible).
carroceria("NA",sedan).
carroceria("NA",hatchback).

carroceria("NB",convertible).
carroceria("NC",convertible).

% numero de puertas que tiene cada generacion dependiendo de su carroceria
numero_puertas(carroceria("ANAAAAL", convertible), 2) :-
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


numero_puertas(carroceria("NB", convertible), 2) :-
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

numero_puertas(carroceria("NA", sedan), 4) :-
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

% MAZDA MX-5 NA CONVERTIBLE 1989 4 PUERTAS AUTOMATICO
transmision("NA", automatico) :-
    numero_puertas(carroceria("NA", convertible),  X),
    write("Numero de puertas: "), write(X), nl.

transmision("NA", automatico) :-
    numero_puertas(carroceria("NA", sedan),  X),
    write("Numero de puertas: "), write(X), nl.

