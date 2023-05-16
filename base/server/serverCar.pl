:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).
:- use_module(library(http/http_parameters)).
:- use_module(library(http/http_cors)).

:- consult("./base/server/routes/routesCar.pl").

% CONFIGURACION DEL SERVIDOR
server(Port) :-
    http_server(http_dispatch, [port(Port)]).

:- server(8000).

% CONFIGURACION DEL CORS
:- set_setting(http:cors, [*]).