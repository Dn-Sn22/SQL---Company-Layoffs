
CREATE TABLE layoff_staging LIKE layoffs;


CREATE TABLE layoff_staging2 (
  company TEXT,
  location TEXT,
  total_laid_off TEXT,
  date TEXT,
  percentage_laid_off TEXT,
  industry TEXT,
  source TEXT,
  stage TEXT,
  funds_raised INT DEFAULT NULL,
  country TEXT,
  date_added TEXT,
  row_num INT
);


ALTER TABLE layoff_staging2
MODIFY COLUMN date_added DATE;

ALTER TABLE layoff_staging2
MODIFY COLUMN date DATE;

-- Remove helper column
ALTER TABLE layoff_staging2
DROP COLUMN row_num;
