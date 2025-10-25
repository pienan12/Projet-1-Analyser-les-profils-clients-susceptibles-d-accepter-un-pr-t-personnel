--Segmentation combinée (âge + revenu)

SELECT 
    CASE 
        WHEN Age < 30 THEN 'Jeunes'
        WHEN Age BETWEEN 30 AND 50 THEN 'Adultes'
        ELSE 'Seniors'
    END AS categorie_age,
    CASE 
        WHEN Income < 40 THEN 'Faible revenu'
        WHEN Income BETWEEN 40 AND 80 THEN 'Revenu moyen'
        ELSE 'Haut revenu'
    END AS categorie_revenu,
    COUNT(*) AS total_clients,
    ROUND(SUM(CASE WHEN `Personal Loan` = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS taux_acceptation
FROM `projet-tuto-438721.Porfolio.Bank_Personal_Loan_projet_2`
GROUP BY categorie_age, categorie_revenu
ORDER BY taux_acceptation DESC;
