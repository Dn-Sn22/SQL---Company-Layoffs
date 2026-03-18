# Company Layoffs Analysis

## Project Description
This project is based on a Kaggle dataset tracking mass layoffs in the tech sector during a global economic slowdown. Rising interest rates from central banks, declining consumer spending, and a strengthening dollar led to widespread reductions across tech companies worldwide. Notably, Meta cut about 13% of its workforce (over 11,000 employees). The dataset covers the period from the COVID-19 pandemic announcement (March 11, 2020) to April 21, 2025.

## Technologies Used

MySQL

Window functions (ROW_NUMBER, DENSE_RANK, SUM OVER)

CTEs

Aggregations and groupings

Data transformation and standardization

PowerBI


## Data Sources

Bloomberg

San Francisco Business Times

TechCrunch

The New York Times


Aggregated by: Roger Lee
-- https://www.kaggle.com/datasets/swaptr/layoffs-2022

## Project Goal
Build a complete analytical pipeline:

* Data cleaning and standardization
* Duplicate removal
* Handling missing values
* Data type transformations
* Exploratory data analysis (EDA)
* Dashboard visualization in PowerBI

## Key Analysis Findings
* Overall Picture:
Over 682,000 employees were laid off from 2,154 companies worldwide between 2020–2025. 255 companies fully shut down, laying off 100% of their staff.

* Yearly Trends:
Layoffs peaked in 2023 with over 210,000 people. Sharp growth began in 2022 after the hiring boom during the 2020–2021 pandemic, when tech companies massively expanded amid surging demand for digital services.

* Layoff Leaders:
Intel, Amazon, and Microsoft top the list by absolute numbers. Big Tech bears the brunt of reductions due to their scale and aggressive hiring in 2020–2021.

* By Industry:
Retail, Consumer, and Transportation suffered most alongside tech, reflecting broader post-pandemic economic restructuring and inflation pressure on consumer demand.

* By Funding Stage:
Post-IPO companies account for 60% of all layoffs—public companies faced the fastest pressure from shareholders to cut costs.

* By Geography:
The US dominates by a wide margin, reflecting the concentration of major tech companies there.

## Repository Structure

SQL-Analysis-of-company-layoffs/
├── README.md
├── sql/
│   ├── create_tables.sql
│   ├── data_cleaning.sql
│   ├── EDA.sql
│   └── functions.sql
└── LayoffsDash.pbix

## Dashboard Screenshot

![Снимок экрана 2026-02-18 200220](https://github.com/user-attachments/assets/d3be17dd-5190-4e97-a149-6aaeb10acec0)






# Анализ увольнений компаний (Layoffs)

##  Описание проекта
 **Данный проект основан на датасете с платформы Kaggle, посвящённом массовым увольнениям в технологическом секторе в период глобального экономического замедления. 
Экономический спад, рост процентных ставок центральными банками, снижение потребительских расходов и укрепление доллара привели к масштабным сокращениям в технологических компаниях по всему миру. 
В частности, компания Meta сократила около 13% своего персонала (более 11 000 сотрудников).
Датасет охватывает период с момента объявления пандемии COVID-19 (11 марта 2020 года) по 21 апреля 2025 года.**

## Используемые технологии
- MySQL
- Оконные функции (ROW_NUMBER, DENSE_RANK, SUM OVER)
- CTE
- Aгрегации и группировки
- Преобразование и стандартизация данных
- PowerBI

---

## Источники данных:

Bloomberg

San Francisco Business Times

TechCrunch

The New York Times

- Автор агрегированных данных: Roger Lee.

--https://www.kaggle.com/datasets/swaptr/layoffs-2022

---

## Цель проекта
Построить полный аналитический пайплайн:

* Очистка и стандартизация данных
* Удаление дубликатов
* Обработка пропущенных значений
* Преобразование типов данных
* Проведение исследовательского анализа (EDA)
* Визуализация анализа в дашборд PowerBI


## Ключевые результаты анализа
* Общая картина:
За период 2020–2025 годов было уволено свыше 682 тысяч сотрудников в 2154 компаниях по всему миру. 255 компаний провели полное закрытие, уволив 100% персонала.
* Динамика по годам:
Пик увольнений пришёлся на 2023 год — более 210 тысяч человек. Резкий рост начался с 2022 года после периода найма во время пандемии 2020–2021, когда tech-компании массово расширялись под бурный рост спроса на цифровые услуги.
* Лидеры по увольнениям:
Intel, Amazon и Microsoft возглавляют топ по абсолютному числу уволенных. Крупнейшие технологические компании (Big Tech) несут основную долю сокращений, что объясняется их масштабом и агрессивным наймом в 2020–2021 годах.
* По индустриям:
Retail, Consumer и Transportation — наиболее пострадавшие отрасли помимо tech. Это отражает общую перестройку экономики после пандемии и давление инфляции на потребительский спрос.
* По стадиям финансирования:
Post-IPO компании составляют 60% всех увольнений — публичные компании под давлением акционеров были вынуждены оптимизировать расходы быстрее всех.
* По географии:
США доминируют с большим отрывом, что отражает концентрацию крупнейших tech-компаний именно там.

##  Структура репозитория
SQL-Analysis-of-company-layoffs/

├── README.md

├── sql/

│ create_tables.sql  

│ data_cleaning.sql 

│ EDA.sql

│ functions.sql 

├── LayoffsDash.pbix


## Скрин дашборда

![Снимок экрана 2026-02-18 200220](https://github.com/user-attachments/assets/d3be17dd-5190-4e97-a149-6aaeb10acec0)

