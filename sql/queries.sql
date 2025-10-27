-- HR Analytics SQL Queries for Employee Turnover Prediction
-- Dataset: Kaggle HR Analytics
-- Target: target (1 - looking for job, 0 - not looking)

-- 1. Влияние уровня образования на поиск работы
SELECT
    education_level,
    COUNT(*) as count,
    AVG(target) as avg_target,
    (1 - AVG(target)) * 100 as stability_percent
FROM aug 
GROUP BY education_level 
ORDER BY avg_target DESC;

-- 2. Влияние опыта на поиск работы
SELECT
    experience,
    COUNT(*) as count,
    AVG(target) as avg_target,
    (1 - AVG(target)) * 100 as stability_percent
FROM aug 
GROUP BY experience 
ORDER BY avg_target DESC;

-- 3. Топ-10 самых стабильных комбинаций
SELECT
    education_level,
    company_type,
    experience,
    COUNT(*) as count,
    AVG(target) as avg_target,
    (1 - AVG(target)) * 100 as stability_percent
FROM aug
GROUP BY education_level, company_type, experience
HAVING COUNT(*) > 20
ORDER BY avg_target ASC, count DESC
LIMIT 10;

-- 4. Топ-10 самых рискованных комбинаций
SELECT
    education_level,
    company_type,
    experience,
    COUNT(*) as count,
    AVG(target) as avg_target,
    (1 - AVG(target)) * 100 as stability_percent
FROM aug
GROUP BY education_level, company_type, experience
HAVING COUNT(*) > 20
ORDER BY avg_target DESC, count DESC
LIMIT 10;

-- 5. Анализ карьерного пути
SELECT
    CASE 
        WHEN last_new_job = 'never' THEN 'Никогда не менял'
        WHEN last_new_job IN ('1', '2') THEN 'Менял 1-2 года назад'
        WHEN last_new_job IN ('3', '4') THEN 'Менял 3-4 года назад'
        WHEN last_new_job = '>4' THEN 'Менял 5+ лет назад'
    END as time_since_change,
    CASE 
        WHEN experience IN ('<1', '1', '2', '3') THEN 'Начинающий (0-3 года)'
        WHEN experience IN ('4', '5', '6', '7', '8', '9', '10') THEN 'Опытный (4-10 лет)'
        WHEN experience ='>20' THEN 'Профессионал (>20 лет)'
        ELSE 'Средний (11-19 лет)'
    END as experience_group,
    COUNT(*) as count,
    AVG(target) as avg_target,
    (1 - AVG(target)) * 100 as stability_percent
FROM aug
GROUP BY time_since_change, experience_group
HAVING COUNT(*) > 30
ORDER BY stability_percent DESC;