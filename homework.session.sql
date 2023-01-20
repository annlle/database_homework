CREATE TABLE books(
    id serial PRIMARY KEY,
    autor varchar(90) NOT NULL,
    name_of_book varchar(255) NOT NULL,
    publication_year int CONSTRAINT incorrect_year CHECK(publication_year <= 2023) NOT NULL,
    publishing_house varchar(255) NOT NULL,
    category_of_book varchar(100) NOT NULL,
    synopsys varchar(1000) DEFAULT NULL,
    num_of_copy int NOT NULL CONSTRAINT incorrect_number CHECK(num_of_copy >= 0),
    status_of_book varchar(500)
);

INSERT INTO books (autor,name_of_book,publication_year,publishing_house,category_of_book,synopsys,num_of_copy,status_of_book) VALUES
('Franc Kafka', 'The Metamorphosis', 2017, 'Old Lion Publishing House', 'fantasy','The protagonist of the story, Gregor Samsa, a simple salesman, woke up in the morning and found that he had turned into a huge vile insect.', 100, 'The story really excites the hearts of young and not very readers who first get to know him. The work is filled with absurdity and surrealism, it is read very easily and interestingly.'),
('William Shakespeare', 'Gamlet', 2015,'Folio', '  tragic play', 'The main character sees the ghost of his father, who tells about his brother''s terrible crime. Prince Hamlet decides to get even with the murderer', 20, 'Here, the characters are so subtly and strongly created and shown that you can return to this work and re-read it until your death.'),
('Oscar Wild', 'The Picture of Dorian Gray', 2020, 'Folio', 'novel', 'The dramatic, paradoxical, intriguing story of Dorian Gray, who became a victim of his desire for eternal life, remains attractive to both readers and filmmakers.', 150, 'The Picture of Dorian Gray is a very instructive and profound book that many should read. This is a story about a guy who accidentally traded his soul for eternal youth. It would seem, but is it possible?');