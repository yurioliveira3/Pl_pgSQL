-- DEFINE DB OF EXAMPLE
CREATE DATABASE alura;

CREATE TABLE student (
    id SERIAL PRIMARY KEY,
	first_nome VARCHAR(255) NOT NULL,
	last_nome VARCHAR(255) NOT NULL,
	birth_date DATE NOT NULL
);

CREATE TABLE category (
    id SERIAL PRIMARY KEY,
	"name" VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE grade (
    id SERIAL PRIMARY KEY,
	"name" VARCHAR(255) NOT NULL,
	category_id INTEGER NOT NULL REFERENCES category(id)
);

CREATE TABLE student_grade (
	student_id INTEGER NOT NULL REFERENCES student(id),
	grade_id INTEGER NOT NULL REFERENCES grade(id),
	PRIMARY KEY (student_id, grade_id)
);


DROP FUNCTION create_grade(name TEXT, category_name TEXT) ;
CREATE OR REPLACE FUNCTION create_grade(grade_name TEXT, category_name TEXT) RETURNS void AS $$
	DECLARE 
		id_category INT;
	BEGIN 
		SELECT id INTO id_category FROM category WHERE "name" = category_name;
		
		IF NOT FOUND THEN 
			INSERT INTO category("name") VALUES (category_name) RETURNING id INTO id_category;
		END IF;
	
	 	INSERT INTO grade("name", category_id) VALUES (grade_name,id_category);
	END
$$ LANGUAGE plpgsql;


SELECT create_grade('cursinho SQL','SQL');

SELECT * FROM grade;

SELECT * FROM category;