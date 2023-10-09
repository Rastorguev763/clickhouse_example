WITH CumulativeData AS (
    SELECT
        category,
        order_date,
        revenue,
        SUM(revenue) OVER (PARTITION BY category ORDER BY order_date) AS cumulative_revenue,
        COUNT(*) OVER (PARTITION BY category ORDER BY order_date) AS cumulative_orders,
        SUM(revenue) OVER (PARTITION BY category ORDER BY order_date) / COUNT(*) OVER (PARTITION BY category ORDER BY order_date) AS average_check,
        RANK() OVER (PARTITION BY category ORDER BY SUM(revenue) / COUNT(*) DESC) AS max_avg_check_rank
    FROM sales
)

SELECT
    category,
    order_date,
    cumulative_revenue,
    cumulative_orders,
    average_check,
    CASE WHEN max_avg_check_rank = 1 THEN order_date ELSE NULL END AS max_avg_check_date,
    CASE WHEN max_avg_check_rank = 1 THEN average_check ELSE NULL END AS max_avg_check_value
FROM CumulativeData
ORDER BY category, order_date;
