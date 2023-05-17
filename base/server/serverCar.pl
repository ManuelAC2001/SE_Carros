:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).
:- use_module(library(http/http_parameters)).
:- use_module(library(http/http_cors)).
:- use_module(library(http/http_header)).
:- use_module(library(http/http_client)).
:- use_module(library(http/json)).

:- consult("./base/server/routes/routesCar.pl").

% CONFIGURACION DEL SERVIDOR
server(Port) :-
    http_server(http_dispatch, [port(Port)]).

:- server(8000).

% CONFIGURACION DEL CORS
:- set_setting(http:cors, [*]).