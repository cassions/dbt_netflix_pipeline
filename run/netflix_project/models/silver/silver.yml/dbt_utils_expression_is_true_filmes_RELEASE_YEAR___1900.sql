select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      



select
    1
from NETFLIX.SILVER.filmes

where not(RELEASE_YEAR > 1900)


      
    ) dbt_internal_test