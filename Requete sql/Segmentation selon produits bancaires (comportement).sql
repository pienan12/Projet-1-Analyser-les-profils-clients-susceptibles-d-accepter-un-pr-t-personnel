--Segmentation selon produits bancaires (comportement)
SELECT 
    CreditCard,
    Online,
    COUNT(*) AS total_clients,
    ROUND(SUM(CASE WHEN `Personal Loan` = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS taux_acceptation
FROM `projet-tuto-438721.Porfolio.Bank_Personal_Loan_projet_2` 
GROUP BY CreditCard, Online
ORDER BY taux_acceptation DESC;
