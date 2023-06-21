:- consult("./dynamic/knowledge/carsDynamic.pl").

get_car(Car):-
  brand(Brand),
  model(Brand, Model),
  generation(Model, Generation),
  body_generation(Generation, Body),

  photo_body(body_generation(Generation, Body), Photo),

  doors(Doors),
  number_of_doors(body_generation(Generation, Body), Doors),

  transmission(Transmission),
  transmission_body(body_generation(Generation, Body), Transmission),

  fuel(Fuel),
  fuel_body(transmission_body(body_generation(Generation, Body), Transmission), Fuel),

  Car = _{
    brand:Brand,
    model: Model,
    generation:Generation, 
    body:Body,
    doors:Doors,
    photo:Photo,
    transmission:Transmission,
    fuel:Fuel
  }.

find_car(Value, Property, Car):-

  get_car(Car),

  (
    Property == 'brand' -> 
      Value = Car.brand;
    
    Property == 'model' -> 
      Value = Car.model;

    Property == 'generation' -> 
      Value = Car.generation;
    
    Property == 'body' ->
      Value = Car.body;

    Property == 'doors' -> 
      Value = Car.doors;

    Property == 'transmission' ->
      Value = Car.transmission
  ).

test_car(Car):-
  transmission_body(body_generation(Generation, Body), Transmission),
  fuel_body(transmission_body(body_generation(Generation, Body), Transmission), Fuel),

  Car = _{
    generation:Generation, 
    body:Body,
    transmission:Transmission,
    fuel:Fuel
  }.