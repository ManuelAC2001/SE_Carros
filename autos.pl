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

    ListaCaracteristicas = [
        Marca,
        Modelo,
        Generacion,
        Anio,
        Carroceria,
        NumeroPuertas,
        Transmision,
        Combustible
    ],

    calcularPrecio(ListaCaracteristicas, Precio),
    append(ListaCaracteristicas, [Precio], Caracteristicas).

% FIN DE LA BASE DE CONOCIMIENTOS


% INCIO DEL MOTOR DE INFERENCIA

% método para buscar un carro de acuerdo a la caracteristica seleccionada
% regla que funciona como helper para realizar el menu de opciones del usuario
buscarCarro(Nombre, Propiedad, Caracteristicas):-

    describirCarro(ListaCaracteristicas),

    (
        Propiedad == "marca" -> 
            nth0(0, ListaCaracteristicas, Nombre);

        Propiedad == "modelo" -> 
            nth0(1, ListaCaracteristicas, Nombre);

        Propiedad == "generacion" -> 
            nth0(2, ListaCaracteristicas, Nombre);

        Propiedad == "anio" -> 
            nth0(3, ListaCaracteristicas, Nombre);
        
        Propiedad == "carroceria" -> 
            nth0(4, ListaCaracteristicas, Nombre);

        Propiedad == "numero de puertas" -> 
            nth0(5, ListaCaracteristicas, Nombre);
        
        Propiedad == "transmision" -> 
            nth0(6, ListaCaracteristicas, Nombre);
        
        Propiedad == "combustible" -> 
            nth0(7, ListaCaracteristicas, Nombre);

        Propiedad == "precio" -> 
            nth0(8, ListaCaracteristicas, Nombre)
    ),

    Caracteristicas = ListaCaracteristicas.

% reglas para la creacion de preguntas para las caracteristicas

preguntarTransmision(Transmision):- 
    writeln("Escoja el tipo de transmision que desea"),
    writeln("1.- Automatico"),
    writeln("2- Estandar"), nl,
    write("Respuesta: "), read(RTransmision), nl,

    (
        RTransmision is 1 -> 
            Transmision = automatico;
        
        RTransmision is 2 -> 
            Transmision = estandar
    ).


preguntarCombustible(Combustible):-
    writeln("Escoja el tipo de combustible que desea"),
    writeln("1.- Gasolina"),
    writeln("2- Electrico"), nl,
    write("Respuesta: "), read(RCombustible), nl,


    (
        RCombustible is 1 -> 
            Combustible = gasolina;
        
        RCombustible is 2 -> 
            Combustible = electrico
    ).

iniciar:-
    preguntarTransmision(Transmision),
    preguntarCombustible(Combustible),

    buscarCarro(Transmision, "transmision", Carro),
    buscarCarro(Combustible, "combustible", Carro),

    write("Carro: "), write(Carro).
