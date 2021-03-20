--What grades are stored in the database?
select *
from Grade

--What emotions may be associated with a poem?
select *
from Emotion

--How many poems are in the database?
select count(*)
from Poem

--Sort authors alphabetically by name. What are the names of the top 76 authors?
select top 76 A.Name
from Author A
order by A.Name asc

--Starting with the above query, add the grade of each of the authors.
select top 76 A.Name, G.Name
from Author A
	join Grade G
	on G.Id = A.GradeId
order by A.Name asc