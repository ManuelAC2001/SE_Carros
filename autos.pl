% INICIO DE LA BASE DE CONOCIMIENTOS

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
anioFabricacion("NC", 2015).

% carroceria de las generaciones del modelo mx-5
carroceria("NA", convertible).
carroceria("NA", sedan).
carroceria("NA", hatchback).

carroceria("NB",convertible).

carroceria("NC",convertible).

% numero de puertas que tiene cada generacion dependiendo de su carroceria
numero_puertas(carroceria("NA", convertible), 2).
numero_puertas(carroceria("NA", sedan), 4).

numero_puertas(carroceria("NB", convertible), 2).

numero_puertas(carroceria("NC", convertible), 2). 


transmision(carroceria("NA", convertible),  automatico).
transmision(carroceria("NA", sedan),        automatico). 
transmision(carroceria("NA", convertible),  estandar).

transmision(carroceria("NB", convertible),  estandar).
transmision(carroceria("NC", convertible),  estandar).


combustible(carroceria("NA", convertible), gasolina).


precioCarroceria(carroceria("NA", convertible), 1500).


precioTransmision(
    transmision(carroceria("NA", convertible),  estandar),
    2500
).

precioTransmision(
    transmision(carroceria("NA", convertible),  automatico),
    5000
).


precioCombustible(
    combustible(carroceria("NA", convertible), gasolina),
    4750
).

calcularPrecio(Caracteristicas, PrecioCalculado):- 

    % Leer indices del arreglo de Caracteristicas
    nth0(2, Caracteristicas, Generacion),
    nth0(4, Caracteristicas, Carroceria),
    nth0(6, Caracteristicas, Transmision),
    nth0(7, Caracteristicas, Combustible),

    carroceria(Generacion, Carroceria), 
    transmision(carroceria(Generacion, Carroceria), Transmision),
    combustible(carroceria(Generacion, Carroceria), Combustible),

    precioCarroceria(carroceria(Generacion, Carroceria), PrecioInicial),
    precioTransmision(transmision(carroceria(Generacion, Carroceria), Transmision), PrecioTransmision),
    precioCombustible(combustible(carroceria(Generacion, Carroceria), Combustible), PrecioCombustible),

    PrecioCalculado is (
        PrecioInicial + 
        PrecioTransmision +
        PrecioCombustible
    ).


describirCarro(Caracteristicas):-
    marca(Marca),
    modelo(Marca, Modelo),
    generacion(Modelo, Generacion),
    anioFabricacion(Generacion, Anio),
    carroceria(Generacion, Carroceria),
    numero_puertas(carroceria(Generacion, Carroceria), NumeroPuertas),
    transmision(carroceria(Generacion, Carroceria), Transmision),
    combustible(carroceria(Generacion, Carroceria), Combustible),

    CarroCaracteristicas = [
        Marca,
        Modelo,
        Generacion,
        Anio,
        Carroceria,
        NumeroPuertas,
        Transmision,
        Combustible
    ],

    calcularPrecio(CarroCaracteristicas, Precio),
    append(CarroCaracteristicas, [Precio], Caracteristicas).

% FIN DE LA BASE DE CONOCIMIENTOS


% INCIO DEL MOTOR DE INFERENCIA

% método de prueba para buscar el auto de acuerdo a una caracteristica
findBy(X):-
    describirCarro(Caracteristicas),
    nth0(6, Caracteristicas, X),
    writeln(Caracteristicas).