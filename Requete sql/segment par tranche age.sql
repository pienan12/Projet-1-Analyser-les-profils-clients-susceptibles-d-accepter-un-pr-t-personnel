--segmentation par tranche d'age
SELECT 
    CASE 
        WHEN Age < 30 THEN 'Jeunes (<30 ans)'
        WHEN Age BETWEEN 30 AND 50 THEN 'Adultes (30–50 ans)'
        ELSE 'Seniors (>50 ans)'
    END AS categorie_age,
    COUNT(*) AS total_clients,
    SUM(CASE WHEN `Personal Loan` = 1 THEN 1 ELSE 0 END) AS nb_acceptation,
    ROUND(SUM(CASE WHEN `Personal Loan` = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS taux_acceptation
FROM `projet-tuto-438721.Porfolio.Bank_Personal_Loan_projet_2`
GROUP BY categorie_age
ORDER BY taux_acceptation DESC;
