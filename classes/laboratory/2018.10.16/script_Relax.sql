CREATE TABLE Emp (
  CodEmp INTEGER NOT NULL,
  CodEmpGerente INTEGER,
  CodDepto INTEGER not null,
  NmEmp VARCHAR(30) NOT NULL,
  SnEmp VARCHAR(40) NOT NULL,
  DtNasc VARCHAR(40) NOT NULL,
  Ender VARCHAR(255) NOT NULL,
  CodSexo CHAR(1) NOT NULL,
  VlSalario INTEGER NOT NULL,
  constraint PK_emp PRIMARY KEY(CodEmp)
);

CREATE TABLE Depto (
  CodDepto INTEGER NOT NULL,
  CodEmpResponsavel INTEGER,
  NmDepto VARCHAR(45) NOT NULL,
  NmLocalizacao VARCHAR(45) NOT NULL,
  constraint PK_Depto PRIMARY KEY(CodDepto),
  constraint FK_DEPTO FOREIGN KEY(CodEmpResponsavel)
    REFERENCES Emp(CodEmp)
);

CREATE TABLE Depte (
  NroSequencia INTEGER NOT NULL,
  CodEmp INTEGER NOT NULL,
  NmDepte VARCHAR(100) NOT NULL,
  TpParentesco VARCHAR(25) not NULL,
  DtNasc VARCHAR(40) not NULL,
  CodSexo CHAR(1) not NULL,
  constraint PK_Depte PRIMARY KEY(NroSequencia, CodEmp),
  constraint FK_depte FOREIGN KEY(CodEmp) REFERENCES Emp(CodEmp)
);

CREATE TABLE Proj (
  CodProj INTEGER NOT NULL,
  CodDepto INTEGER NOT NULL,
  NmProj VARCHAR(60) NOT NULL,
  NmLocal VARCHAR(45) NOT NULL,
  constraint PK_Proj PRIMARY KEY(CodProj),
  constraint FK_PROJ FOREIGN KEY(CodDepto) REFERENCES Depto(CodDepto)
);

CREATE TABLE Alocado (
  CodProj INTEGER NOT NULL,
  CodEmp INTEGER NOT NULL,
  QtHoras INTEGER NOT NULL,
  constraint PK_Alocado PRIMARY KEY(CodProj, CodEmp),
  constraint FK_Alocado_Proj FOREIGN KEY(CodProj) REFERENCES Proj(CodProj),
  constraint FK_alocado_Emp FOREIGN KEY(CodEmp) REFERENCES Emp(CodEmp)
);

CREATE TABLE Consult (
  CodConsult INTEGER NOT NULL,
  CodDepto INTEGER NOT NULL,
  NmConsult VARCHAR(30) NOT NULL,
  SnConsult VARCHAR(40) NOT NULL,
  VlSalHora INTEGER,
  constraint PK_Conult PRIMARY KEY(CodConsult),
  constraint FK_Consult FOREIGN KEY(CodDepto) REFERENCES Depto(CodDepto)
);

insert into Depto values (1, 13, 'pesquisa', 'sao paulo'); 
insert into Depto values (2, 55, 'administracao', 'campinas');
insert into Depto values (3, 29, 'financeiro', 'campinas');

insert into Proj values (1, 2, 'reengenharia', 'SP');
insert into Proj values (2, 1, 'produto X', 'SP');
insert into Proj values (3, 2, 'reengenharia', 'MG'); 
insert into Proj values (4, 1, 'produto Y', 'SP'); 
insert into Proj values (5, 3, 'automatizacao', 'SP');

insert into Consult values (1, 2, 'Carlos', 'Figueroa', 32); 
insert into Consult values (2, 2, 'Sebastiao', 'Sa', null); 
insert into Consult values (3, 2, 'Cristina', 'Fernandes', 28); 
insert into Consult values (4, 3, 'Humberto', 'Osvaldo', 31); 
insert into Consult values (5, 3, 'Gustavo', 'Bianco', null); 
insert into Consult values (6, 3, 'Paula', 'Gilt', 41); 
insert into Consult values (7, 3, 'Fernanda', 'Dantas', null); 
insert into Consult values (8, 2, 'Francisca', 'da Silva', 33);

insert into Emp values (55, null, 2, 'PAulo', 'Shazan', '19-ABR-1952', 'R. Prof. Castilho, 2003', 'M', 21000); 
insert into Emp values (39, 55, 2, 'Ana', 'Paula', '19-JAN-1976', 'R. Prof. Isídio Cunha, 1', 'F', 4000); 
insert into Emp values (29, 55, 3, 'Tereza', 'Kohn', '22-JUN-1963', 'R. Prof. Mario Sá, 198', 'F', 7500); 
insert into Emp values (13, 55, 1, 'Gilberto', 'Vurg', '22-JAN-1960', 'R. Prof. Faustino, 111', 'M', 8000); 
insert into Emp values (17, 29, 3, 'Daniela', 'Smith', '12-SET-1980', 'Av. Ibirapuera, 1200', 'F', 2600); 
insert into Emp values (16, 29, 3, 'Fabiana', 'Schultz', '30-MAR-1977', 'Av. Ibirapuera, 91', 'F', 4500); 
insert into Emp values (2, 13, 1, 'Mariana', 'Campos', '22-MAI-1973', 'R. Cerro Cora, 190', 'F', 4500); 
insert into Emp values (1, 13, 1, 'Jose', 'Santos', '06-OUT-1961', 'R. Prof. Sebastiao, 15', 'M', 5000);

insert into Alocado values (2, 13, 80); 
insert into Alocado values (2, 1, 135); 
insert into Alocado values (4, 13, 60); 
insert into Alocado values (4, 2, 160); 
insert into Alocado values (4, 1, 50); 
insert into Alocado values (1, 55, 40); 
insert into Alocado values (1, 39, 165); 
insert into Alocado values (1, 13, 25); 
insert into Alocado values (3, 55, 30); 
insert into Alocado values (4, 29, 15); 
insert into Alocado values (5, 29, 70); 
insert into Alocado values (5, 16, 160); 
insert into Alocado values (5, 17, 125); 
insert into Alocado values (3, 17, 40);

insert into Depte values (1, 1, 'Ramiro Santos', 'filho', '22-JAN-1988', 'm'); 
insert into Depte values (2, 1, 'Samuel Santos', 'filho', '09-JAN-1990', 'm'); 
insert into Depte values (3, 13, 'Carla Vurg', 'esposa', '09-SET-1961', 'f'); 
insert into Depte values (4, 29, 'Gabriela Kohn', 'filha', '02-NOV-1982', 'f'); 
insert into Depte values (5, 29, 'Ricardo Kohn', 'filho', '01-FEV-1980', 'm');