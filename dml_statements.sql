-- inserting questions and corresponding categories for the quiz to the column 'question'
-- question_id is added to the table automatically based on auto-increment
INSERT INTO question (fk_test_id, question, category)
VALUE 
	(1, 'Do you appreciate design in relation to products?', 'Graphical design'),
	(1, 'Do you have a favourite artist when it comes to visual art?', 'Graphical design'),
    (1, 'Do you enjoy making visual presentations for school or business?', 'Graphical design'),
    (1, 'Have you tried editing video on your mobile device or PC?', 'Graphical design'),
    (1, 'Do you like to take online intelligence tests?', 'Programming'),
    (1, 'Do you find numbers and logic is preferred over philosophical questions?', 'Programming'),
    (1, 'Are you interested in coding and learning to either understand or code yourself?', 'Programming'),
    (1, 'Have you tried building a website with a CMS like wordpress or Wix?', 'Programming'),
    (1, 'Are you very active on Social Media?', 'Digital Marketing'),
	(1, 'Do you care about who likes and comments on your posts?', 'Digital Marketing'),
	(1, 'Do you find that Social Media influences your buying decisions?', 'Digital Marketing'),
	(1, 'Do you believe that Social Media is more effective than traditional marketing?', 'Digital Marketing');

-- inserting data in order to test the functionality of the script
INSERT INTO test (test_id, name)
VALUE (1, 'what_course_fits_you_best?');

-- inserting data in order to test the functionality of the script
INSERT INTO user (first_name, last_name, birth_date, gender, country, email, category)
VALUE
('Madalina', 'Croitoru', '2000/01/01', 'Female', 'Denmark', 'mada@gmail.com', 'Graphical Designer'),
('Romana', 'Macejkova', '2000/02/02', 'Female', 'Denmark', 'roma@gmail.com', 'Programming'),
('Luiza', 'Gardeva', '2000/03/03', 'Female', 'Denmark', 'luiz@gmail.com', 'Digital Marketing');

-- inserting data in order to test the functionality of the script
INSERT INTO answer (answer, fk_question_id)
VALUE 
(true, 1),
(false, 2),
(true, 3),
(true, 4),
(false, 5),
(true, 6),
(true, 7),
(true, 8),
(false, 9),
(true, 10),
(true, 11),
(false, 12);

-- inserting data in order to test the functionality of the script
INSERT INTO user_has_answer (fk_user_id, fk_answer_id)
VALUE 
(1, 1),
(2, 2),
(3, 3),
(1, 4),
(2, 5),
(3, 6),
(1, 7),
(2, 8),
(3, 9),
(1, 10),
(2, 11),
(3, 12);

-- inserting data in order to test the functionality of the script
INSERT INTO takes (fk_user, fk_test)
VALUE
('1', '1'),
('2', '1'),
('3', '1');

-- selecting which users had taken which test 
SELECT 
user.user_id, first_name, last_name, name AS 'quiz name'
FROM takes
JOIN user ON takes.fk_user = user.user_id
JOIN test ON takes.fk_test = test.test_id;

-- Full select without grouping based on category by user number 1
SELECT * FROM question
JOIN answer ON question.question_id = answer.fk_question_id
JOIN user_has_answer ON answer.answer_id = user_has_answer.fk_answer_id
WHERE fk_user_id = 1 and question.fk_test_id = 1;

-- Retrieving number of counts per category by user number 1
SELECT fk_user_id, category, COUNT(category) FROM question
JOIN answer ON question.question_id = answer.fk_question_id
JOIN user_has_answer ON answer.answer_id = user_has_answer.fk_answer_id
WHERE fk_user_id = 1 and question.fk_test_id = 1
GROUP BY (category);

