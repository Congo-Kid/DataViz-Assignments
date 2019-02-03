-- Make a new database called "programming_db" and switch into it for this activity
CREATE DATABASE programming_db;

DROP TABLE programming_languages;

USE programming_db; 

-- Create a table called "programming_languages" which includes a primary key named "id" which will automatically increment 
-- which each new row created, a string column called "languages," and a numeric column called "rating."
CREATE TABLE programming_languages (id INT AUTO_INCREMENT NOT NULL, Languages VARCHAR (100), rating INT,
	Mastered BOOLEAN DEFAULT true, PRIMARY KEY (id));

-- Insert some data into the table and then modify the data using the id column.
INSERT INTO programming_languages (Languages, rating)
	VALUES ("VBA", 87), ("HTML", 92), ("ASCI", 64), ("Python", 100);
    
SELECT * FROM programming_languages;

-- BONUS: Study up on how to add columns to a table and then create a boolean column called "mastered" which has a default value of true


-- BONUS: Start looking into the concept of joins in SQL


 -- id INT AUTO_INCREMENT NOT NULL,