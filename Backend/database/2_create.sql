-- SIIA TULEB PÄRAST VERTABELO SQL EXPORT LINES (ENNE SEDA EI TASU PUUTUDA)
-- Created by Redgate Data Modeler (https://datamodeler.redgate-platform.com)
-- Last modification date: 2026-02-15 15:55:21.217

-- tables
-- Table: category
CREATE TABLE category (
                          id bigserial  NOT NULL,
                          name varchar(100)  NOT NULL,
                          description varchar(100)  NOT NULL,
                          is_active boolean  NOT NULL,
                          CONSTRAINT category_pk PRIMARY KEY (id)
);

-- Table: game
CREATE TABLE game (
                      id bigserial  NOT NULL,
                      name varchar(50)  NOT NULL,
                      category_id bigint  NOT NULL,
                      description varchar(150)  NOT NULL,
                      questions varchar(500)  NULL,
                      is_active boolean  NOT NULL,
                      CONSTRAINT game_pk PRIMARY KEY (id)
);

-- Table: game_step
CREATE TABLE game_step (
                           id bigserial  NOT NULL,
                           game_id bigint  NOT NULL,
                           step_discussion varchar(200)  NULL,
                           step_order int  NOT NULL,
                           CONSTRAINT game_step_pk PRIMARY KEY (id)
);

-- Table: media
CREATE TABLE media (
                       id bigserial  NOT NULL,
                       game_step_id bigint  NOT NULL,
                       media_type varchar(50)  NOT NULL,
                       file_url varchar(200)  NOT NULL,
                       CONSTRAINT media_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: game_category (table: game)
ALTER TABLE game ADD CONSTRAINT game_category
    FOREIGN KEY (category_id)
        REFERENCES category (id)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: game_step_game (table: game_step)
ALTER TABLE game_step ADD CONSTRAINT game_step_game
    FOREIGN KEY (game_id)
        REFERENCES game (id)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: media_game_step (table: media)
ALTER TABLE media ADD CONSTRAINT media_game_step
    FOREIGN KEY (game_step_id)
        REFERENCES game_step (id)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- End of file.

