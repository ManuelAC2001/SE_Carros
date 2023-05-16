:- consult("./base/knowledge/cars.pl").

% DEFINICION DE LAS RUTAS
:- http_handler('/', index_handler, []).
:- http_handler('/buscar/carros', filter_car_handler, []).


% DEFINICION DE LOS HANDLERS
index_handler(_Request):- 
    cors_enable,
    findall(Carro, getCarro(Carro), Lista),
    reply_json_dict(_{carros:Lista}).

filter_car_handler(Request):-
    cors_enable,
    http_parameters(Request, [ 
        transmision(Transmision, [sting]),
        combustible(Combustible, [sting]),
        numeroPuertas(NumeroPuertas, [integer]),
        carroceria(Carroceria, [sting])
    ]),

    Respuestas = [
        Transmision,
        Combustible,
        Carroceria,
        NumeroPuertas
    ],

    findall(Carro, filtrarCarro(Carro, Respuestas), Lista),
    reply_json_dict(_{carros:Lista}).