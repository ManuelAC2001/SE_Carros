DELIMITER //
  CREATE PROCEDURE get_transmission_body()
  BEGIN
    SELECT 
    generations.name AS generation,
    bodies.name AS body,
    transmissions.name AS transmission

    FROM bodies_generations_transmissions

    INNER JOIN bodies_generations
    ON bodies_generations_transmissions.body_generation_id =  bodies_generations.id
    INNER JOIN generations
    ON bodies_generations.generation_id = generations.id
    INNER JOIN bodies
    ON bodies_generations.body_id = bodies.id

    INNER JOIN transmissions
    ON bodies_generations_transmissions.transmission_id = transmissions.id;
  END //
DELIMITER ;