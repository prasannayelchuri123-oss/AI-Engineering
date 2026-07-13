-- first commit
select length(description) - length(replace(description,'a','')) as a_count,description 
from sakila.film;

-- seconc commit
select '2024' as year,
       case
           when mod(2024,400) = 0 or (mod(2024,4) = 0 and mod(2024,100) <>0)
           then 'Leap Year'
           else 'Not a leap year'
       end as result;