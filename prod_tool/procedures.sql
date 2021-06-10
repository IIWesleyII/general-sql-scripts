use db;

/*
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
-----------------------------------------------------------------------------------------------------
/*
*	Count features , user stories , tasks and bugs
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

/*
*
*
*/
