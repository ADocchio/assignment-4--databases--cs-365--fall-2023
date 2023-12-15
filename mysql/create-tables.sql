CREATE TABLE IF NOT EXISTS artist (
  artist_id   INT          NOT NULL,
  artist_name VARCHAR(128) NOT NULL,
  PRIMARY KEY (artist_id)
);

CREATE TABLE IF NOT EXISTS compiles (
  artist_id   INT          NOT NULL,
  album_id   INT          NOT NULL,
  PRIMARY KEY (artist_id, album_id)
);

CREATE TABLE IF NOT EXISTS album (
  artist_id  INT          NOT NULL,
  album_id   INT          NOT NULL,
  album_name VARCHAR(128) NOT NULL,
  PRIMARY KEY (artist_id, album_id)
);

CREATE TABLE IF NOT EXISTS contains (
  artist_id  INT          NOT NULL,
  album_id   INT          NOT NULL,
  track_id   INT          NOT NULL,
  PRIMARY KEY (artist_id, album_id, track_id)
);

CREATE TABLE IF NOT EXISTS track (
  artist_id  INT          NOT NULL,
  album_id   INT          NOT NULL,
  track_id   INT          NOT NULL,
  track_name VARCHAR(128) NOT NULL,
  time       DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (artist_id, album_id, track_id)
);

CREATE TABLE IF NOT EXISTS WasPlayedAt (
  artist_id  INT          NOT NULL,
  album_id   INT          NOT NULL,
  track_id   INT          NOT NULL,
  played     TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (artist_id, album_id, track_id, played)
);

CREATE TABLE IF NOT EXISTS played (
  artist_id  INT          NOT NULL,
  album_id   INT          NOT NULL,
  played     TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (artist_id, album_id, played)
);

-- Index's
CREATE INDEX artist_name_index ON artist(artist_name);

CREATE INDEX compiles_artist_index ON artist(artist_id);

CREATE INDEX album_name_index ON album(album_name);

CREATE INDEX compares_album_index ON album(album_id);

CREATE INDEX track_name_index ON track(track_name);

CREATE INDEX wasplayedat_track_index ON track(track_id);

CREATE INDEX played_name_index ON played(played);





