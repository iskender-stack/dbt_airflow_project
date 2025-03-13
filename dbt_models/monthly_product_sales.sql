
  
    

    create or replace table `friendly-legacy-417707`.`123456`.`monthly_product_sales`
      
    
    

    OPTIONS()
    as (
      WITH monthly_sales AS (
    SELECT 
        DATE_TRUNC(DATE(order_date), MONTH) AS order_month,
        product_id,
        COUNT(*) AS total_orders,
        SUM(total_amount) AS total_sales
    FROM `friendly-legacy-417707`.`123456`.`orders`
    GROUP BY 1, 2
)
SELECT * FROM monthly_sales
    );
  