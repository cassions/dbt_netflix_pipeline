
  
    

        create or replace transient table NETFLIX.SILVER.diretores
         as
        (-- models/silver/diretores.sql
WITH base AS (
  SELECT DISTINCT
    ROW_NUMBER() OVER (ORDER BY "DIRECTOR") AS "ID",
    "DIRECTOR",
    LISTAGG("FILME_TITLE", ', ') AS filmes
  FROM (
    SELECT
        TRIM("DIRECTOR") AS "DIRECTOR",
        "TITLE" AS "FILME_TITLE"
    FROM
        NETFLIX.BRONZE.netflix_titles,
        LATERAL FLATTEN(input => SPLIT("DIRECTOR", ', ')) AS "DIRECTOR"
    WHERE
        "DIRECTOR" IS NOT NULL AND "DIRECTOR" != ''
)
GROUP BY
    "DIRECTOR"
)

SELECT * FROM base
        );
      
  