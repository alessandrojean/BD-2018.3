
create table medico
(	codmedico	integer not null,
	nommedico	varchar(50) null,
	tipmedico	char(1) not null constraint tipmedicoCons check (tipmedico in ('P','R','C')) 
);

create table paciente
(	codpac	integer not null primary key,
	nompac	varchar(50) null,
	idade	integer not null
);

create table consulta
(	codpac integer not null,
    codmedico integer not null,
    datConsulta date not null,
    constraint pk_consulta primary key (datconsulta)
);

insert into medico values (1, 'Carlos Alberto', 'P');
insert into medico values (21, 'Marilia Pera', 'C');
insert into paciente values (10, 'Francisco Antonio', 25);
insert into paciente values (12, 'Carlitos Francesco', 35);
insert into consulta values (10, 1, '10/10/2018');