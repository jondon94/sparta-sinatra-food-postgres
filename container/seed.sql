DROP TABLE IF EXISTS food;

CREATE TABLE food (

  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  body TEXT,
  img VARCHAR

);

INSERT INTO food (title , body, img) VALUES ('Cougettes' , 'Short description of cougettes', 'https://i2-prod.manchestereveningnews.co.uk/incoming/article12478695.ece/ALTERNATES/s615/Fresh-zucchini-courgette.jpg');
INSERT INTO food (title , body) VALUES ('Tomatos' , 'Short description of tomatos');
INSERT INTO food (title , body) VALUES ('Rhubarb' , 'Short description of Rhubarb');
INSERT INTO food (title , body) VALUES ('Leek' , 'short description of leek');
