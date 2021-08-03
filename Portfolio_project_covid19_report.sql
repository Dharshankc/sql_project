select * from PortfolioProject..Covid_Deaths
order by 3,4

select location,date,total_cases,new_cases,total_deaths,population
from PortfolioProject..Covid_Deaths
order by 1,2

--Looking at Total cases vs Total deaths

select location,date,total_cases,total_deaths,	concat(cast(round((total_deaths/total_cases)*100, 2) as varchar), '%') as DeathPercentage
from PortfolioProject..Covid_Deaths
where location like '%india%'
order by 1,2

--Looking at Total cases vs Population
--Shows what percentage of population got covid

select location,date,total_cases,population,concat(cast(round((total_cases/population)*100,2)as varchar),'%') as Covid_Percentage
from PortfolioProject..Covid_Deaths
where location like '%india%'
order by 1,2

--Looking at Countries with Highest Infection Rate compared to Population

select location,population,max(total_cases) as Highest_Infection_Count, concat(cast(round((max(total_cases)/population)*100,2)as varchar),'%') as Percentage_Population_Infected
from PortfolioProject..Covid_Deaths
group by location,population
order by Percentage_Population_Infected desc

--Showing countries with Highest Death Count per Population

select location,cast(max(total_deaths) as int) as Total_Death_Count
from PortfolioProject..Covid_Deaths
group by location
order by Total_Death_Count desc

--Looking at total population vs vaccinations

select dea.location,dea.date,dea.population,vac.new_vaccinations 
from PortfolioProject..Covid_Deaths as dea
join PortfolioProject..Covid_Vaccinations as vac
on dea.location=vac.location
and dea.date=vac.date





