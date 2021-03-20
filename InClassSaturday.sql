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

--12.How many poems are there per grade?
select G.Name, count(*) as [Count]
from Poem P
	join Author A
	on A.Id = P.AuthorId
	join Grade G
	on G.Id = A.GradeId
Group By G.Name

--13. How many authors are in each grade? (Order your results by grade starting with 1st Grade)
select g.Name, count(a.Id) as Authors
from Author a
	join Grade g
	on a.GradeId = g.Id
group by g.Name

--14. What is the title of the poem that has the most words?
select P.Title, P.WordCount
from Poem P
order by P.WordCount desc

--15. Which author(s) have the most poems? (Remember authors can have the same name.)
select A.Id, a.Name, count(p.Id) as count
from Poem P
	join Author A
	on A.Id = P.AuthorId
group by A.Id, A.Name
order by count desc

--16. How many poems have an emotion of sadness?
select E.Name, Count(*) as Count
from PoemEmotion PE
	Join Emotion E
	on E.Id = PE.EmotionId
	join Poem P
	on P.Id = PE.PoemId
group by E.Name

select Count(*) as Count
from PoemEmotion PE
	Join Emotion E
	on E.Id = PE.EmotionId
	join Poem P
	on P.Id = PE.PoemId
where E.Name = 'Sadness'

--17. How many poems are not associated with any emotion? NOT SURE ABOUT THIS ONE
select P.*
from Poem P
where NOT EXISTS
  (SELECT * 
   FROM PoemEmotion PE
   WHERE P.Id = PE.PoemId);
	
