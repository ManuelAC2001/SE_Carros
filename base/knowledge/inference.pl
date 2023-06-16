:- consult("./base/knowledge/carsDinamic.pl").

get_car(Car):-
  brand(Brand),
  model(Brand, Model),
  generation(Model, Generation),

  Car = _{
    brand:Brand,
    model: Model,
    generation: Generation
  }.

find_car(Value, Property, Car):-

    get_car(Car),
    (
        Property == 'brand' -> 
            Value = Car.brand;
        
        Property == 'model' -> 
            Value = Car.model;

        Property == 'generation' -> 
            Value = Car.generation
    ).