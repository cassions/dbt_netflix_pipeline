
  create or replace   view NETFLIX.GOLD.CAMPANHA_DESENHOS_TERROR
  
   as (
    -- models/gold/CAMPANHA_FILMES_TERROR.sql
WITH base AS (
  SELECT 
    f.show_id,
    f.title,
    d.director,
    a.actor,
    p.country,
    f.date_added,
    f.release_year,
    f.rating,
    f.duration,
    f.description,
    f.listed_in
FROM
    NETFLIX.BRONZE.netflix_titles f
    LEFT JOIN NETFLIX.SILVER.diretores d ON f.title = d.filmes
    LEFT JOIN NETFLIX.SILVER.atores a ON f.title = a.filmes
    LEFT JOIN NETFLIX.SILVER.paises p ON f.country = p.country
WHERE
    f.type = 'TV Show'
    AND f.listed_in ILIKE '%Horror%'
	AND f.listed_in ILIKE '%Anime%'
)

SELECT * FROM base
  );

