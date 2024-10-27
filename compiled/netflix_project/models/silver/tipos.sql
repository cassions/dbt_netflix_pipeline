-- models/silver/tipos.sql
WITH base AS (
  SELECT DISTINCT
    ROW_NUMBER() OVER (ORDER BY "TYPE") AS "ID",
	"TYPE"
  FROM NETFLIX.BRONZE.netflix_titles
  WHERE TYPE IS NOT NULL
)

SELECT * FROM base