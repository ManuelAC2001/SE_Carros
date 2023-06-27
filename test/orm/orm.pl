:- use_module(library(odbc)).
use_module(library(http/json)).

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

select(TableTableName, Data):-
  concat('SELECT * FROM ', TableTableName, Query),
  odbc_query('db',Query, Row),
  Row =.. [_|Data].

get_json(TableTableName, Json):-
  get_columns(TableTableName, Keys),
  select(TableTableName, Values),
  pairs_keys_values(Data, Keys, Values),
  dict_create(Json, _, Data).

brand(Brand):- get_json('brands', Brand).

model(Model):- 
  get_json('brands', Brand),
  get_json('models', FoundModel),

  Brand.id == FoundModel.brand_id,

  Model = _{
    id:FoundModel.id,
    name:FoundModel.name,
    brand: Brand
  }.