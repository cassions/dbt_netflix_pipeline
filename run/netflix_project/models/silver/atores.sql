
  
    

        create or replace transient table NETFLIX.SILVER.atores
         as
        (-- models/silver/atores.sql
WITH base AS (
  SELECT DISTINCT
    ROW_NUMBER() OVER (ORDER BY TRIM(actor_name)) AS "ID",
    TRIM(actor_name) AS ACTOR,
    LISTAGG(filme_title, ', ') WITHIN GROUP (ORDER BY filme_title) AS filmes
  FROM (
    SELECT
        TRIM(actor.value) AS actor_name,  -- Nome correto para o ator
        title AS filme_title
    FROM
        NETFLIX.BRONZE.netflix_titles,
        LATERAL FLATTEN(input => SPLIT("CAST", ', ')) AS actor  -- Correção do FLATTEN
    WHERE
        actor.value IS NOT NULL AND actor.value != ''
  ) AS flattened_actors
  GROUP BY TRIM(actor_name)  -- Agrupar pelo nome correto
)
SELECT * FROM base
        );
      
  