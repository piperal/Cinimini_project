-- PRAEGU EI TASU NÄPPIDA
/* comment IN, kui jõuame useriteni
INSERT INTO public.role (id, name)
VALUES (default, 'admin');
INSERT INTO public.role (id, name)
VALUES (default, 'teacher');
*/


INSERT INTO public.category (id, name, description, is_active) VALUES (default, 'Heli', 'See mäng on heli baasil', true);
INSERT INTO public.category (id, name, description, is_active) VALUES (default, 'Video', 'See mäng on video baasil', true);
INSERT INTO public.category (id, name, description, is_active) VALUES (default, 'Pilt', 'See mäng on pildi baasil', true);


INSERT INTO public.game (id, name, category_id, description, questions, is_active) VALUES (default, 'Mida näed pildilt?' , 3 , 'Mäng hõlmab endas pildilt muutuste leidmist ja selle üle arutlemist.', 'Mida see pilt sind tundma paneb? Kas sinu emotsiooni mõjutab fakt, et pilt on värvitu/värvilie?', true);


INSERT INTO public.game_step (id, game_id, step_discussion, step_order) VALUES (default, 1, 'Mis on pildil?', 1);


INSERT INTO public.media (id, game_step_id, media_type, file_url) VALUES (default, 1, 'image', '/media/images/Raul.png');
