-- models/gold/CAMPANHA_SERIES_TERROR.sql
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
    {{ ref('netflix_titles') }} f
    LEFT JOIN {{ ref('diretores') }} d ON f.title = d.filmes
    LEFT JOIN {{ ref('atores') }} a ON f.title = a.filmes
    LEFT JOIN {{ ref('paises') }} p ON f.country = p.country
WHERE
    f.type = 'TV Show'
--    AND ARRAY_TO_STRING(f.listed_in, ',') ILIKE '%Horror%'
    AND f.listed_in ILIKE '%Horror%'
)

SELECT * FROM base