
  
    

        create or replace transient table NETFLIX.SILVER.paises
         as
        (-- models/silver/paises.sql
WITH base AS (
  SELECT DISTINCT
    ROW_NUMBER() OVER (ORDER BY country_cleaned) AS "ID",
    country_cleaned AS "COUNTRY"
  FROM (
	  SELECT distinct
			TRIM(SPLIT(country, ', ')[0]) AS country_cleaned
		FROM
			NETFLIX.BRONZE.netflix_titles
		WHERE
			country IS NOT NULL AND country != ''
	)
  WHERE
		country_cleaned IS NOT NULL AND country_cleaned != ''
)
SELECT * FROM base
        );
      
  