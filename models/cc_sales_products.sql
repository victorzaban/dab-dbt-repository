{{config(materialized='table')}}

select
    # ## Key ###  
    product_id,
    # ##########
    sum(quantity) as qty_91,
    round(sum(quantity) / 91, 2) as avg_daily_qty_91
from `raw_data_circle.raw_cc_sales`
where date_date >= date_sub('2021-10-01', interval 91 day)
group by product_id
