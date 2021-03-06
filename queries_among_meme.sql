/* TODAS LAS QUERIES DE LA BASE DE DATOS DE AMONG MEME: THE GAME */

/* ELIMINAMOS TODAS LAS TABLAS PRIMERO */

DROP TABLE IF EXISTS skills;

DROP TABLE IF EXISTS stats;

DROP TABLE IF EXISTS characters_armors;
DROP TABLE IF EXISTS armors;
DROP TABLE IF EXISTS armors_types;

DROP TABLE IF EXISTS characters_weapons;
DROP TABLE IF EXISTS weapons;
DROP TABLE IF EXISTS weapons_types;

DROP TABLE IF EXISTS characters_items;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS items_types;

DROP TABLE IF EXISTS characters;

/* CREAMOS LAS TABLAS */

/* CREAR TABLA CHARACTERS E INSERTAR LOS PERSONAJES*/
CREATE TABLE characters (
	id_character INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(16) NOT NULL,
	age INT NOT NULL,
	birthdate DATE,
	hp INT NOT NULL,
	gender CHAR(1) NOT NULL,
	style CHAR(1) NOT NULL,
	mana INT NOT NULL,
	class CHAR(2) NOT NULL,
	race CHAR(2) NOT NULL,
	xp INT NOT NULL,
	level INT NOT NULL,
	height FLOAT NOT NULL
);
INSERT INTO characters (name,age,hp,gender,style,mana,class,race,xp,`level`,height) 
VALUES
	('Jacinto',12309,999,'F','R',100000,'Mg','Sg',1000000,0,2.1),
	('Alejandro',2,0,'M','M',1,'De','Nd',100,2,1.2),
	('Paca',43,100,'F','G',0,'Wa','Lo',500,70,4.52),
	('Maricarmen',2,100,'N','H',100,'T','B',200,100,0.25);

/*--------------------------------------------------------------*/

/* CREAR TABLA ITEMS-TYPES E INSERTAR LOS TIPOS*/
CREATE TABLE items_types (
	id_item_type INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	type VARCHAR(16) NOT NULL
);
/* INSERTAMOS LOS TIPOS DE ITEMS */
INSERT INTO items_types (type)
VALUES
	("Otros"),
	("Equipable"),
	("Consumible"),
	("Clave");


/* CREAR TABLA ITEMS E INSERTAR LOS ITEMS */
CREATE TABLE items (
    	id_item INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    	item VARCHAR(24) NOT NULL,
	cost INT NOT NULL,
	consumable BOOLEAN NOT NULL,
	tradeable BOOLEAN NOT NULL,
	weight INT NOT NULL,
	image VARCHAR(32),
	description TEXT,
	id_item_type INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_item_type) REFERENCES items_types(id_item_type)
);
INSERT INTO items (item,cost,consumable,tradeable,weight,image,description,id_item_type)
VALUES
	("Poción de vida", 25, true, true, 0.2, "health_potion.png", "Una poción que recupera vida", 3),
	("Gafas de sol", 100, false, true, 0.1, "sunglasses.png", "Gafas de sol facheritas", 2),
	("Guijarro", 0, false, false, 0.35, "small_stone.png", "Pequeña piedra que encuentras en el suelo y lo pudes tirar a alguien supongo", 1),
	("Agua de río", 1000, true, false, 0.5, "river_water.png", "Agua del río con propiedades medicinales que recupera energía de vitalidad", 4),
	("Manzana", 3, true, true, 0.3, "apple.png", "Manzana Pro",3),
	("Llave", 25, false, false, 0.1, "key.png", "Llve que abre la puerta del destino", 4),
	("Gran Anillo", 300, false, true, 0.25, "big_ring.png", "Gran anillo de las profundidades", 2),
	("Papel", 2, false, true, 0.02, "paper.png", "Papel pequeño en blanco",3);

/* CREAR TABLA CHARACTERS-ITEMS E INSERTAR LAS "RELACIONES"*/
CREATE TABLE characters_items (
	id_character_item INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_character INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_character) REFERENCES characters(id_character),
	id_item INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_item) REFERENCES items(id_item)
);
INSERT INTO characters_items (id_character,id_item)
VALUES
	(1,1),(1,3),(1,4),(2,1),(3,2);

/*----------------------------------------------------------------------*/

/* CREAR TABLA WEAPONS_TYPES E INSERTAR TIPOS DE ARMAS */
CREATE TABLE weapons_types(
	id_weapon_type INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	type VARCHAR(24) NOT NULL
);
INSERT INTO weapons_types(type)
VALUES
	('Espada'),('Lanza'),('Hacha');

/* CREAR TABLA WEAPONS E INSERTAR ARMAS */
CREATE TABLE weapons(
	id_weapon INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	weapon VARCHAR(16) NOT NULL,
	damage INT NOT NULL,
	quality INT NOT NULL,
	rarity INT NOT NULL,
	weight INT NOT NULL,
	durability INT NOT NULL,
	`range` INT NOT NULL,
	id_weapon_type INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_weapon_type) REFERENCES weapons_types(id_weapon_type)
);
INSERT INTO weapons(weapon, damage, quality, rarity, weight, durability, `range`, id_weapon_type)
VALUES
	('Espada larga',200,30,10,10,500,100,1),
	('Espada corta',100,5,5,10,300,50,1),
	('Lanza de Midgar',400,100,50,100,1000,400,2),
	('Lanza de Shojin',500,70,20,50,900,300,2),
	('Cuchilla Negra',250,50,700,30,1200,250,3);

/* CREAR TABLA CHARACTERS_WEAPONS E INSERTAR RELACIONES */
CREATE TABLE characters_weapons(
	id_character_weapon INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_character INT UNSIGNED NOT NULL,
	id_weapon INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_character) REFERENCES characters(id_character),
	FOREIGN KEY (id_weapon) REFERENCES weapons(id_weapon)
);
INSERT INTO characters_weapons (id_character,id_weapon)
VALUES
	(1,3), (2,2), (3,4), (4,3);

/*----------------------------------------------------------------------*/

/* CREAR TABLA ARMORS_TYPES E INSERTAR TIPOS DE ARMADURAS */
CREATE TABLE armors_types (
	id_armor_type INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	type VARCHAR(24) NOT NULL
);
INSERT INTO armors_types(type)
VALUES
	('Ligera'),('Mediana'),('Pesada');

/* CREAR TABLA ARMORS E INSERTAR ARMADURAS */
CREATE TABLE armors(
	id_armor INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	armoR VARCHAR(16) NOT NULL,
	defence INT NOT NULL,
	durability INT NOT NULL,
	weight INT NOT NULL,
	quality INT NOT NULL,
	rarity INT NOT NULL,
	toughness INT NOT NULL,
	id_armor_type INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_armor_type) REFERENCES armors_types(id_armor_type)
);

/* CREAR TABLA CHARACTERS_ARMORS E INSERTAR RELACIONES */
CREATE TABLE characters_armors(
	id_character_armor INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_character INT UNSIGNED NOT NULL,
	id_armor INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_character) REFERENCES characters(id_character),
	FOREIGN KEY (id_armor) REFERENCES armors(id_armor)
);

/*----------------------------------------------------------------------*/

/* CREAR TABLA STATS E INSERTAR ESTADÍSITCAS*/
CREATE TABLE stats (
	id_stat INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	intel INT,
	strength INT,
	speed INT,
	charisma INT,
	`level` INT,
	id_character INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_character) REFERENCES characters(id_character)
);
INSERT INTO stats (intel,strength,charisma,`level`,id_character) 
VALUES
	(33,22,333,33,1),(1,1,1,1,2),(75,2000,60,70,3),(9999,20,1,10,4);

/*----------------------------------------------------------------------*/

/* CREAR TABLA SKILLS E INSERTAR HABILIDADES */
CREATE TABLE skills(
	id_skill INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	skill VARCHAR(24) NOT NULL,
	description TEXT,
	icon VARCHAR(16)
);
