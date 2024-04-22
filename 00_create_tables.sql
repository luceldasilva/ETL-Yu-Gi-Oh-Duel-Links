/*
	Creación de Tablas para trabajar con los
	reportes de KOG y KC CUP's
*/

SET CLIENT_ENCODING TO 'UTF8';

CREATE TABLE IF NOT EXISTS decks (
	deck_id SERIAL PRIMARY KEY,
	deck VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS skills (
	skill_id SERIAL PRIMARY KEY,
	skill VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS players (
	player_id SERIAL PRIMARY KEY,
	nick VARCHAR(255),
	usuario_antiguo VARCHAR(255),
	created_at TIMESTAMP DEFAULT NOW(),
	Present_in_road_wcs_23 BOOLEAN -- Este ver si ya jugó antes
);

/*
	Tabla de hechos de KOG_2024
*/

CREATE TABLE IF NOT EXISTS KOG_2024 (
	id SERIAL PRIMARY KEY,
	player_id INT,
	deck_id INT,
	skill_id INT,
	kog_day DATE NOT NULL,
	zerotg BOOLEAN NOT NULL,
	zephra BOOLEAN NOT NULL,
	bryan BOOLEAN NOT NULL,
	xenoblur BOOLEAN NOT NULL,
	yamiglen BOOLEAN NOT NULL,
	latino_vania BOOLEAN NOT NULL,
	updater_label VARCHAR(32),
	created_at TIMESTAMP DEFAULT NOW()
);

-- Crear llaves foráneas

ALTER TABLE KOG_2024
ADD CONSTRAINT fk_KOG_2024_player_id 
	FOREIGN KEY (player_id) 
	REFERENCES players (player_id),
ADD CONSTRAINT fk_KOG_2024_deck_id 
	FOREIGN KEY (deck_id) 
	REFERENCES decks (deck_id),
ADD CONSTRAINT fk_KOG_2024_skill_id
	FOREIGN KEY (skill_id)
	REFERENCES skills (skill_id);

SET datestyle TO 'European';