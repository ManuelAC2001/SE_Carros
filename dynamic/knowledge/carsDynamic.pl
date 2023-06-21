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
  odbc_query('db', 'CALL get_body_types', row(Body)).

body_generation(Generation, Body):-
  odbc_query('db', 'CALL get_bodies_generations', row(Generation, Body)).

% Number of doors availables in the knowledge base
doors(Doors):-
  odbc_query('db', 'CALL get_number_doors', row(Doors)).

% Number of doors in a car
number_of_doors(body_generation(Generation, Body), Doors):-
  odbc_query('db', 'CALL get_number_doors_body', row(Generation, Body, Doors)).

photo_body(body_generation(Generation, Body), Photo):-
  odbc_query('db', 'CALL get_body_photos', row(Generation, Body, Photo)).

transmission(Transmission):-
  odbc_query('db', 'CALL get_transmissions', row(Transmission)).

transmission_body(body_generation(Generation, Body), Transmission):-
  odbc_query('db', 'CALL get_transmissions_bodies', row(Generation, Body, Transmission)).

fuel(Fuel):-
  odbc_query('db', 'CALL get_fuels', row(Fuel)).

fuel_body(transmission_body(body_generation(Generation, Body), Transmission), Fuel):-
  Row = row(Generation, Body, Transmission, Fuel),
  odbc_query('db', 'CALL get_fuels_bodies', Row).
