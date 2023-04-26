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