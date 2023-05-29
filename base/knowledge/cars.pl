% INICIO DE LA BASE DE CONOCIMIENTOS

% marcas disponibles
marca(mazda).
marca(audi).


% modelo mx-5
modelo(mazda, "mx-5").

% modelo A3
modelo(audi, "A3").

% generaciones de cada modelo mx-5
generacion("mx-5", "NA").
generacion("mx-5", "NB").
generacion("mx-5", "NC").

% generaciones del modelo A3
generacion("A3", "8L").
generacion("A3", "8P").
generacion("A3", "8V").
generacion("A3", "8Y").


% anio de fabricacion del modelo mx-5
anioFabricacion("NA", 1989).
anioFabricacion("NB", 2005).
anioFabricacion("NC", 2015).

% anio de fabricacion del modelo A3
anioFabricacion("8L", 1996).
anioFabricacion("8P", 2003).
anioFabricacion("8V", 2012).
anioFabricacion("8Y", 2020).


% carroceria de las generaciones del modelo mx-5
carroceria("NA", convertible).
carroceria("NB",convertible).
carroceria("NC",convertible).

% carroceria de las generaciones del modelo A3
carroceria("8L", hatchback).
carroceria("8L", sedan).

carroceria("8P", hatchback).
carroceria("8P", convertible).

carroceria("8V", hatchback).
carroceria("8V", sedan).

carroceria("8Y",sedan).


% fotos de la carroceria de la generacion del modelo mx-5 con su respectiva carroceria
fotoCarroceria(carroceria("NA", convertible), "mx5na.png").
fotoCarroceria(carroceria("NB", convertible), "mx5nb.png").
fotoCarroceria(carroceria("NC", convertible), "mx5nc.png").


% fotos de la carroceria de la generacion del modelo A3 con su respectiva carroceria
fotoCarroceria(carroceria("8L", hatchback), "A38Lhatchback.png").
fotoCarroceria(carroceria("8L", sedan), "A38Lsedan.webp").


fotoCarroceria(carroceria("8P", hatchback),   "A38Phatchback.webp").
fotoCarroceria(carroceria("8P", convertible), "A38Pconvertible.png").

fotoCarroceria(carroceria("8V", sedan),     "A38Vsedan.png").
fotoCarroceria(carroceria("8V", hatchback), "A38Vhatchback.webp").

fotoCarroceria(carroceria("8Y",sedan), "A38Ysedan.png").


% numero de puertas que tiene cada generacion del modelo mx5 dependiendo de su carroceria
numero_puertas(carroceria("NA", convertible), 2).
numero_puertas(carroceria("NB", convertible), 2).
numero_puertas(carroceria("NC", convertible), 2). 


% numero de puertas que tiene cada generacion del modelo A3 dependiendo de su carroceria
numero_puertas(carroceria("8L",hatchback), 4).
numero_puertas(carroceria("8L",sedan),     4).

numero_puertas(carroceria("8P",hatchback),     2).
numero_puertas(carroceria("8P",convertible),   2).

numero_puertas(carroceria("8V",hatchback), 2).
numero_puertas(carroceria("8V",sedan),     4).

numero_puertas(carroceria("8Y",sedan), 4).


% transmisiones disponibles que tiene cada generacion junto con su carroceria del modelo mx-5
transmision(carroceria("NA", convertible),  estandar).
transmision(carroceria("NA", convertible),  automatico).

transmision(carroceria("NB", convertible),  estandar).
transmision(carroceria("NB", convertible),  automatico).

transmision(carroceria("NC", convertible),  estandar).
transmision(carroceria("NC", convertible),  automatico).


% transmisiones disponibles que tiene cada generacion junto con su carroceria del modelo A3
transmision(carroceria("8L", hatchback), estandar).
transmision(carroceria("8L", hatchback), automatico).
transmision(carroceria("8L", sedan),     estandar).
transmision(carroceria("8L", sedan),     automatico).

transmision(carroceria("8P", hatchback),    estandar).
transmision(carroceria("8P", hatchback),    automatico).
transmision(carroceria("8P", convertible),  estandar).
transmision(carroceria("8P", convertible),  automatico).

transmision(carroceria("8V", hatchback) , estandar).
transmision(carroceria("8V", hatchback) , automatico).
transmision(carroceria("8V", sedan)     , estandar).
transmision(carroceria("8V", sedan)     , automatico).

transmision(carroceria("8Y",sedan), estandar).
transmision(carroceria("8Y",sedan), automatico).

% combustibles disponibles que tiene cada generacion junto con su carroceria del modelo A3
combustible(carroceria("NA", convertible), gasolina).

combustible(carroceria("NB", convertible), gasolina).

combustible(carroceria("NC", convertible), gasolina).
combustible(carroceria("NC", convertible), electrico).

% combustibles disponibles que tiene cada generacion junto con su carroceria del modelo A3
combustible(carroceria("8L", hatchback), gasolina).
combustible(carroceria("8L", sedan),     gasolina).

combustible(carroceria("8P", hatchback),    gasolina).
combustible(carroceria("8P", convertible),  gasolina).

combustible(carroceria("8V", hatchback), gasolina).
combustible(carroceria("8V", sedan),     gasolina).

combustible(carroceria("8Y",sedan), gasolina).

% precio de la carroceria junto a su generacion para el modelo mx-5
precioCarroceria(carroceria("NA", convertible), 1500).
precioCarroceria(carroceria("NB", convertible), 2300).
precioCarroceria(carroceria("NC", convertible), 4700).


% precio de la carroceria junto a su generacion para el modelo A3
precioCarroceria(carroceria("8L", hatchback), 8440).
precioCarroceria(carroceria("8L", sedan),     7240).

precioCarroceria(carroceria("8P", hatchback),   9800).
precioCarroceria(carroceria("8P", convertible), 9650).

precioCarroceria(carroceria("8V", hatchback), 10_320).
precioCarroceria(carroceria("8V", sedan),    10_755).

precioCarroceria(carroceria("8Y", sedan), 12_750).


% precio de la transmision para cada generacion junto con su carroceria para el modelo mx-5
precioTransmision(
    transmision(carroceria("NA", convertible),  estandar),
    2500
).
precioTransmision(
    transmision(carroceria("NA", convertible),  automatico),
    5000
).


precioTransmision(
    transmision(carroceria("NB", convertible),  estandar),
    7390
).
precioTransmision(
    transmision(carroceria("NB", convertible),  automatico),
    9350
).


precioTransmision(
    transmision(carroceria("NC", convertible),  estandar),
    10_500
).
precioTransmision(
    transmision(carroceria("NC", convertible),  automatico),
    12_350
).


% precio de la transmision para cada generacion junto con su carroceria para el modelo A3
precioTransmision(transmision(carroceria("8L", hatchback),estandar),   
    20_433
).
precioTransmision(transmision(carroceria("8L", hatchback),automatico), 
    21_443
).
precioTransmision(transmision(carroceria("8L", sedan),estandar),   
    22_434
).
precioTransmision(transmision(carroceria("8L", sedan),automatico), 
    23_523
).


precioTransmision(transmision(carroceria("8P", hatchback),estandar), 
    32_550
).
precioTransmision(transmision(carroceria("8P", hatchback),automatico), 
    33_650
).
precioTransmision(transmision(carroceria("8P", convertible),estandar), 
    33_750
).
precioTransmision(transmision(carroceria("8P", convertible),automatico), 
    34_850
).


precioTransmision(transmision(carroceria("8V", hatchback),estandar), 
    36_789
).
precioTransmision(transmision(carroceria("8V", hatchback),automatico), 
    36_920
).
precioTransmision(transmision(carroceria("8V", sedan),estandar), 
    37_900
).
precioTransmision(transmision(carroceria("8V", sedan),automatico), 
    38_00
).


precioTransmision(transmision(carroceria("8Y",sedan), estandar), 
    41_633
).
precioTransmision(transmision(carroceria("8Y",sedan), automatico), 
    42_700
).



% precio del combustible para cada generacion junto con su carroceria para el modelo mx-5
precioCombustible(
    combustible(carroceria("NA", convertible), gasolina),
    4750
).
precioCombustible(
    combustible(carroceria("NA", convertible), electrico),
    6750
).


precioCombustible(
    combustible(carroceria("NB", convertible), gasolina),
    7250
).
precioCombustible(
    combustible(carroceria("NB", convertible), electrico),
    8560
).


precioCombustible(
    combustible(carroceria("NC", convertible), gasolina),
    9500
).
precioCombustible(
    combustible(carroceria("NC", convertible), electrico),
    9750
).


% precio del combustible para cada generacion junto con su carroceria para el modelo A3
precioCombustible(combustible(carroceria("8L", hatchback),gasolina), 
    45_700
).
precioCombustible(combustible(carroceria("8L", sedan),gasolina), 
    50_700
).

precioCombustible(combustible(carroceria("8P", hatchback),gasolina), 
    55_550
).
precioCombustible(combustible(carroceria("8P", convertible),gasolina), 
    55_650
).

precioCombustible(combustible(carroceria("8V", hatchback), gasolina), 
    58_600
).
precioCombustible(combustible(carroceria("8V", sedan),     gasolina), 
    58_950
).

precioCombustible(combustible(carroceria("8Y",sedan), gasolina), 
    62_300
).

% FIN DE LA BASE DE CONOCIMIENTOS

% INICIO DEL MOTOR DE INFERENCIA
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

getCarro(Carro):-
    marca(Marca),
    modelo(Marca, Modelo),
    generacion(Modelo, Generacion),
    anioFabricacion(Generacion, Anio),
    carroceria(Generacion, Carroceria),
    numero_puertas(carroceria(Generacion, Carroceria), NumeroPuertas),
    transmision(carroceria(Generacion, Carroceria), Transmision),
    combustible(carroceria(Generacion, Carroceria), Combustible),

    fotoCarroceria(carroceria(Generacion, Carroceria), Img),

    Caracteristicas = [
        Marca, 
        Modelo, 
        Generacion, 
        Anio, 
        Carroceria, 
        NumeroPuertas, 
        Transmision, 
        Combustible
    ],

    calcularPrecio(Caracteristicas, Precio),

    Carro = _{
        marca:Marca, 
        modelo:Modelo, 
        generacion:Generacion, 
        anio:Anio, 
        carroceria:Carroceria, 
        numeropuertas:NumeroPuertas, 
        transmision:Transmision, 
        combustible:Combustible,
        precio:Precio,
        img:Img
    }.

buscarCarro(Nombre, Propiedad, Carro):-

    getCarro(Carro),

    (
        Propiedad == "marca" -> 
            Nombre = Carro.marca;
        
        Propiedad == "modelo" -> 
            Nombre = Carro.modelo;

        Propiedad == "generacion" -> 
            Nombre = Carro.generacion;

        Propiedad == "anio" -> 
            Nombre = Carro.anio;
        
        Propiedad == "carroceria" -> 
            Nombre = Carro.carroceria;

        Propiedad == "numero_puertas" -> 
            Nombre = Carro.numeropuertas;
        
        Propiedad == "transmision" -> 
            Nombre = Carro.transmision;
        
        Propiedad == "combustible" -> 
            Nombre = Carro.combustible;

        Propiedad == "precio" -> 
            Nombre = Carro.precio
    ).

filtrarCarro(Carro, Respuestas):-
    
    nth0(0, Respuestas, Transmision),
    nth0(1, Respuestas, Combustible),
    nth0(2, Respuestas, Carroceria),
    nth0(3, Respuestas, NumeroPuertas),

    buscarCarro(Transmision, "transmision", Carro),
    buscarCarro(Combustible, "combustible", Carro),
    buscarCarro(Carroceria, "carroceria", Carro),
    buscarCarro(NumeroPuertas, "numero_puertas", Carro).

% FIN DEL MOTOR DE INFERENCIA