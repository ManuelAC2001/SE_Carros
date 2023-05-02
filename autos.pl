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
carroceria("NA", convertible).
carroceria("NA", sedan).
carroceria("NA", hatchback).
carroceria("NB",convertible).
carroceria("NC",convertible).

% numero de puertas que tiene cada generacion dependiendo de su carroceria
numero_puertas(carroceria("NA", convertible), 2).
numero_puertas(carroceria("NB", convertible), 2).
numero_puertas(carroceria("NA", sedan), 4).
numero_puertas(carroceria("NC", convertible), 2). 


transmision(carroceria("NA", convertible),  automatico).
transmision(carroceria("NA", sedan),        automatico). 
transmision(carroceria("NA", convertible),  estandar).


combustible(carroceria("NA", convertible), gasolina).


precioCarroceria(carroceria("NA", convertible), 1500).


% precioTransmision(estandar, 2500).
% precioTransmision(automatico, 5000).



precioTransmision(
    transmision(carroceria("NA", convertible),  estandar),
    2500
).

precioTransmision(
    transmision(carroceria("NA", convertible),  automatico),
    5000
).

% metodo para calcular el precio del carro
% de acuerdo a las variacines de combustible y transmision
calcularPrecio(Generacion, TipoCarroceria):- 
    Carroceria = carroceria(Generacion, TipoCarroceria),
    Transmision = transmision(Carroceria, TipoTransmision),

    carroceria(Generacion, TipoCarroceria), 

    combustible(Carroceria, Combustible),
    transmision(Carroceria, TipoTransmision),
    precioCarroceria(Carroceria, PrecioInicial),

    precioTransmision(Transmision, PrecioTransmision),

    PrecioFinal is PrecioInicial + PrecioTransmision,

    write("Precio: "), write(PrecioFinal), nl,
    write("Combustible: "), write(Combustible), nl,
    write("Transmision: "), write(TipoTransmision), nl.
    
