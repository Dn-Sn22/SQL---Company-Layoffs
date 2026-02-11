-- Исследовательский анализ данных (EDA)



-- Максимальные значения увольнений
SELECT MAX(total_laid_off) AS max_layoffs,
       MAX(percentage_laid_off) AS max_percentage
FROM layoff_staging2;




SELECT MIN(`date`) AS first_date,
       MAX(`date`) AS last_date
FROM layoff_staging2;



-- Общая сумма увольнений по компаниям
SELECT company,
       SUM(total_laid_off) AS total_laid_off
FROM layoff_staging2
GROUP BY company
ORDER BY total_laid_off DESC;



-- Увольнения по странам
SELECT country,
       SUM(total_laid_off) AS total_laid_off
FROM layoff_staging2
GROUP BY country
ORDER BY total_laid_off DESC;



-- Динамика увольнений по годам
SELECT YEAR(`date`) AS year,
       SUM(total_laid_off) AS total_laid_off
FROM layoff_staging2
GROUP BY YEAR(`date`)
ORDER BY year DESC;



-- Кумулятивная динамика по месяцам
WITH Rolling_total AS 
(
SELECT DATE_FORMAT(`date`, '%Y-%m') AS month,
       SUM(total_laid_off) AS total_off
FROM layoff_staging2
GROUP BY month
)
SELECT month,
       total_off,
       SUM(total_off) OVER(ORDER BY month) AS rolling_total
FROM Rolling_total;



-- Топ-5 компаний по увольнениям в каждом году
WITH Company_Year AS
(
SELECT company,
       YEAR(`date`) AS year,
       SUM(total_laid_off) AS total_laid_off
FROM layoff_staging2
GROUP BY company, YEAR(`date`)
),
Company_Year_Rank AS
(
SELECT *,
DENSE_RANK() OVER (PARTITION BY year ORDER BY total_laid_off DESC) AS ranking
FROM Company_Year
WHERE year IS NOT NULL
)
SELECT *
FROM Company_Year_Rank
WHERE ranking <= 5;