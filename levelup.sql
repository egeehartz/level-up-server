SELECT * FROM levelupapi_gametype;
SELECT * FROM auth_user;
SELECT * FROM authtoken_token;
SELECT * FROM levelupapi_gamer;



SELECT * FROM levelupapi_game;
SELECT * FROM levelupapi_event;



SELECT
    e.id,
    e.day,
    e.time,
    e.location,
    e.game_id,
    u.id user_id,
    u.first_name || ' ' || u.last_name AS full_name
FROM
    levelupapi_event e
JOIN
    levelupapi_gamer gr ON e.gamer_id = gr.id
JOIN
    auth_user u ON gr.user_id = u.id;

SELECT
    g.id,
    g.title,
    g.gametype_id,
    g.number_of_players,
    g.skill_level,
    u.id user_id,
    u.first_name || ' ' || u.last_name AS full_name
FROM
    levelupapi_game g
JOIN
    levelupapi_gamer gr ON g.gamer_id = gr.id
JOIN
    auth_user u ON gr.user_id = u.id;