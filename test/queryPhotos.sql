DELIMITER / / CREATE PROCEDURE get_body_photos() BEGIN
SELECT
  generations.name AS generation,
  bodies.name AS body,
  src
FROM
  car_photos
  LEFT JOIN part_categories ON car_photos.part_category_id = part_categories.id
  LEFT JOIN bodies_generations ON car_photos.body_generartion_id = bodies_generations.id
  LEFT JOIN bodies ON bodies_generations.body_id = bodies.id
  LEFT JOIN generations ON bodies_generations.generation_id = generations.id
WHERE
  category = 'Body';

END / / DELIMITER;