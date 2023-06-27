--1. Наполнить произвольными данными таблицы streams, reactions, donations
INSERT INTO streams (stream_id, created_at, author_id, title, is_completed)
VALUES
	 (1, CURRENT_TIMESTAMP, NULL, 'First', false),
	 (2, CURRENT_TIMESTAMP, NULL, 'Second', false),
	 (3, CURRENT_TIMESTAMP, NULL, 'Third', false),
     (4, CURRENT_TIMESTAMP, NULL, 'Fourth', false),
     (5, CURRENT_TIMESTAMP, NULL, 'Fifth', false);


     INSERT INTO reactions (reaction_id, created_at, author_id, stream_id, `value`)
VALUES
	 (1, CURRENT_TIMESTAMP, NULL, 1, NULL),
	 (2, CURRENT_TIMESTAMP, NULL, 2, NULL),
	 (3, CURRENT_TIMESTAMP, NULL, 3, NULL),
     (4, CURRENT_TIMESTAMP, NULL, 4, NULL),
     (5, CURRENT_TIMESTAMP, NULL, 5, NULL);


     INSERT INTO donations (donation_id, created_at, amount, donator_id, stream_id)
VALUES
	 (1, CURRENT_TIMESTAMP, 127.00, 1, NULL),
	 (2, CURRENT_TIMESTAMP, 45.50, 2, NULL),
	 (3, CURRENT_TIMESTAMP, 300.00, 3, NULL),
     (4, CURRENT_TIMESTAMP, 450.25, 4, NULL),
     (5, CURRENT_TIMESTAMP, 25.50, 5, NULL);

--2.Вывести информацию по стримам (проекция: имя_автора, название_стрима)
    SELECT username, title
    FROM streams as S 
    LEFT JOIN users AS U ON S.author_id = U.user_id




--3.Вывести список пожертвований в порядке убывания размера (проекция: размерпожертвования, имя донатара, название_стрима)
SELECT D.amount, U.username, S.title AS Stream_title
    FROM donations as D 
    LEFT JOIN users AS U ON D.donator_id=U.user_id
    LEFT JOIN streams AS S ON D.stream_id=S.stream_id

--3(Второй вариант запроса) Вывести список пожертвований в порядке убывания размера (проекция: размерпожертвования, имя донатара, название_стрима)  
    SELECT D.amount, U.username, S.title AS Stream_title
    FROM donations as D 
    JOIN users AS U ON D.donator_id=U.user_id
    LEFT JOIN streams AS S USING (stream_id)


