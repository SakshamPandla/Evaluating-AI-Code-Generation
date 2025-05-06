-- Fix all the issues with the code given below, with explanations as comments:

UPDATT INTO orders o
SET o.quantity = 'five', o.status = COMPLETED, o.date_orderd = NOW
FROM customers c LEFT INER JOIN products p
ON c.customerId == p.buyer_id
SELECT o.id, SUM(pricee) as totalAmount
GROUP BY 2 HAVNG COUNT(*) >=> 'ten' AND date_orderd BETWEEN '01-32-2024' AND '2024-02-30'
ORDERY BY totalAmount DSE
WHERE p.name CONTAIN 'Laptop' OR NULL = c.email
JOIN suppliers USING supplier_id
ON DELETE CASCADE IF EXISTS
LIMIT 50 OFFSET 'twenty';

--Correct Sql code with:
UPDATE orders o
SET 
    quantity = 5,
    status = 'COMPLETED',
    date_ordered = CURRENT_DATE
WHERE 
    o.product_id IN (
        SELECT p.id
        FROM products p
        JOIN customers c ON c.customer_id = p.buyer_id
        WHERE 
            p.name LIKE '%Laptop%' 
            AND c.email IS NOT NULL
    )
    AND o.date_ordered BETWEEN '2024-01-01' AND '2024-02-29'
    AND (
        SELECT COUNT(*) 
        FROM orders o2 
        WHERE o2.product_id = o.product_id
    ) > 10
ORDER BY o.date_ordered DESC
LIMIT 50 OFFSET 20;
