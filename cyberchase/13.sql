/* QST: Write SQL query to list all the episodes that are after 2010 and talk about fractions */
SELECT title, topic FROM episodes WHERE air_date > '2009-12-31' AND topic LIKE "%fraction%";
