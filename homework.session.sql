CREATE TABLE users(
    id serial PRIMARY KEY,
    first_name varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL
);

CREATE TABLE messages(
    chatID int REFERENCES chats(id),
   text varchar(255) NOT NULL PRIMARY KEY,
   time timestamp DEFAULT current_timestamp,
   autor int REFERENCES users(id)
);

CREATE TABLE chats(
    id serial PRIMARY KEY,
    owner int REFERENCES users(id)
);

CREATE TABLE chats_to_users(
    chat_id int REFERENCES chats(id),
    users_id int REFERENCES users(id),
    message_text varchar(255) REFERENCES messages(text)
);

INSERT INTO chats(first_name, last_name) VALUES
('John', 'Doe'),
('Jane', 'Do'),
('Sam', 'Smith');

INSERT INTO chats(owner) VALUES
(2),(3);

INSERT INTO messages(chatID, text, autor) VALUES
(1, 'Hi, how are you?', 2),
(1, 'I''m fine, what about you?', 1),
(3, 'What will you do tomorrow?',3);
(3, 'I will work', 1);

INSERT INTO chats_to_users(chat_id, users_id, message_text) VALUES
(1,2, 'Hi, how are you?'),
(1,2, 'I''m fine, what about you?'),
(2,3, 'What will you do tomorrow?'),
(2,1, 'I will work');