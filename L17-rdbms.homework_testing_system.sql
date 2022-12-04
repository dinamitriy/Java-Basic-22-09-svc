CREATE DATABASE db1;
	
CREATE SCHEMA IF NOT EXISTS homework_testing_system
    AUTHORIZATION pg_database_owner;
GRANT USAGE ON SCHEMA homework_testing_system TO PUBLIC;
GRANT ALL ON SCHEMA homework_testing_system TO pg_database_owner;

CREATE TABLE "homework_testing_system"."QUESTION"
(
  ID_QUESTION  		       SERIAL         PRIMARY KEY,
  NM_QUESTION  			   VARCHAR(200)   NOT NULL,
  ANSWER_OPTIONS   	       VARCHAR(500)[] NOT NULL,
  CORRECT_ANSWER           INTEGER        NOT NULL
);

COMMENT ON COLUMN homework_testing_system."QUESTION".ID_QUESTION IS 'Идентификатор вопроса';
COMMENT ON COLUMN homework_testing_system."QUESTION".NM_QUESTION IS 'Текст вопроса';
COMMENT ON COLUMN homework_testing_system."QUESTION".ANSWER_OPTIONS IS 'Текст ответов к вопросу';
COMMENT ON COLUMN homework_testing_system."QUESTION".CORRECT_ANSWER IS 'Номер корректного ответа на вопрос';

INSERT INTO
homework_testing_system."QUESTION"
(NM_QUESTION, ANSWER_OPTIONS, CORRECT_ANSWER)
VALUES
('В файл с каким расширением компилируется java-файл?', '{"*.class", "*.java", "*.exe", "*.com"}', 1),
('Как называется операция для выделения памяти под элементы массива?', '{"add", "clone", "new", "insert"}', 3),
('Какой применяется цикл, когда не известно количество итераций?', '{"while", "for", "loop"}', 1);

SELECT S.* FROM homework_testing_system."QUESTION" S;

SELECT Q.NM_QUESTION, Q.ANSWER_OPTIONS[1], Q.CORRECT_ANSWER
FROM homework_testing_system."QUESTION" Q 
where Q.id_question = 1;
