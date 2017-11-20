DROP TABLE IF EXISTS food;

CREATE TABLE food (

  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  body TEXT,
  image TEXT
);

INSERT INTO food (title , body, image) VALUES ('Cougettes' , 'Short description of cougettes' , 'https://i2-prod.manchestereveningnews.co.uk/incoming/article12478695.ece/ALTERNATES/s615/Fresh-zucchini-courgette.jpg');
INSERT INTO food (title , body, image) VALUES ('Tomatos' , 'Short description of tomatos' , 'https://media.istockphoto.com/photos/tomato-isolated-on-white-background-picture-id466175630?k=6&m=466175630&s=612x612&w=0&h=fu_mQBjGJZIliOWwCR0Vf2myRvKWyQDsymxEIi8tZ38=');
INSERT INTO food (title , body, image) VALUES ('Rhubarb' , 'Short description of Rhubarb' , 'https://www.pomonafruits.co.uk/images/Rhubarb-Thompsons-Terrifically-Tasty.jpg');
INSERT INTO food (title , body, image) VALUES ('Leek' , 'short description of leek' , 'https://www.collinsdictionary.com/images/thumb/leek_258417383_250.jpg');
