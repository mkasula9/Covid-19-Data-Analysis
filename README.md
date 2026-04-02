#  COVID-19 Data Analysis & Visualization

An end-to-end data analysis project exploring global COVID-19 trends using **SQL Server**, **Excel**, and **Tableau**.

---

##  Project Overview

This project analyzes the COVID-19 pandemic dataset covering global cases, deaths, and vaccinations (Jan 2020 – Apr 2021). The workflow follows a complete data analytics pipeline:

```
Raw CSV Data → SQL Server (Exploration & Cleaning) → Excel (Query Outputs) → Tableau (Dashboard)
```

**Key Findings:**
-  **150.5 Million** total cases globally
-  **3.18 Million** total deaths globally
-  **2.11%** global death percentage
-  **Europe** had the highest death count of any continent

---

## 🗂️ Project Structure

```
Covid-19-Data-Analysis/
│
├── 📁 data/
│   ├── COVID_DEATHS.csv                        # Raw deaths dataset
│   └── COVID_VACCINE.csv                       # Raw vaccinations dataset
│
├── 📁 sql/
│   ├── Covid-19_Data_Exploration.sql           # Exploratory analysis queries
│   └── COVID-19.sql                            # Tableau-ready output queries
│
├── 📁 excel_outputs/
│   ├── 1_total_death_percentage.xlsx
│   ├── 2_total_count_death_percentage.xlsx
│   ├── 3_totalcases_VS_totaldeaths.xlsx
│   ├── 4_total_death_count.xlsx
│   ├── 5_highest_infected_population.xlsx
│   ├── 6_percentage_highest_infected_people.xlsx
│   ├── 7_highest_infected_population_over_dates.xlsx
│   ├── 8_rolling_people_vaccinated.xlsx
│   └── 9_percentage_of_people_vaccinated.xlsx
│
├── 📁 dashboard/
│   ├── Covid_DashBoard.twb                     # Tableau workbook
│   └── Covid_DashBoard.pdf                     # Dashboard export/preview
│
└── README.md
```

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|------|---------|
| **SQL Server Express** | Database storage and management |
| **SSMS** | SQL querying and data exploration |
| **Microsoft Excel** | Storing query outputs for visualization |
| **Tableau Public** | Interactive dashboard creation |

---

##  SQL Analysis — Two Scripts

###  1. `Covid-19_Data_Exploration.sql` — Exploratory Analysis

Deep-dive exploration queries including:

| Query | Description |
|-------|-------------|
| Total Cases vs Total Deaths | Death % filtered for India |
| Total Cases vs Population | % of population infected per country |
| Highest Infection Rate | Countries ranked by infection rate |
| Highest Death Count | Top countries by total deaths |
| Deaths by Continent | Continental death toll comparison |
| Global Numbers Over Time | Daily worldwide case and death trends |
| Rolling Vaccination Count | Cumulative vaccinations using `PARTITION BY` |
| CTE — Vaccination % | Rolling vaccination % using Common Table Expression |
| Temp Table | Intermediate vaccination calculations |
| View Creation | `PercentPopulationVaccinated` view for Tableau |

---

##  Tableau Dashboard

The final dashboard contains 4 interactive visualizations:

| Visualization | Type | Insight |
|--------------|------|---------|
| **Global Numbers** | KPI Cards | 150M+ cases, 3.18M deaths, 2.11% death rate |
| **Total Deaths Per Continent** | Bar Chart | Europe had highest death toll |
| **% Population Infected Per Country** | World Map | US, Brazil, Europe most affected |
| **% Population Infected Over Time** | Line Chart | Exponential rise from Sep 2020 |

📎 **Preview:** [`Covid_DashBoard.pdf`](dashboard/Covid_DashBoard.pdf)

---

##  How to Reproduce This Project

### Step 1 — Set Up the Database
1. Install **SQL Server Express** + **SSMS**
2. Create a new database called `Covid-19`
3. Import `COVID_DEATHS.csv` as table `CovidDeaths`
4. Import `COVID_VACCINE.csv` as table `CovidVaccine`
   >  During import: set all numeric columns to `float`, check **Allow Nulls** for all columns, and do **not** assign a Primary Key

### Step 2 — Run SQL Queries
1. Open `Covid-19_Data_Exploration.sql` in SSMS to explore the data
2. Open `COVID-19.sql` and run each labeled query block
3. Export each result to Excel (Right-click results → Save as Excel)

### Step 3 — Build the Tableau Dashboard
1. Open **Tableau Public** (free) or **Tableau Desktop**
2. Connect to each Excel output file as a data source
3. Recreate the 4 visualizations or open `Covid_DashBoard.twb` directly

---

##  SQL Concepts Used

- `JOIN` — Linking deaths and vaccinations tables on location + date
- `GROUP BY` / `ORDER BY` — Aggregating by country and continent
- `SUM()`, `MAX()` — Aggregate functions for totals and peaks
- `PARTITION BY` — Window function for rolling cumulative totals
- `CTE (WITH clause)` — Reusable subquery for vaccination percentage
- `Temp Tables` — Intermediate storage for complex calculations
- `VIEWS` — Saved query for Tableau connection
- `CAST` / `CONVERT` — Data type conversion for numeric calculations
- `WHERE continent IS NOT NULL` — Filtering out aggregated world-level rows

---

##  Suggestions for Improvement

- [ ] Add **2022–2024 data** to show Omicron wave and post-pandemic trends
- [ ] Include **vaccination vs death rate** correlation analysis
- [ ] Publish dashboard to **Tableau Public** and add the live link here
- [ ] Add a **Python/pandas** version of the analysis for broader audience
- [ ] Create an **India-specific dashboard** (foundation already in exploration SQL)

---

## 📬 Connect

If you found this project helpful or have suggestions, feel free to open an issue or reach out!

---

*Dataset source: [Our World in Data — COVID-19](https://ourworldindata.org/covid-deaths)*
