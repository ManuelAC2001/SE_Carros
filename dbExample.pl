:- use_module(library(odbc)).

conectar :- odbc_connect('prologNS', _, [
      user('root'), 
      password(''),
      alias('db'),
      open(once)
    ]).

:- conectar.

brand(Brand):-
  odbc_query('db', 'CALL get_brands', row(Brand)).

model(Brand, Model):-
  odbc_query('db', 'CALL get_models', row(Brand, Model)).

get_car(Car):-
  brand(Brand),
  model(Brand, Model),

  Car = _{
    brand:Brand,
    model: Model
  }.
