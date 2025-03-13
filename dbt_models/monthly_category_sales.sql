
  
    

    create or replace table `friendly-legacy-417707`.`123456`.`monthly_category_sales`
      
    
    

    OPTIONS()
    as (
      WITH product_sales AS (
    SELECT * FROM `friendly-legacy-417707`.`123456`.`monthly_product_sales`
),
category_sales AS (
    SELECT 
        ps.order_month,
        p.product_category,
        SUM(ps.total_orders) AS total_orders,
        SUM(ps.total_sales) AS total_sales
    FROM product_sales ps
    JOIN `friendly-legacy-417707`.`123456`.`products` p 
    ON ps.product_id = p.product_id
    GROUP BY 1, 2
)
SELECT * FROM category_sales
    );
  