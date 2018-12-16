
/* 1 passo */
CREATE TABLE EmpMess (
  EmpNro INTEGER NOT NULL,
  EmpNome   VARCHAR(50)  NULL,
  DepteNome VARCHAR(50) NULL,
  DeptoNro  Integer NULL,
  DeptoNome VARCHAR(255) NULL,
  DeptoGerente integer  NULL
);



/* EmpMess */
insert into EmpMess values (21, 'Joao', null, 5, 'Financeiro', 91); 
insert into EmpMess values (22, 'Maria', 'Andre', 5, 'Financeiro', 91);
insert into EmpMess values (22, 'Maria''s', 'Rosana', 5, 'Financeiro', 91); 
insert into EmpMess values (23, 'Ana', 'Carlos', 6, 'Tesouraria', 91); 
insert into EmpMess values (23, 'Ana', 'Ricardo', 6, 'Tesouraria', 93); 
insert into EmpMess values (24, 'Carlos', null, 5, 'Financeiro', 91); 
insert into EmpMess values (25, 'Teobaldo', null, 7, 'Operacoes', 94); 
