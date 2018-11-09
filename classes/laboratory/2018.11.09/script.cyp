// Questão 01.
match (m:Movie) return m.title, m.released order by m.released;

// Questão 02.
match (t:Person {name: "Tom Cruise"})-[a:ACTED_IN]->(Movie) 
return a.roles, Movie.title;

// Questão 03.
match (Person) where Person.born >= 1970 and Person.born <= 1990 
return Person.born as Nascido, count(Person.born) order by Nascido

// Questão 04.
match (d:Person)-[:DIRECTED]->(Movie) where Movie.title =~ '.*Matrix.*'
return d.name, d.born, Movie.title

// Questão 05.
match x=shortestPath((m:Movie {title: 'Cloud Atlas'})
  -[Person*0..15]-(n:Movie {title: 'That Thing You Do'})) 
return x;

// Challenge.
match (d:Person)-[:DIRECTED]->(m:Movie)<-[:ACTED_IN]-(a:Person) 
return d.name, m.title, a.name order by d.name;
