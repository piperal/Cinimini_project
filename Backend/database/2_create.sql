-- SIIA TULEB PÄRAST VERTABELO SQL EXPORT LINES (ENNE SEDA EI TASU PUUTUDA)
-- Created by Redgate Data Modeler (https://datamodeler.redgate-platform.com)
-- Last modification date: 2026-02-15 15:55:21.217

-- tables
-- Table: category
CREATE TABLE category
(
    id          bigserial    NOT NULL,
    name        varchar(100) NOT NULL,
    description varchar(100) NOT NULL,
    is_active   boolean      NOT NULL,
    CONSTRAINT category_pk PRIMARY KEY (id)
);

-- Table: game
CREATE TABLE game
(
    id          bigserial    NOT NULL,
    name        varchar(50)  NOT NULL,
    category_id bigint       NOT NULL,
    description varchar(150) NOT NULL,
    is_active   boolean      NOT NULL,
    CONSTRAINT game_pk PRIMARY KEY (id)
);

ALTER TABLE game
    ADD CONSTRAINT game_category
        FOREIGN KEY (category_id)
            REFERENCES category (id)
            NOT DEFERRABLE
                INITIALLY IMMEDIATE;

-- Table: game_step
CREATE TABLE game_step
(
    id         bigserial NOT NULL,
    game_id    bigint    NOT NULL,
    step_order int       NOT NULL,
    CONSTRAINT game_step_pk PRIMARY KEY (id)
);

ALTER TABLE game_step
    ADD CONSTRAINT game_step_game
        FOREIGN KEY (game_id)
            REFERENCES game (id)
            NOT DEFERRABLE
                INITIALLY IMMEDIATE;

ALTER TABLE game_step
    ADD CONSTRAINT game_step_order_uq
        UNIQUE (game_id, step_order);

-- Table: discussion_point
CREATE TABLE discussion_point
(
    id               bigserial    NOT NULL,
    game_step_id     bigint       NOT NULL,
    discussion_text  varchar(300) NOT NULL,
    is_active        boolean      NOT NULL,
    discussion_order int          NOT NULL,
    CONSTRAINT discussion_point_pk PRIMARY KEY (id)
);

ALTER TABLE discussion_point
    ADD CONSTRAINT discussion_point_game_step
        FOREIGN KEY (game_step_id)
            REFERENCES game_step (id)
            ON DELETE CASCADE
            NOT DEFERRABLE
                INITIALLY IMMEDIATE;

ALTER TABLE discussion_point
    ADD CONSTRAINT discussion_point_order_uq
        UNIQUE (game_step_id, discussion_order);

-- Table: question
CREATE TABLE question
(
    id             bigserial    NOT NULL,
    game_step_id   bigint       NOT NULL,
    question_text  varchar(300) NOT NULL,
    is_active      boolean      NOT NULL,
    question_order int          NOT NULL,
    CONSTRAINT question_pk PRIMARY KEY (id)
);

ALTER TABLE question
    ADD CONSTRAINT question_game_step
        FOREIGN KEY (game_step_id)
            REFERENCES game_step (id)
            ON DELETE CASCADE
            NOT DEFERRABLE
                INITIALLY IMMEDIATE;

ALTER TABLE question
    ADD CONSTRAINT question_order_uq
        UNIQUE (game_step_id, question_order);


-- Table: media
CREATE TABLE media
(
    id           bigserial    NOT NULL,
    game_step_id bigint       NOT NULL,
    media_type   varchar(50)  NOT NULL,
    file_url     varchar(200) NOT NULL,
    CONSTRAINT media_pk PRIMARY KEY (id)
);

ALTER TABLE media
    ADD CONSTRAINT media_game_step
        FOREIGN KEY (game_step_id)
            REFERENCES game_step (id)
            ON DELETE CASCADE
            NOT DEFERRABLE
                INITIALLY IMMEDIATE;

-- End of file.