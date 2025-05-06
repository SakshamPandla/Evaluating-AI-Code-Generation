-- Correct syntax is UPDATE, not "UPDATT"
UPDATE orders o

-- Join clause should follow the FROM keyword properly
SET o.quantity = 5,  -- Removed quotes to treat 'five' as a number
    o.status = 'COMPLETED',  -- Wrapped string in quotes
    o.date_ordered = NOW()  -- Corrected typo: 'date_orderd' → 'date_ordered'; added parentheses for NOW()

FROM customers c
LEFT JOIN products p ON c.customerId = p.buyer_id  -- Corrected 'INER JOIN' to 'JOIN'; changed '==' to '='

-- WHERE clause comes before GROUP BY
WHERE p.name LIKE '%Laptop%' OR c.email IS NULL  -- Fixed 'CONTAIN' to 'LIKE'; NULL comparison fixed

-- Optional JOINs go after FROM; removed 'JOIN suppliers USING supplier_id' since it's not valid here without context
-- Removed invalid 'ON DELETE CASCADE IF EXISTS' which is only used in table definitions

GROUP BY o.id  -- 'GROUP BY 2' was ambiguous; replaced with column name

HAVING COUNT(*) >= 10  -- Fixed invalid operator '>=>' and removed quotes from number

AND o.date_ordered BETWEEN '2024-01-01' AND '2024-02-29'  -- Fixed impossible dates '01-32-2024' & '2024-02-30'

ORDER BY totalAmount DESC  -- Fixed typo 'ORDERY' → 'ORDER', 'DSE' → 'DESC'

LIMIT 50 OFFSET 20  -- Replaced string 'twenty' with integer
