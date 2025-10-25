--Analyse descriptive — taux d’acceptation global
SELECT 
    COUNT(*) AS total_clients,
    SUM(CASE WHEN `Personal Loan` = 1 THEN 1 ELSE 0 END) AS nb_acceptation,
    ROUND(SUM(CASE WHEN `Personal Loan` = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS taux_acceptation_global
FROM `projet-tuto-438721.Porfolio.Bank_Personal_Loan_projet_2`;