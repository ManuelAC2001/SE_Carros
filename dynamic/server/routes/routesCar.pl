:- consult("./dynamic/knowledge/inference.pl").

% DEFINICION DE LAS RUTAS

% peticiones get
:- http_handler('/', index_handler, []).
:- http_handler('/brands', get_brands_handler, []).

% DEFINICION DE LOS HANDLERS PARA LAS PETICIONES GET
index_handler(_Request):- 
    cors_enable,
    findall(Carro, get_car(Carro), Carros),
    reply_json_dict(Carros).
    
get_brands_handler(_Request):-
    cors_enable,
    findall(_{name:Brand}, brand(Brand), Brands),
    reply_json_dict(Brands).