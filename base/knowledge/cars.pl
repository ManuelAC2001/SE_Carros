% INICIO DE LA BASE DE CONOCIMIENTOS

% marcas disponibles
marca(mazda).

% modelo mx-5
modelo(mazda, "mx-5").

% generaciones de cada modelo mx-5
generacion("mx-5", "NA").
generacion("mx-5", "NB").
generacion("mx-5", "NC").

% anio de fabricacion del modelo mx-5
anioFabricacion("NA", 1989).
anioFabricacion("NB", 2005).
anioFabricacion("NC", 2015).

% carroceria de las generaciones del modelo mx-5
carroceria("NA", convertible).
carroceria("NB",convertible).
carroceria("NC",convertible).

% numero de puertas que tiene cada generacion dependiendo de su carroceria
numero_puertas(carroceria("NA", convertible), 2).
numero_puertas(carroceria("NB", convertible), 2).
numero_puertas(carroceria("NC", convertible), 2). 


transmision(carroceria("NA", convertible),  estandar).
transmision(carroceria("NA", convertible),  automatico).

transmision(carroceria("NB", convertible),  estandar).
transmision(carroceria("NB", convertible),  automatico).

transmision(carroceria("NC", convertible),  estandar).
transmision(carroceria("NC", convertible),  automatico).


combustible(carroceria("NA", convertible), gasolina).

combustible(carroceria("NB", convertible), gasolina).

combustible(carroceria("NC", convertible), gasolina).
combustible(carroceria("NC", convertible), electrico).


precioCarroceria(carroceria("NA", convertible), 1500).
precioCarroceria(carroceria("NB", convertible), 2300).
precioCarroceria(carroceria("NC", convertible), 4700).


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
        precio:Precio
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