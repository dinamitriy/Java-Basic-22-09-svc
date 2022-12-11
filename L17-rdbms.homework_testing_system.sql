CREATE DATABASE db1;
	
CREATE SCHEMA IF NOT EXISTS homework_testing_system
    AUTHORIZATION pg_database_owner;
GRANT USAGE ON SCHEMA homework_testing_system TO PUBLIC;
GRANT ALL ON SCHEMA homework_testing_system TO pg_database_owner;

CREATE TABLE IF NOT EXISTS homework_testing_system."QUESTION"
(
    id_question		SERIAL			PRIMARY KEY,
    nm_question		VARCHAR(200)	NOT NULL
												   
												  
);

COMMENT ON TABLE homework_testing_system."QUESTION" IS 'Вопросы';
COMMENT ON COLUMN homework_testing_system."QUESTION".ID_QUESTION IS 'Идентификатор вопроса';
COMMENT ON COLUMN homework_testing_system."QUESTION".NM_QUESTION IS 'Текст вопроса';
																													 
																	 

INSERT INTO
homework_testing_system."QUESTION"
(NM_QUESTION)
VALUES
('В файл с каким расширением компилируется java-файл?'),
('Как называется операция для выделения памяти под элементы массива?'),
('Какой применяется цикл, когда не известно количество итераций?');

SELECT S.id_question, S.nm_question 
FROM homework_testing_system."QUESTION" S;

CREATE TABLE IF NOT EXISTS homework_testing_system."ANSWER"
(
    id_answer		SERIAL			PRIMARY KEY,
    nm_answer		VARCHAR(100)	NOT NULL
);

COMMENT ON TABLE homework_testing_system."ANSWER" IS 'Ответы';
COMMENT ON COLUMN homework_testing_system."ANSWER".id_answer IS 'Идентификатор ответа';
COMMENT ON COLUMN homework_testing_system."ANSWER".nm_answer IS 'Текст ответа';

INSERT INTO
homework_testing_system."ANSWER"
(nm_answer)
VALUES
('*.class'),
('*.java'),
('*.exe'),
('*.com'),
('add'),
('clone'),
('new'),
('insert'),
('while'),
('for'),
('loop');

SELECT AN.id_answer, AN.nm_answer
FROM homework_testing_system."ANSWER" AN;

CREATE TABLE IF NOT EXISTS homework_testing_system."Question_to_answer"
(
	id_question 	INTEGER		REFERENCES homework_testing_system."QUESTION" (ID_QUESTION),
    id_answer 		INTEGER		REFERENCES homework_testing_system."ANSWER" (id_answer)
);

COMMENT ON TABLE homework_testing_system."Question_to_answer" IS 'Ответы на вопросы';
COMMENT ON COLUMN homework_testing_system."Question_to_answer".id_question IS 'Идентификатор вопроса';
COMMENT ON COLUMN homework_testing_system."Question_to_answer".id_answer IS 'Идентификатор ответа';

ALTER TABLE homework_testing_system."Question_to_answer"
	ADD CONSTRAINT Question_to_answer_KEY
    PRIMARY KEY (id_question, id_answer);

INSERT INTO
homework_testing_system."Question_to_answer"
(id_question, id_answer)
VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 7),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(3, 9),
(3, 10),
(3, 11);

SELECT QA.id_question, QA.id_answer
FROM homework_testing_system."Question_to_answer" QA;

-- У одного вопроса несколько ответов
SELECT QA.id_question, QA.id_answer
FROM homework_testing_system."Question_to_answer" QA
WHERE QA.id_question = 1;

-- Один ответ у нескольких разных вопросов
SELECT QA.id_question, QA.id_answer
FROM homework_testing_system."Question_to_answer" QA
WHERE QA.id_answer = 7;
