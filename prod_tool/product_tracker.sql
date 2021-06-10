/*
*	Mock Schema for 'product tracking tool'
*/

use db;
--
DROP TABLE IF EXISTS user_story;
DROP TABLE IF EXISTS feature;
DROP TABLE IF EXISTS bug;
DROP TABLE IF EXISTS task;
DROP TABLE IF EXISTS product;
--
---------------------------------------------------------------------------------------------------------------------------------------------
/*
*	product table:  
*		id : Primary key for product table
*		prod_name : The name of the product
*		prod_date  : The date and time the product was entered into the database
*		prod_desc : A short desciption of the product
*		prod_vers  : The current version of the product
*		prod_development_stage : The stage the product is in , Development or Maitenance 
*/
CREATE TABLE product(
	id BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	prod_name VARCHAR(50) NOT NULL UNIQUE,
	prod_date DATETIME NOT NULL,
	prod_desc TEXT NOT NULL,
	prod_vers VARCHAR(25) NOT NULL,
	prod_development_stage VARCHAR(25) NOT NULL CHECK (prod_development_stage = 'Development' OR prod_development_stage = 'Maintenance')
);

CREATE UNIQUE INDEX product_id
ON product(id);
---------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------
/*
*	task table:  
*		id : Primary key for task table
*		task_name : The name of the task
*		task_desc : A short description of the task
*		task_date : The date and time the product was entered into the database
*		fk_prod_id : Foreign key that refrences the product primary key product(id)
*/
CREATE TABLE task(
	id BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	task_name VARCHAR(50),
	task_desc TEXT NOT NULL,
	task_date DATETIME NOT NULL,
	fk_prod_id BIGINT FOREIGN KEY REFERENCES product(id)

);

CREATE UNIQUE INDEX task_id
ON task(id);
---------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------
/*
*	bug table:  
*		id : Primary key for bug table
*		bug_name : The name of the bug
*		bug_desc : A short description of the bug
*		fk_task_id : A foreign key that refrences the task table's primary key task(id)
*		priority_task : This field determines if a bug is a priority task or not.  
*						priority_task = 1, the bug is a priority task
*						priority_task = 0, the bug is not a priority task
*
*/
CREATE TABLE bug(
	id BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	bug_name VARCHAR(50),
	bug_desc TEXT NOT NULL,
	fk_task_id BIGINT FOREIGN KEY REFERENCES task(id),
	priority_task BIT NOT NULL

);

CREATE UNIQUE INDEX bug_id
ON bug(id);
---------------------------------------------------------------------------------------------------------------------------------------------
/*
*	feature table:  
*		id : Primary key for feature table
*		feature_name : The name of the feature
*		feature_desc : A short description of the feature
*		fk_task_id :  A foreign key that refrences the task table's primary key task(id)
*		priority_task : This field determines if a feature is a priority task or not.  
*						priority_task = 1, the feature is a priority task
*						priority_task = 0, the feature is not a priority task
*		deprecated_feature : This field determines if the feature has been deprecated
*							 deprecated_feature = 1, the feature is deprecated
*							 deprecated_feature = 0, the feature is not deprecated
*/
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
---------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------
/*
*	user_story table:  
*		id : Primary key for user_story table
*		user_story_name : The name of the user story
*		user_story_desc : A short description of the user story
*		fk_task_id : A foreign key that refrences the task table's primary key task(id)
*		priority_task : This field determines if a user story is a priority task or not.  
*						priority_task = 1, the user story is a priority task
*						priority_task = 0, the fuser story is not a priority task
*
*/

CREATE TABLE user_story(
	id BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	user_story_name VARCHAR(50),
	user_story_desc TEXT NOT NULL,
	fk_task_id BIGINT FOREIGN KEY REFERENCES task(id),
	priority_task BIT NOT NULL
);

CREATE UNIQUE INDEX user_story_id
ON user_story(id);

---------------------------------------------------------------------------------------------------------------------------------------------

/*
*
*	INSERTS for the database
*
*
*/
-- product --> task --> bug || feature || user_story || 

--product
INSERT INTO product(prod_name, prod_date, prod_desc, prod_vers, prod_development_stage) VALUES('Company Email',CURRENT_TIMESTAMP,'Internal email service for the company.', '1.0.2.0', 'Maintenance');
INSERT INTO product(prod_name, prod_date, prod_desc, prod_vers, prod_development_stage) VALUES('Sales Analysis Tool',CURRENT_TIMESTAMP,'Tool for analyzing company profits.', '3.1.0.0','Maintenance');
INSERT INTO product(prod_name, prod_date, prod_desc, prod_vers, prod_development_stage) VALUES('Legal Document Generator',CURRENT_TIMESTAMP,'Ai assisted program to generate legal documents between two parties', '1.0.0.0','Development');
INSERT INTO product(prod_name, prod_date, prod_desc, prod_vers, prod_development_stage) VALUES('Accounting Program',CURRENT_TIMESTAMP,'Internal acounting software', '7.2.1.0', 'Maintenance');
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
*	INSERT into task table
*/
--Company Email
INSERT INTO task(task_name, task_desc, task_date, fk_prod_id) VALUES ('UI fix','Fix the send button so it is centered on page.', CURRENT_TIMESTAMP, 1) -- bug 
INSERT INTO task(task_name, task_desc, task_date, fk_prod_id) VALUES ('UI fix','User requested dark mode as UI setting', CURRENT_TIMESTAMP, 1) --user_story 
INSERT INTO task(task_name, task_desc, task_date, fk_prod_id) VALUES ('Auth Error','Company president is locked out of email.', CURRENT_TIMESTAMP, 1) --bug 
--Sales Analysis Tool
INSERT INTO task(task_name, task_desc, task_date, fk_prod_id) VALUES ('Auth Error','error where user can be denied access.', CURRENT_TIMESTAMP, 2) --bug 
INSERT INTO task(task_name, task_desc, task_date, fk_prod_id) VALUES ('UI fix','User requested change font.', CURRENT_TIMESTAMP, 2) --user_story
INSERT INTO task(task_name, task_desc, task_date, fk_prod_id) VALUES ('Access Error','Enable interns access to tool.', CURRENT_TIMESTAMP, 2) -- feature
--Legal Document Generator
INSERT INTO task(task_name, task_desc, task_date, fk_prod_id) VALUES ('API','Create end points for internal API.', CURRENT_TIMESTAMP, 3) --feature
INSERT INTO task(task_name, task_desc, task_date, fk_prod_id) VALUES ('Login','Dynamic password checker.', CURRENT_TIMESTAMP, 3) --feature
INSERT INTO task(task_name, task_desc, task_date, fk_prod_id) VALUES ('UI','Homepage navbar', CURRENT_TIMESTAMP, 3) --feature
--Accounting Program
INSERT INTO task(task_name, task_desc, task_date, fk_prod_id) VALUES ('UI fix','Fix the exit button so it is the right size.', CURRENT_TIMESTAMP, 4) -- bug 
INSERT INTO task(task_name, task_desc, task_date, fk_prod_id) VALUES ('Compatability','User requested peso conversion.', CURRENT_TIMESTAMP, 4) --user_story
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
*	INSERT into bug table
*/
--bugs
INSERT INTO bug(bug_name, bug_desc, fk_task_id, priority_task) VALUES ('UI Scaling','The send icon when sending email needs to fit normally.', 1, 0)
INSERT INTO bug(bug_name, bug_desc, fk_task_id, priority_task) VALUES ('Authentication error for president','something is keeping the president from accessing his emails', 3, 1)-- priority task
INSERT INTO bug(bug_name, bug_desc, fk_task_id, priority_task) VALUES ('Authentication error for users with long names','When a username is longer than 20 but less than 24 characters Auth failure occurs.', 4, 0)
INSERT INTO bug(bug_name, bug_desc, fk_task_id, priority_task) VALUES ('UI Scaling','The exit icon in the dialouge boxes are too small.', 10, 0)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
*	INSERT into user_story table
*/
--user_stories
INSERT INTO user_story(user_story_name, user_story_desc, fk_task_id, priority_task) VALUES('UI Dark mode setting','User requests a dark mode setting.',2,0)
INSERT INTO user_story(user_story_name, user_story_desc, fk_task_id, priority_task) VAlUES('UI Font change','User requests font changed to something more professional.',5,0)
INSERT INTO user_story(user_story_name, user_story_desc, fk_task_id, priority_task) VAlUES('Currency conversion with pesos','High Profile client requests Peso compatability with accounting tool.', 11,1)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
*	INSERT into feature table
*/
--features
INSERT INTO feature(feature_name, feature_desc, fk_task_id, priority_task, deprecated_feature) VALUES('Intern tool access', '[DEPRECATED FEATURE]Enable intern tool access to meet product timeline faster. ',6,0,1)
INSERT INTO feature(feature_name, feature_desc, fk_task_id, priority_task, deprecated_feature) VALUES('API endpoints for public access', 'Create endpoints for the public so they can use our software.', 7,0,0)
INSERT INTO feature(feature_name, feature_desc, fk_task_id, priority_task, deprecated_feature) VALUES('Password complexity checker', 'Create feature that analyzes password complexity before user submits on sign up page.', 8,0,0)
INSERT INTO feature(feature_name, feature_desc, fk_task_id, priority_task, deprecated_feature) VALUES('Homepage navbar', ' Create navbar for when users login.', 9,0,0)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*
*
*	PROCEDURES for the database
*
*
*/

-----------------------------------------------------------------------------------------------------
/*
*	PROCEDURE rptCounts
*	returns the counts of features, user stories, tasks and bugs
*
*/

DROP PROCEDURE IF EXISTS rptCounts;
GO

CREATE PROCEDURE rptCounts
AS BEGIN
	SELECT COUNT(id) AS total_task FROM task;
	SELECT COUNT(id) AS total_bug FROM bug;
	SELECT COUNT(id) AS total_feature FROM bug;
	SELECT COUNT(id) AS total_user_story FROM user_story; 
END;
GO

EXEC rptCounts;
GO
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
/*
*	PROCEDURE updVersionToDec
*	updates Version number to the format: x.x.x.x0  (e.g., 1.1.9.10)
*/

DROP PROCEDURE IF EXISTS updVersionToDec;
GO

CREATE PROCEDURE updVersionToDec
AS BEGIN

UPDATE product
	SET prod_vers += '0'
END;
GO

EXEC updVersionToDec;
GO
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------

/*
*	PROCEDURE all_product
*	Return all products
*
*/

DROP PROCEDURE IF EXISTS all_product;
GO

CREATE PROCEDURE all_product
-- returns all products
AS BEGIN
	SELECT * FROM product;
END;
GO

EXEC all_product;
GO
