:- use_module(library(odbc)).

connect :- 
  Credentials = [
    user('root'), 
    password(''),
    alias('db'),
    open(once)
  ],
  odbc_connect('prologNS', _, Credentials).

:- connect.

brand(Brand):-
  odbc_query('db', 'CALL get_brands', row(Brand)).

model(Brand, Model):-
  odbc_query('db', 'CALL get_models', row(Brand, Model)).

generation(Model, Generation):-
  odbc_query('db', 'CALL get_generations', row(Model, Generation, _)).

year_of_production(Generation, Year):-
  odbc_query('db', 'CALL get_generations', row(_, Generation, Year)).

body(Body):-
  odbc_query('db', 'SELECT name FROM bodies', row(Body)).

body_generation(Generation, Body):-
  odbc_query('db', 'CALL get_bodies_generations', row(Generation, Body)).

photo_body(body_generation(Generation, Body), Photo):-
  odbc_query('db', 'CALL get_body_photos', row(Generation, Body, Photo)).