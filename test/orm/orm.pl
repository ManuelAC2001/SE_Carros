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

get_column(TableName, Column):-
  concat('DESCRIBE ', TableName, Query),
  odbc_query('db', Query, Row),
  Row =.. [_|Fields],
  nth0(0, Fields, Column).

get_columns(TableName, Columns):-
  findall(Column, get_column(TableName, Column), Columns).

select(TableName, Data):-
  concat('SELECT * FROM ', TableName, Query),
  odbc_query('db',Query, Row),
  Row =.. [_|Data].

get_json(TableName, Json):-
  get_columns(TableName, Keys),
  select(TableName, Values),
  pairs_keys_values(Data, Keys, Values),
  dict_create(Json, _, Data).

% KNOWLEDGE BASE
brand(Brand):- get_json('brands', Brand).

model(Brand, Model):- 
  get_json('brands', Brand),
  get_json('models', Model),

  Model.brand_id == Brand.id.

generation(Model, Generation):- 
  get_json('models', Model),
  get_json('generations', Generation),

  Generation.model_id == Model.id.

body(Generation, Body):-
  get_json('generations', Generation),
  get_json('bodies_generations', BodyGeneration),
  Generation.id == BodyGeneration.generation_id,

  get_json('body_types', BodyType),
  BodyGeneration.body_type_id == BodyType.id,

  get_json('number_doors', NumberDoor),
  BodyGeneration.number_door_id == NumberDoor.id,

  Body = _{
    id:BodyGeneration.id,
    name:BodyType.name,
    doors:NumberDoor.number_of
  }.

photo(body(Generation, Body), Photo):-
  body(Generation, Body),

  get_json('car_photos', CarPhoto),
  CarPhoto.body_generartion_id == Body.id,

  get_json('part_categories', Category),
  CarPhoto.part_category_id == Category.id,

  Photo = _{
    id: CarPhoto.id,
    src:CarPhoto.src,
    category:Category.category
  }. 


body_detail(body(Generation, Body), Detail):-
  body(Generation, Body),
  get_json('bodies_generations_detail', BodyGenerationDetail),
  BodyGenerationDetail.body_generation_id == Body.id,

  get_json('transmission_types', Transmission),
  BodyGenerationDetail.transmission_id == Transmission.id,

  get_json('fuel_types', Fuel),
  BodyGenerationDetail.fuel_id == Fuel.id,

  Detail = _{
    id:BodyGenerationDetail.id,
    transmission: Transmission.name,
    fuel: Fuel.name
  }.


% INFERENCE
car(Car):-
  brand(Brand),
  model(Brand, Model),
  generation(Model, Generation),
  body(Generation, Body),
  body_detail(body(Generation, Body), Detail),

  findall(
    Photo, 
    photo(body(Generation, Body), Photo), 
    Photos
  ),


  Car = _{
    brand:Brand.name,
    model:Model.name,
    generation: Generation.name,
    year: Generation.year,
    body: Body.name,
    doors: Body.doors,
    photos: Photos,
    transmission: Detail.transmission,
    fuel: Detail.fuel
  }.