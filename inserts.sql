use db;
/*
*	INSERT INTO DATABASE
*	
*
*
*/
-- product --> task --> bug || feature || user_story || 

--product
INSERT INTO product(prod_name, prod_date, prod_desc, prod_vers, prod_development_stage) VALUES('Company Email',CURRENT_TIMESTAMP,'Internal email service for the company.', '1.0.2.0', 'Maintenance');
INSERT INTO product(prod_name, prod_date, prod_desc, prod_vers, prod_development_stage) VALUES('Sales Analysis Tool',CURRENT_TIMESTAMP,'Tool for analyzing company profits.', '3.1.0.0','Maintenance');
INSERT INTO product(prod_name, prod_date, prod_desc, prod_vers, prod_development_stage) VALUES('Legal Document Generator',CURRENT_TIMESTAMP,'Ai assisted program to generate legal documents between two parties', '1.0.0.0','Development');
INSERT INTO product(prod_name, prod_date, prod_desc, prod_vers, prod_development_stage) VALUES('Accounting Program',CURRENT_TIMESTAMP,'Internal acounting software', '7.2.1.0', 'Maintenance');
--task
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

--bugs
INSERT INTO bug(bug_name, bug_desc, fk_task_id, priority_task) VALUES ('UI Scaling','The send icon when sending email needs to fit normally.', 1, 0)
INSERT INTO bug(bug_name, bug_desc, fk_task_id, priority_task) VALUES ('Authentication error for president','something is keeping the president from accessing his emails', 3, 1)-- priority task
INSERT INTO bug(bug_name, bug_desc, fk_task_id, priority_task) VALUES ('Authentication error for users with long names','When a username is longer than 20 but less than 24 characters Auth failure occurs.', 4, 0)
INSERT INTO bug(bug_name, bug_desc, fk_task_id, priority_task) VALUES ('UI Scaling','The exit icon in the dialouge boxes are too small.', 10, 0)
--user_stories
INSERT INTO user_story(user_story_name, user_story_desc, fk_task_id, priority_task) VALUES('UI Dark mode setting','User requests a dark mode setting.',2,0)
INSERT INTO user_story(user_story_name, user_story_desc, fk_task_id, priority_task) VAlUES('UI Font change','User requests font changed to something more professional.',5,0)
INSERT INTO user_story(user_story_name, user_story_desc, fk_task_id, priority_task) VAlUES('Currency conversion with pesos','High Profile client requests Peso compatability with accounting tool.', 11,1)
--features
INSERT INTO feature(feature_name, feature_desc, fk_task_id, priority_task, deprecated_feature) VALUES('Intern tool access', '[DEPRECATED FEATURE]Enable intern tool access to meet product timeline faster. ',6,0,1)
INSERT INTO feature(feature_name, feature_desc, fk_task_id, priority_task, deprecated_feature) VALUES('API endpoints for public access', 'Create endpoints for the public so they can use our software.', 7,0,0)
INSERT INTO feature(feature_name, feature_desc, fk_task_id, priority_task, deprecated_feature) VALUES('Password complexity checker', 'Create feature that analyzes password complexity before user submits on sign up page.', 8,0,0)
INSERT INTO feature(feature_name, feature_desc, fk_task_id, priority_task, deprecated_feature) VALUES('Homepage navbar', ' Create navbar for when users login.', 9,0,0)






SELECT * FROM product;
SELECT * FROM task;
SELECT * FROM bug;


