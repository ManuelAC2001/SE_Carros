:- consult("./test/orm/orm.pl").

% DEFINICION DE LAS RUTAS

% peticiones get
:- http_handler('/', index_handler, []).
:- http_handler('/brands', get_brands_handler, []).
:- http_handler('/models', get_models_handler, []).
:- http_handler('/generations', get_generations_handler, []).
:- http_handler('/bodies_generations', get_bodies_generations_handler, []).

get_brands_handler(_Request):-
    cors_enable,
    findall(Brand, brand(Brand), Brands),
    reply_json_dict(Brands).

get_models_handler(_Request):-
    cors_enable,
    findall(Model, model(Model), Models),
    reply_json_dict(Models).

get_generations_handler(_Request):-
    cors_enable,
    findall(Generation, generation(Generation), Generations),
    reply_json_dict(Generations).

get_bodies_generations_handler(_Request):-
    cors_enable,
    findall(BodyGeneration, body_generation(BodyGeneration), BodiesGenerations),
    reply_json_dict(BodiesGenerations).