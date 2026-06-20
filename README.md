# Анализ увольнений компаний (Layoffs)

## Описание проекта

Проект основан на датасете с платформы Kaggle, посвящённом массовым увольнениям в технологическом секторе в период глобального экономического замедления. Экономический спад, рост процентных ставок центральными банками, снижение потребительских расходов и укрепление доллара привели к масштабным сокращениям в технологических компаниях по всему миру. В частности, компания Meta сократила около 13% своего персонала (более 11 000 сотрудников).

Датасет охватывает период с момента объявления пандемии COVID-19 (11 марта 2020 года) по 21 апреля 2025 года.

## Используемые технологии

- MySQL
- Оконные функции (`ROW_NUMBER`, `DENSE_RANK`, `SUM() OVER`)
- CTE (Common Table Expressions)
- Агрегации и группировки
- Преобразование и стандартизация данных
- PowerBI

## Источники данных

Bloomberg, San Francisco Business Times, TechCrunch, The New York Times

Автор агрегированных данных: Roger Lee — [Kaggle dataset](https://www.kaggle.com/datasets/swaptr/layoffs-2022)

## Цель проекта

Построить полный аналитический пайплайн:

- Очистка и стандартизация данных
- Удаление дубликатов
- Обработка пропущенных значений
- Преобразование типов данных
- Исследовательский анализ данных (EDA)
- Визуализация в дашборде PowerBI

## Примеры реализации

**Удаление дубликатов через оконную функцию:**

```sql
INSERT INTO layoff_staging2
SELECT *,
ROW_NUMBER() OVER(
    PARTITION BY company, location,
    industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised
) AS row_num
FROM layoff_staging;

DELETE FROM layoff_staging2
WHERE row_num > 1;
```

**Топ-5 компаний по увольнениям в каждом году (CTE + DENSE_RANK):**

```sql
WITH Company_Year AS (
    SELECT company,
           YEAR(`date`) AS year,
           SUM(total_laid_off) AS total_laid_off
    FROM layoff_staging2
    GROUP BY company, YEAR(`date`)
),
Company_Year_Rank AS (
    SELECT *,
           DENSE_RANK() OVER (PARTITION BY year ORDER BY total_laid_off DESC) AS ranking
    FROM Company_Year
    WHERE year IS NOT NULL
)
SELECT * FROM Company_Year_Rank
WHERE ranking <= 5;
```

**Кумулятивная динамика увольнений по месяцам (running total):**

```sql
WITH Rolling_total AS (
    SELECT DATE_FORMAT(`date`, '%Y-%m') AS month,
           SUM(total_laid_off) AS total_off
    FROM layoff_staging2
    GROUP BY month
)
SELECT month,
       total_off,
       SUM(total_off) OVER (ORDER BY month) AS rolling_total
FROM Rolling_total;
```

Полный код очистки данных и EDA — в папке `sql/`.

## Ключевые результаты анализа

**Общая картина.** За период 2020–2025 годов было уволено свыше 682 тысяч сотрудников в 2154 компаниях по всему миру. 255 компаний провели полное закрытие, уволив 100% персонала.

**Динамика по годам.** Пик увольнений пришёлся на 2023 год — более 210 тысяч человек. Резкий рост начался с 2022 года после периода найма во время пандемии 2020–2021, когда tech-компании массово расширялись под бурный рост спроса на цифровые услуги.

**Лидеры по увольнениям.** Intel, Amazon и Microsoft возглавляют топ по абсолютному числу уволенных. Крупнейшие технологические компании несут основную долю сокращений, что объясняется их масштабом и агрессивным наймом в 2020–2021 годах.

**По индустриям.** Retail, Consumer и Transportation — наиболее пострадавшие отрасли помимо tech. Это отражает общую перестройку экономики после пандемии и давление инфляции на потребительский спрос.

**По стадиям финансирования.** Post-IPO компании составляют 60% всех увольнений — публичные компании под давлением акционеров были вынуждены оптимизировать расходы быстрее всех.

**По географии.** США доминируют с большим отрывом, что отражает концентрацию крупнейших tech-компаний именно там.

## Структура репозитория

```
SQL-Analysis-of-company-layoffs/
├── README.md
├── sql/
│   ├── create_tables.sql
│   ├── data_cleaning.sql
│   ├── EDA.sql
│   └── functions.sql
└── LayoffsDash.pbix
```

## Скрин дашборда

![Снимок экрана 2026-02-18 200220](https://github.com/user-attachments/assets/d3be17dd-5190-4e97-a149-6aaeb10acec0)



