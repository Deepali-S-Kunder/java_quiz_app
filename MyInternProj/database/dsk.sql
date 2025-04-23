CREATE DATABASE online_quiz;
USE online_quiz;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE quizzes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL
);

CREATE TABLE attempts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    quiz_id INT,
    score INT,
    attempt_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (quiz_id) REFERENCES quizzes(id)
);

INSERT INTO quizzes (title) VALUES ('Java Basics');
SET @quizId = LAST_INSERT_ID();

CREATE TABLE questions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    quiz_id INT NOT NULL,
    question VARCHAR(255) NOT NULL,
    option1 VARCHAR(255),
    option2 VARCHAR(255),
    option3 VARCHAR(255),
    option4 VARCHAR(255),
    correct_answer VARCHAR(255),
    FOREIGN KEY (quiz_id) REFERENCES quizzes(id)
);


CREATE TABLE quiz_scores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    quiz_id INT NOT NULL,
    score INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (quiz_id) REFERENCES quizzes(id)
);

INSERT INTO questions (quiz_id, question, option1, option2, option3, option4, correct_answer)
VALUES
(1, 'Which company owns GitHub?', 'Apple', 'Microsoft', 'Google', 'Amazon', 'Microsoft'),
(1, 'What does RAM stand for?', 'Read Access Memory', 'Random Access Memory', 'Run Action Memory', 'Random Allocation Memory', 'Random Access Memory'),
(1, 'Which device is used to connect computers over the internet?', 'Router', 'Compiler', 'Scanner', 'Monitor', 'Router'),
(1, 'What is the extension of a Java source file?', '.jav', '.js', '.java', '.class', '.java'),
(1, 'Which programming language is used for data analysis and machine learning?', 'C++', 'Ruby', 'R', 'HTML', 'R');

INSERT INTO questions (quiz_id, question, option1, option2, option3, option4, correct_answer)
VALUES
(2, 'Which sport uses a shuttlecock?', 'Tennis', 'Badminton', 'Squash', 'Volleyball', 'Badminton'),
(2, 'In which year did India win its first Cricket World Cup?', '1983', '2003', '2011', '1975', '1983'),
(2, 'How long is an Olympic swimming pool?', '25 meters', '33 meters', '50 meters', '75 meters', '50 meters'),
(2, 'What is the maximum score in a single throw in darts?', '20', '25', '50', '60', '60'),
(2, 'Which country has won the most Olympic gold medals in history?', 'Russia', 'China', 'USA', 'Germany', 'USA');

INSERT INTO questions (quiz_id, question, option1, option2, option3, option4, correct_answer)
VALUES
(3, 'Who is the Prime Minister of the UK as of 2025?', 'Boris Johnson', 'Rishi Sunak', 'Keir Starmer', 'Theresa May', 'Rishi Sunak'),
(3, 'Which country launched the Chandrayaan-3 mission?', 'USA', 'China', 'India', 'Russia', 'India'),
(3, 'Which global summit focuses on climate change?', 'G20', 'BRICS', 'COP', 'UNESCO', 'COP'),
(3, 'Which tech CEO stepped down from Amazon?', 'Tim Cook', 'Sundar Pichai', 'Jeff Bezos', 'Elon Musk', 'Jeff Bezos'),
(3, 'Which country is hosting Expo 2025?', 'France', 'Japan', 'UAE', 'Canada', 'Japan');
rollback;
INSERT INTO quizzes (title)
VALUES
('Technology'),
('Sports'),
('General Knowledge');