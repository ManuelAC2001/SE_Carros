:- consult("./base/knowledge/cars.pl").

% DEFINICION DE LAS RUTAS

% peticiones get
:- http_handler('/', index_handler, []).
:- http_handler('/buscar/carros', filter_cars_handler, []).

% DEFINICION DE LOS HANDLERS PARA LAS PETICIONES GET
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


% DEFINICION DE LOS HANDLERS PARA LAS PETICIONES POST
filter_cars_handler(Request) :-
        cors_enable,
        member(method(post), Request), !,
        http_read_data(Request, StringData, []),

        string_to_json(StringData, RespuestaJSON),

        Respuestas = [
            RespuestaJSON.transmision,
            RespuestaJSON.combustible,
            RespuestaJSON.carroceria,
            RespuestaJSON.numeropuertas
        ],

        findall(Carro, filtrarCarro(Carro, Respuestas), Carros),        

        reply_json_dict(_{
            carros:Carros,
            message:"Estos son los carros que mas se acercan a tus gustos y preferencias"
        }).

% regla que nos ayuda a convertir un string a json
string_to_json(String, RespuestaJSON) :-
    atom_string(Atom, String),
    atom_json_term(Atom, JSON, []),
    JSON = json(Atributos),

    member(transmision=Transmision,Atributos),
    member(combustible=Combustible,Atributos),
    member(numeropuertas=Numeropuertas,Atributos),
    member(carroceria=Carroceria,Atributos),

    (
         Combustible == x ->
             CombustibleRespuesta = _;
         CombustibleRespuesta = Combustible
     ),

     (
         Transmision == x ->
             TransmisionRespuesta = _;
         TransmisionRespuesta = Transmision
     ),

     (
         Numeropuertas == x ->
             NumeropuertasRespuesta = _;
         NumeropuertasRespuesta = Numeropuertas
     ),

    RespuestaJSON = _{
        transmision:TransmisionRespuesta,
        combustible:CombustibleRespuesta,
        numeropuertas:NumeropuertasRespuesta,
        carroceria:Carroceria
    }.