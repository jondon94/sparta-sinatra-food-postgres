DROP TABLE IF EXISTS food;

CREATE TABLE food (

  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  body TEXT

);

INSERT INTO food (title , body) VALUES ('Cougettes' , 'Short description of cougettes');
INSERT INTO food (title , body) VALUES ('Tomatos' , 'Short description of tomatos');
INSERT INTO food (title , body) VALUES ('Rhubarb' , 'Short description of Rhubarb');
INSERT INTO food (title , body) VALUES ('Leek' , 'short description of leek');
