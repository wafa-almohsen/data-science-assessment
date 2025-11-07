SELECT 
    t.investor_id,
    s.sector_name,
    ROUND(
        t.no_of_shares * 100.0 /
        SUM(t.no_of_shares) OVER (PARTITION BY t.investor_id),
        2
    ) AS share_percentage
FROM investor_transactions t
JOIN sectors s 
    ON t.sector_id = s.sector_id
ORDER BY t.investor_id, share_percentage DESC;
