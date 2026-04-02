SELECT * FROM CovidDeaths
ORDER BY 3,4

SELECT Location, date, total_cases, new_cases,total_deaths,population
FROM CovidDeaths
ORDER BY 1,2

--Total cases VS Total Deaths
SELECT Location, date, total_cases,total_deaths, (total_deaths/total_cases)*100 as Death_Percentage
FROM CovidDeaths
WHERE location ='india'
ORDER BY 1,2

--Total Cases VS Population
SELECT Location, date, total_cases,population, (total_cases/population)*100 as Covid_Effected_Population
FROM CovidDeaths
WHERE location ='india'
ORDER BY 1,2

--Countries with highest infection rate over population
SELECT Location, population, MAX(total_cases) as Highest_Infection_Count, MAX(total_cases/population)*100 as Covid_Effected_Population
FROM CovidDeaths
GROUP BY population,location
ORDER BY Covid_Effected_Population desc

--Countries with highest death rate 
SELECT Location,MAX(total_deaths) as Total_Death_Count 
FROM CovidDeaths
WHERE continent is not null
GROUP BY location
ORDER BY Total_Death_Count desc

--Continent with higest death rate
SELECT continent,MAX(total_deaths) as Total_Death_Count 
FROM CovidDeaths
WHERE continent is not null
GROUP BY continent
ORDER BY Total_Death_Count desc

--GLOBAL NUMBERS
SELECT date,SUM(new_cases)as Total_New_Cases,SUM(new_deaths) as Total_New_Deaths, SUM(new_deaths)/SUM(new_cases) * 100 as Percentage
FROM CovidDeaths
WHERE continent is not null
GROUP BY date
order by 1,2


SELECT * FROM CovidVaccine
ORDER BY 3,4

--Total Population VS Vaccination
SELECT d.continent,d.location,d.date,d.population, v.new_vaccinations,
SUM(v.new_vaccinations) OVER (PARTITION BY d.location ORDER BY d.location,d.date) as Total_Vaccinations
FROM
CovidDeaths d JOIN CovidVaccine v
ON d.location=v.location
AND d.date=v.date
WHERE d.continent is not null
ORDER BY 1,2,3

--Using CTE to calculate rolling vaccination percentage
WITH PopVsVac (continent,location,date,population,new_vaccinations,Rolling_Vaccinations)
as
(
SELECT d.continent,d.location,d.date,d.population, v.new_vaccinations,
SUM(v.new_vaccinations) OVER (PARTITION BY d.location ORDER BY d.location,d.date) as Rolling_Vaccinations
FROM
CovidDeaths d JOIN CovidVaccine v
ON d.location=v.location
AND d.date=v.date
WHERE d.continent is not null
)
SELECT *, (Rolling_Vaccinations/Population)* 100 as Percentage_Rolling_Vaccinations 
FROM PopVsVac

--Creating TEMP TABLE
DROP TABLE IF EXISTS #PercentPopulationVaccinated
CREATE TABLE #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_Vaccination numeric,
Rolling_Vaccinations numeric)

INSERT INTO #PercentPopulationVaccinated
SELECT d.continent,d.location,d.date,d.population, v.new_vaccinations,
SUM(v.new_vaccinations) OVER (PARTITION BY d.location ORDER BY d.location,d.date) as Total_Vaccinations
FROM
CovidDeaths d JOIN CovidVaccine v
ON d.location=v.location
AND d.date=v.date


SELECT *, (Rolling_Vaccinations/Population)* 100 as Percentage_Rolling_Vaccinations 
FROM #PercentPopulationVaccinated

--Creating VIEW to store data for visualization
CREATE VIEW PercentPopulationVaccinated as
SELECT d.continent,d.location,d.date,d.population, v.new_vaccinations,
SUM(v.new_vaccinations) OVER (PARTITION BY d.location ORDER BY d.location,d.date) as Total_Vaccinations
FROM
CovidDeaths d JOIN CovidVaccine v
ON d.location=v.location
AND d.date=v.date
WHERE d.continent is not null

SELECT * FROM PercentPopulationVaccinated
