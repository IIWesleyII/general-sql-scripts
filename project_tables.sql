use db;
--
if not exists (select * from sysobjects where name='product' and xtype='U')
	CREATE TABLE product(
		id BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
		prod_name VARCHAR(50) NOT NULL UNIQUE,
		prod_date DATETIME NOT NULL,
		prod_desc TEXT NOT NULL,
		prod_vers VARCHAR(25) NOT NULL,
		-- development or maitenance
		prod_development_stage VARCHAR(25) NOT NULL CHECK (prod_development_stage = 'Development' OR prod_development_stage = 'Maintenance')
);

CREATE UNIQUE INDEX product_id
ON product(id);
--

--
if not exists (select * from sysobjects where name='task' and xtype='U')
	CREATE TABLE task(
		id BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
		task_name VARCHAR(50),
		task_desc TEXT NOT NULL,
		task_date DATETIME NOT NULL,
		fk_prod_id BIGINT FOREIGN KEY REFERENCES product(id)

	);

CREATE UNIQUE INDEX task_id
ON task(id);

--
if not exists (select * from sysobjects where name='bug' and xtype='U')
	CREATE TABLE bug(
		id BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
		bug_name VARCHAR(50),
		bug_desc TEXT NOT NULL,
		fk_task_id BIGINT FOREIGN KEY REFERENCES task(id),
		-- 1 == yes 0 == no
		priority_task BIT NOT NULL

	);

CREATE UNIQUE INDEX bug_id
ON bug(id);
--

if not exists (select * from sysobjects where name='feature' and xtype='U')
	CREATE TABLE feature(
		id BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
		feature_name VARCHAR(50),
		feature_desc TEXT,
		fk_task_id BIGINT FOREIGN KEY REFERENCES task(id),
		priority_task BIT NOT NULL,
		deprecated_feature BIT NOT NULL
	);

CREATE UNIQUE INDEX feature_id
ON feature(id);
--

if not exists (select * from sysobjects where name='user_story' and xtype='U')
	CREATE TABLE user_story(
		id BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
		user_story_name VARCHAR(50),
		user_story_desc TEXT NOT NULL,
		fk_task_id BIGINT FOREIGN KEY REFERENCES task(id),
		priority_task BIT NOT NULL
	);

CREATE UNIQUE INDEX user_story_id
ON user_story(id);






-- select tables



SELECT * FROM product;
SELECT * FROM task;


--drop tables

DROP TABLE user_story;
DROP TABLE feature;
DROP TABLE bug;
DROP TABLE task;
DROP TABLE product;
