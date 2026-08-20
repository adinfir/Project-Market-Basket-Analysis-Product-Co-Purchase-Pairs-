--Product Bundle Behavior Analysis 
WITH basket AS (
  SELECT DISTINCT
    invoice,
    item_code
  FROM privat-class.course1.item
),

pair AS (
  SELECT
    a.item_code AS item_a,
    b.item_code AS item_b,
    COUNT(DISTINCT a.invoice) AS bought_together

  FROM basket a

  JOIN basket b
    ON a.invoice = b.invoice
    AND a.item_code < b.item_code

  GROUP BY
    item_a,
    item_b
)

SELECT *
FROM pair
WHERE bought_together >= 10
ORDER BY bought_together DESC;
