--Niveau de revenu
SELECT 
    CASE 
        WHEN Income < 40 THEN 'Faible revenu (<40k)'
        WHEN Income BETWEEN 40 AND 80 THEN 'Revenu moyen (40k–80k)'
        ELSE 'Haut revenu (>80k)'
    END AS categorie_revenu,
    COUNT(*) AS total_clients,
    SUM(CASE WHEN `Personal Loan` = 1 THEN 1 ELSE 0 END) AS nb_acceptation,
    ROUND(SUM(CASE WHEN `Personal Loan` = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS taux_acceptation
FROM `projet-tuto-438721.Porfolio.Bank_Personal_Loan_projet_2` 
GROUP BY categorie_revenu
ORDER BY taux_acceptation DESC;
