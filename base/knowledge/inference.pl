:- consult("./base/knowledge/carsDinamic.pl").

get_car(Car):-
  brand(Brand),
  model(Brand, Model),
  generation(Model, Generation),
  body(Body),
  body_generation(Generation, Body),
  photo_body(body_generation(Generation, Body), Photo),

  Car = _{
    brand:Brand,
    model: Model,
    generation:Generation, 
    body:Body,
    photo:Photo
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
      Value = Car.body
  ).