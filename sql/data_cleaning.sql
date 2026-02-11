-- Очистка и стандартизация данных


INSERT INTO layoff_staging
SELECT *
FROM layoffs;


INSERT INTO layoff_staging2
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, 
industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised
) AS row_num
FROM layoff_staging;

DELETE
FROM layoff_staging2
WHERE row_num > 1;


UPDATE layoff_staging2
SET company = TRIM(company);


UPDATE layoff_staging2
SET industry = TRIM(industry);


UPDATE layoff_staging2
SET industry = NULL
WHERE industry = '';



UPDATE layoff_staging2
SET location = fix_utf8(location);



UPDATE layoff_staging2
SET location = 'Malmö, Non-U.S.'
WHERE location LIKE 'Malm%';

UPDATE layoff_staging2
SET location = 'Florianópolis, Non-U.S.'
WHERE location LIKE 'Florian%';




UPDATE layoff_staging2
SET total_laid_off = NULL
WHERE total_laid_off = '';

UPDATE layoff_staging2
SET percentage_laid_off = NULL
WHERE percentage_laid_off = '';




UPDATE layoff_staging2
SET date_added = STR_TO_DATE(date_added, '%m/%d/%Y');

UPDATE layoff_staging2
SET date = STR_TO_DATE(date, '%m/%d/%Y');




-- Удаляем строки, где нет данных ни по количеству,
-- ни по проценту увольнений
DELETE 
FROM layoff_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;