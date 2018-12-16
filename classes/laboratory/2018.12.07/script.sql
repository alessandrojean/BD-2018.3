-- Questão 01
-- Item a.
create or replace function inserir_dependente(nro integer, depte varchar(30))
returns void as $$
declare
  nrof integer;
  dept varchar(30);
begin
  -- Efetua um select a procura do funcionário passado.
  select empnro into nrof from empmess where empnro = nro;
  -- Se ele não existe na tabela, dê uma exceção.
  if not found then
    raise exception 'Empregado não encontrado.';
  else
    -- Seleciona o nome do dependente, para verificar se é NULL.
    select deptenome into dept from empmess where empnro = nro;
    -- Se o dependente for NULL, significa que podemos apenas
    -- alterar a tupla e inserir o nome diretamente.
    if dept is null then
      update empmess set deptenome = depte where empnro = nro;
    -- Senão, precisamos duplicar a linha e inserir o novo dependente.
    else
      -- Aqui, o comando 'limit 1' é usado para limitar os resultados
      -- do select em apenas uma linha, que seria o "critério de desempate",
      -- quando o empregado possui mais de um dependente, além de poder
      -- possuir valores em seus atributos que se distinguem, mas ainda são
      -- o mesmo empregado.
      insert into empmess 
          select empnro, empnome, depte, deptonro, deptonome, deptogerente 
          from empmess where empnro = nro limit 1;
    end if;
  end if;
end;
$$ language plpgsql;

-- Insere o dependente em 22.
select inserir_dependente(22, 'Nicole');
-- Insere o dependente em 24.
select inserir_dependente(24, 'Pedro');

-- Item b.
-- Cria a tabela de departamentos.
create table Depto (
  DeptoNro integer not null,
  DeptoNome varchar(50) not null,
  DeptoGerente integer not null
);
-- Cria a tabela de empregados.
create table Emp (
  EmpNro integer not null,
  EmpNome varchar(50) not null,
  DeptoNro integer not null
);
-- Cria a tabela de dependentes.
create table Depte (
  EmpNro integer not null,
  DepteNome varchar(50) not null
);
-- Cria as constraints de cada tabela.
-- Chave primária do departamento.
alter table Depto add constraint pk_depto primary key (DeptoNro);
-- Chave primária do empregado.
alter table Emp add constraint pk_emp primary key (EmpNro);
-- Chave primária do dependente.
alter table Depte add constraint pk_depte primary key (EmpNro, DepteNome);
-- Chave estrangeira do gerente do departamento.
alter table Depto add constraint fk_depto 
    foreign key (DeptoGerente) references Emp (EmpNro);
-- Chave estrangeira do departamento do empregado.
alter table Emp add constraint fk_emp 
    foreign key (DeptoNro) references Depto (DeptoNro);
-- Chave estrangeira do responsável do dependente.
alter table Depte add constraint fk_depte 
    foreign key (EmpNro) references Emp (EmpNro);

-- Questão 02.
-- Item a.
insert into medico values (1, 'CarlosAlberto', 'P');
-- É possível inserir um médico com o mesmo número de identificação
-- pois a tabela não possui uma constraint de chave primária para
-- este campo. Para solucionar este problema, basta adicionar
-- uma constraint de chave primária com o comando abaixo.
alter table medico add constraint pk_medico primary key (codmedico);

-- Item b.
insert into medico values (2, 'AnaClara', 'X');
-- Não é possível inserir este novo médico pois o valor na coluna
-- 'tipmedico' viola a constraint 'tipmedicoCons' estabelecida na 
-- tabela medico para este campo. Os valores devem respeitar esta
-- constraint, isto é, devem ser somente 'P', 'R' ou 'C'.

-- Item c.
insert into paciente values (13, 'RivaldoRiver', 250);
-- Foi possível inserir um paciente com 250 anos de idade pois
-- não há nenhuma constraint que verifique se a idade é válida.
-- Para resolver este problema, pode-se adicionar uma constraint
-- na coluna idade que verifique, por exemplo, se a idade está
-- entre 0 e 105 com o comando abaixo.
alter table paciente add constraint idadeCons 
    check (idade >= 0 and idade <= 105);

-- Item d.
insert into consulta values (12, 21, '10/10/2018');
-- Não foi possível acrescentar mais de uma consulta no mesmo dia
-- para pacientes e médicos distintos pois a coluna 'datconsulta'
-- possui uma constraint de chave primária. Para permitir múltiplas
-- consultas no mesmo dia, pode-se redefinir a chave primária da
-- tabela para ser uma chave composta levando em conta todas as
-- colunas da tabela 'consulta' com os comandos abaixo.
alter table consulta drop constraint pk_consulta;
alter table consulta add constraint pk_consulta 
    primary key (codpac, codmedico, datconsulta);

-- Item e.
insert into consulta values (99, 99, '11/11/2018');
-- Foi possível acrescentar uma consulta a médicos e/ou pacientes
-- inexistentes pois as colunas 'codpac' e 'codmedico' não possuem
-- uma constraint de chave estrangeira. Para impedir casos semelhantes
-- deve-se adicionar tais constraints através dos comandos abaixo.
alter table consulta add constraint fk_consulta_pac 
    foreign key (codpac) references paciente (codpac);
alter table consulta add constraint fk_consulta_medico 
    foreign key (codmedico) references medico (codmedico);
-- É importante ressaltar que para tais comandos funcionarem, a tabela
-- 'medico' e 'paciente' também devem possuir uma constraint de chave
-- primária, como definido para 'medico' no item a da questão 02.
-- Basta então criar uma constraint para paciente.
alter table paciente add constraint pk_paciente primary key (codpac);
