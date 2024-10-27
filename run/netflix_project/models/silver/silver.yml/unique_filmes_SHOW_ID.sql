select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    SHOW_ID as unique_field,
    count(*) as n_records

from NETFLIX.SILVER.filmes
where SHOW_ID is not null
group by SHOW_ID
having count(*) > 1



      
    ) dbt_internal_test