/*
	Me pasó probando el ETL que agregó registros
	con id's nulas XD
*/

ALTER TABLE KOG_2024
ALTER COLUMN player_id SET NOT NULL,
ALTER COLUMN deck_id SET NOT NULL,
ALTER COLUMN skill_id SET NOT NULL
ALTER COLUMN updater_label SET NOT NULL;