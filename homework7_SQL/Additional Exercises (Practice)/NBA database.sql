CREATE DATABASE NBA_db;

USE NBA_db;

SELECT players.player, players.height, players.weight, players.college, players.born, seasons_stats.pos, seasons_stats.tm
FROM players
INNER JOIN seasons_stats ON
players.player = seasons_stats.player;

SELECT seasons_stats.player ,players.college, seasons_stats.year, seasons_stats.pos, ROUND(seasons_stats.`2P%`,2), ROUND(seasons_stats.`FG%`,2),
	ROUND(seasons_stats.`FT%`,2), ROUND(seasons_stats.`TS%`,2)
    FROM Players
    INNER JOIN seasons_stats ON
    players.player = seasons_stats.player;

SELECT seasons_stats.player, players.college, seasons_stats.year, seasons_stats.pos, seasons_stats.`2P%`,
seasons_stats.`FG%`, seasons_stats.`FT%`, seasons_stats.`TS%`
FROM seasons_stats
INNER JOIN players ON
players.player = seasons_stats.player;
