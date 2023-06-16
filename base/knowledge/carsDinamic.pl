:- use_module(library(odbc)).

conectar :- 
  Credentials = [
    user('root'), 
    password(''),
    alias('db'),
    open(once)
  ],
  odbc_connect('prologNS', _, Credentials).

:- conectar.

brand(Brand):-
  odbc_query('db', 'CALL get_brands', row(Brand)).

model(Brand, Model):-
  odbc_query('db', 'CALL get_models', row(Brand, Model)).

generation(Model, Generation):-
  odbc_query('db', 'CALL get_generations', row(Model, Generation)).