
  
    

        create or replace transient table NETFLIX.BRONZE.netflix_titles
         as
        (-- models/bronze/netflix_titles.sql

SELECT
  *
FROM NETFLIX.RAW.NETFLIX_TITLES
        );
      
  