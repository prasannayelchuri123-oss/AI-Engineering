-- first commit
select length(description) - length(replace(description,'a','')) as a_count,description 
from sakila.film;

