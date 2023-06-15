:- dynamic brand/1.
:- use_module(library(odbc)).

conectar :- odbc_connect('prologNS', _, [
      user('root'), 
      password(''),
      alias('db'),
      open(once)
    ]).

:- conectar.

brand(Brand):-
  odbc_query('db', 'SELECT name FROM brands', row(Brand)).

get_brands(Brands):-
  findall(Brand, brand(Brand), Brands).