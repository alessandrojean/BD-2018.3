-- PARTE 1
-- Questão S1
select nmemp, snemp from Emp 
where coddepto in (select coddepto from Depto where nmdepto = 'financeiro')
union
select nmconsult, snconsult from Consult
where coddepto in (select coddepto from Depto where nmdepto = 'financeiro');

-- Questão S2
select nmemp, dtnasc, vlsalario from emp
where vlsalario between 4000 and 15000
      and codemp not in (select codemp from depte);
        
-- Questão S3
select nmconsult, snconsult, vlsalhora * 1920 SalAnual
from Consult
where coddepto in (select coddepto from depto where nmlocalizacao = 'campinas')
      and vlsalhora * 1920 is not null
order by vlsalhora * 1920 desc;

-- Questão S4
select nmdepto, nmproj, count(*) TotEmp, sum(qthoras) VlHrs
from Depto
inner join Proj using (coddepto)
inner join Alocado using (codproj)
where codemp in (select codemp from depte)
group by nmproj, nmdepto
order by nmdepto asc, nmproj asc;

-- Questão S5
select e.nmemp, e.snemp, count(d.codemp) as QtDepte
from emp e left join depte d on e.codemp = d.codemp
group by e.nmemp, e.snemp;

-- Questão S6
insert into depto
select 10, codemp, 'Logistica', 'sao paulo'
from emp where nmemp = 'Jose' and snemp = 'Santos';

-- Questão S7
delete from depto 
where codempresponsavel = (select codemp from emp
                           where nmemp = 'Jose'
                                 and snemp = 'Santos');

-- Questão S8
-- X
select codempresponsavel from Depto
where coddepto = 1;
-- Y
select codemp from Emp 
except (select codempresponsavel 
	      from Depto 
	      where coddepto = 1);
-- K
select codempresponsavel from Depto
where coddepto <> 1
union
select codemp from Emp 
except (select codempresponsavel 
	      from Depto 
	      where coddepto = 1);
-- Final
select e.nmemp, e.snemp
from Emp e
natural join (select codempresponsavel from Depto
              where coddepto <> 1
              union
              select codemp from Emp 
              except (select codempresponsavel 
                      from Depto 
                      where coddepto = 1));
-- Observação:
-- O resultado do Postgre retorna 56 tuplas
-- por causa do natural join. No entanto,
-- utilizando a álgebra dada no Relax,
-- até a união, o resultado também é de 56
-- tuplas, mas, ao aplicar o operador π,
-- o mesmo aplica junto um distinct, retornando
-- 8 tuplas. O resultado do Relax é equivalente
-- a todos os empregados, então, se assumirmos
-- o resultado deste como correto, podemos
-- simplificar o SQL para:
select nmemp, snemp from Emp;

-- PARTE 2
-- Questão A1
X = Emp ⟕ Emp.CodEmp = Depte.CodEmp Depte
γ NmEmp, SnEmp; count(Depte.CodEmp)->Total (X)

-- Questão A2
X = π CodEmp σ VlSalario >= 4000 ∧ VlSalario <= 15000 (Emp)
Y = X - (π CodEmp (Depte))
π NmEmp, SnEmp, VlSalario (Y ⨝ Emp)

-- Questão A3
R = (ρ g Emp) ⟖ e.CodEmpGerente = g.CodEmp (ρ e Emp)
γ g.NmEmp, g.SnEmp; count(*)->Quant (R)

-- Questão A4
σ R.B = T.B ∧ T.C > 0 (R ⨯ T)

-- Questão A5
-- Conjunto de instâncias de dados
R: | A | B |  T: | B | C |
   | 1 | 1 |     | 1 | 9 |
   | 3 | 3 |     | 3 | 7 |
   | 9 | 5 |     | 5 | 5 |

-- Item i
π A, C (R ⨝ (σ B = 1 T))
-- Resultado
| R.A | T.C |
|   1 |   9 |

-- Item ii
π a (σ b = 1 R) ⨯ π c (σ b = 1 T)
-- Resultado
| R.a | T.c |
|   1 |   9 |

-- Item iii
π a, c (π a R ⨯ (σ b = 1 T))
-- Resultado
| R.a | T.c |
|   1 |   9 |
|   3 |   9 |
|   9 |   9 |

-- Os itens i e ii são iguais.
-- O item iii produz um resultado diferente pois
-- ele não limita as tuplas de R, assim, todas
-- participam do produto cartesiano com a tupla
-- selecionada em T.

-- PARTE 3
-- Questão T1
-- Uma chave candidata é um conjunto de atributos
-- que são candidatos a serem a chave primária de uma
-- tabela. Por exemplo, em uma tabela que estamos
-- guardando pessoas, podemos assumir que não existirá
-- outra pessoa com o mesmo nome que more no mesmo
-- endereço, então {NomePessoa, EndPessoa} é
-- uma chave candidata, assim como {RGPessoa} também é.
-- O conjunto {RGPessoa, NomePessoa} não é uma chave
-- candidata pois somente o atributo RGPessoa sozinho
-- já é uma chave candidata.

-- Uma chave primária é uma chave candidata escolhida
-- pelo criador do banco de dados como a principal
-- forma de indentificar unicamente uma tupla em uma
-- tabela. Para isto, seus valores devem ser únicos.
-- Por exemplo, em uma tabela que estamos guardando
-- pessoas, poderíamos usar o RG como a chave primária.
-- Geralmente utiliza-se um id, um número crescente
-- que começa em 1 e é incrementado a cada tupla
-- inserida na tabela.

-- Questão T2
-- A tabela não pode ser considerada uma relação
-- pois apresenta algumas inconsistências já
-- inicialmente em sua construção, que são a
-- presença de duas colunas com o mesmo nome.
-- Assumindo que a primeira coluna é chave primária,
-- as tuplas da tabela não mantém a consistência
-- dos dados pois há várias entradas com a mesma
-- identificação, o que não é permitido.

-- Questão T3
-- Sites estáticos, como, por exemplo, um site
-- que contém apenas informações simples de um evento
-- qualquer não necessitam de banco de dados pois
-- baseiam-se em informações estáticas e que não
-- vão precisar de constante gerenciamento das informações.
-- Softwares simples sem configurações, que servem
-- para um único intuito, como, por exemplo, um conversor
-- de unidades, não precisam de um banco de dados
-- pois não estão gerenciando dados e armazenando
-- para usos e consultas futuras, devem apenas converter
-- a unidade de entrada para a de saída.