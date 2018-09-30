/* Questão 1 */
select nmemp, snemp from emp 
where nmemp like '%na' or snemp like 'S%';

/* Questão 2 */
select nmemp, dtnasc, vlsalario from emp 
where vlsalario = 4000 
      or vlsalario = 4500
      or vlsalario = 5000 
      or codsexo = 'M';

/* Questão 3 */
select nmemp, snemp from emp 
where codemp in
        (select codemp from alocado 
         group by codemp 
         having count(codemp) = 1);
		
/* Questão 4 */
select a.codproj, p.nmproj, count(*) as TotTemp, sum(qthoras) as VolHr
from alocado a, proj p 
where a.codproj = p.codproj 
group by a.codproj, p.nmproj 
having count(*) > 2 
order by p.nmproj asc, sum(qthoras) desc;

/* Questão 5 */
select e.nmemp, e.snemp, count(d.codemp) as QtDep
from Emp e left join Depte d on e.codemp = d.codemp
group by e.nmemp, e.snemp;

/* Questão 6 */
select nmemp, snemp from emp 
where (nmemp like '%na' or snemp like 'S%')
       and codemp in
	 (select codemp from alocado 
        group by codemp having count(codemp) = 1);
	
/* Questão 7 */
update emp set vlsalario = vlsalario * 1.2
where coddepto in (select coddepto from depto where nmdepto = 'financeiro')
returning nmemp, vlsalario;

/* Challenge 1 */
select b.nmemp, b.codsexo, sum(e.vlsalario)
from emp b right join emp e on e.codempgerente = b.codemp
group by b.nmemp, b.codsexo
order by b.nmemp desc;

/* Challenge 2 */
select d.nmdepto, sum(cs.vlsalhora * 160) / count(*) as MedSalEmp, count(cs.codconsult) as QtCon
from depto d left join consult cs on d.coddepto = cs.coddepto
group by d.nmdepto
order by d.nmdepto asc;

