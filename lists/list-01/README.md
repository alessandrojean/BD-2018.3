# Lista de Exercícios Adicionais 1 - SQL e Álgebra
*Lista de exercícios do Prof. João Marcelo Borovina Josko, CMCC/UFABC*.

## Parte 1 - Utilizar SQL-DML

1. Selecionar o nome e sobrenome dos empregados e consultores
   que trabalham no departamento "Financeiro".

2. Selecionar o nome, data de nascimento e o salário dos
   empregados cujos salários estejam entre 4000 e 15000
   e que não possuem dependentes.

3. Selecionar o nome, sobrenome e salário anual dos consultores
   que estão alocados em departamentos localizados em Campinas.
   Lembre-se que a relação consultor apresenta o
   **salário por hora**. Ordene o resultado pelo salário
   anual em ordem decrescente. Deseja-se somente aqueles
   consultores com valores diferentes de `null`.

4. Selecionar o nome do departamento e nome do projeto a quantidade
   de empregados alocados, bem como o volume de horas de alocação.
   Deseja-se somente considerar os empregados **com dependentes**
   que participam de projetos. Ordene o resultado por
   nome do departamento e nome do proeto em ordem ascendente.

5. Selecionar o nome e sobrenome do empregado e a quantidade
   de dependentes. Deve-se apresentar **todos os empregados**,
   independente de terem ou não dependentes.

6. Acrescente, utilizando `insert` com `select`, um novo
   departamento de código igual a 10 chamado "Logística".
   Sabe-se o responsável por esse departamento será o
   empregado "Jose Santos".

7. Converta a expressão algébrica abaixo na correspondente
   instrução SQL.

   ```text
   X = π CodEmpResponsavel (σ CodDepto = 1 Depto)
   Y = π CodEmp Emp - X
   K = (π CodEmpResponsavel (σ CodDepto ≠ 1 Depto)) ∪ Y
   π NmEmp, SnEmp (K ⨝ Emp)
   ```

## Parte 2 - Utilizar Álgebra Relacional

1. Converta a instrução SQL abaixo em uma expressão de álgebra
   relacional análoga.

   ```sql
   select e.nmemp, e.snemp, count(d.codemp)
   from Emp e left join Depte d using(codemp)
   group by e.nmemp, e.snemp;
   ```

2. Converta a instrução SQL gerada na **questão S2** em uma
   expressão de álgebra relacional.

3. Selecione o nome e quantidade de subordinados que cada
   gerente possui.

4. Muitas operações algébricas podem ser escritas em função de
   operações base. Sejam as relações `R(A, B)` e `T(B, C)`
   com atributos inteiros, crie uma expressão algébrica
   utilizando os demais operadores que forneça o mesmo
   resultado da operação `R ⟕ R.B = T.B ∧ T.C > 0 T`.

5. Suponha as relações `R(A, B)` e `T(B, C)` onde todos os
   atributos são inteiros. Das três expressões
   apresentadas abaixo, duas são equivalentes (produzem o
   mesmo resultado). Apresente um pequeno conjunto de
   instâncias de dados para as relações `R` e `T` que demonstre
   (passo a passo) qual é a expressão que produz um resultado
   diferente.

   1. `π A, C (R ⨝ (σ B = 1 T))`
   2. `π A (σ = 1 R) ⨯ π C (σ B = 1 T)`
   3. `π A, C (π A R ⨯ (σ B = 1 T))`

## Revisão Teórica

1. Qual a diferença entre uma chave candidata e uma chave
   primária determinada?

2. Baseado na teoria do modelo relacional, dê as razões
   por que a tabela abaixo **não pode ser** considerada 
   uma relação

   | A | B   | A |
   | - | --- | - |
   | 1 | 2   | s |
   | 1 | 2   | b |
   | 1 | 2,3 | ? |
   | 1 | 45  | c |
   | 1 | 43  | x |
   | 1 | 2   | s |

3. Apresente e discuta brevemente duas aplicações que 
   **não devem usar** um sistema gerenciador de banco
   de dados.