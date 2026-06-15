
drop table if EXISTS Player;

CREATE TABLE Match
(
  match_id  INTEGER  NOT NULL,
  matchDate DATETIME NOT NULL,
  stadium   VARCHAR  NOT NULL,
  opponent  VARCHAR  NOT NULL,
  own_score INTEGER  NOT NULL,
  opp_score INTEGER  NOT NULL,
  PRIMARY KEY (match_id)
);

CREATE TABLE Player
(
  player_id    INTEGER NOT NULL,
  name         VARCHAR NOT NULL,
  age          INTEGER NOT NULL,
  season_score INTEGER NOT NULL,
  PRIMARY KEY (player_id)
);

CREATE TABLE Match_player
(
  score     VARCHAR NOT NULL,
  match_id  INTEGER NOT NULL,
  player_id INTEGER NOT NULL,
  FOREIGN KEY (match_id) REFERENCES Match (match_id),
  FOREIGN KEY (player_id) REFERENCES Player (player_id)
);


