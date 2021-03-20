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

--6. Starting with the above query, add the recorded gender of each of the authors.
select top 76 A.Name, G.Name, Ge.Name
from Author A
	join Grade G
	on G.Id = A.GradeId
	join Gender Ge
	on A.GenderId = Ge.Id
order by A.Name asc

--7.What is the total number of words in all poems in the database?
select sum(p.WordCount)
from Poem P

--8. Which poem has the fewest characters?
select P.Title, P.CharCount
from Poem P
order by P.CharCount asc

--9. How many authors are in the third grade?
select Count(*)
from Author A
	join Grade G
	on A.GradeId = G.Id
where G.Id = 3

--10. How many authors are in the first, second or third grades?
select Count(*)
from Author A
	join Grade G
	on A.GradeId = G.Id
where G.Id = 3 or G.Id = 4 or G.Id = 5

--11. What is the total number of poems written by fourth graders?
select count(*)
from Poem P
	join Author A
	on A.Id = P.AuthorId
	join Grade G
	on G.Id = A.GradeId
Where G.Id = 4
