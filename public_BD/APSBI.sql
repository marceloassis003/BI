create DATABASE APS_BI
go

USE APS_BI
GO

--|**********************************|
--|      CRIANDO DATA WORHOUSE       |
--|**********************************|

create table Dimdata(
datekey int  not null primary key,
dthora datetime not null,
ano smallint not null

);


create table Dimpaises (
paiskey int  identity (1,1) not null primary key,
regiao varchar (25) ,
cidade varchar (50)
);

create table Dimdenuncias (
denunciaskey  int not null primary key , 
nivel varchar (25) not null,
nome varchar (25) ,
email varchar (50) 

);


create table Dimtratativa(
provkey int identity (1,1) not null primary key , 
andamento varchar(25),
agente varchar(25),
dttratativa date not null,
retorno varchar (25)
);

create table FatoDenuncias(
fatokey int identity (1,1) ,
datekey int not null,
paiskey int not null,
denunciaskey int not null,
provkey int not null,
statusden varchar(25) not null,
arquivada varchar (5)
);

select * from Dimdata
select * from Dimpaises
select * from Dimdenuncias
select * from Dimtratativa
select * from FatoDenuncias

--|**********************************|
--|   ADICIONANDO AS FKS AS TABELAS  |
--|**********************************|

alter table FatoDenuncias with check add
constraint fk_FatoDenuncias_Dimdata
foreign key (datekey)
references Dimdata (datekey)

alter table FatoDenuncias with check add
constraint fk_FatoDenuncias_Dimpaises
foreign key (paiskey)
references Dimpaises (paiskey)

alter table FatoDenuncias with check add
constraint fk_FatoDenuncias_Dimdenuncias
foreign key (denunciaskey)
references Dimdenuncias (denunciaskey)

alter table FatoDenuncias with check add
constraint fk_FatoDenuncias_Dimtratativa
foreign key (provkey)
references Dimtratativa (provkey)





--|**********************************|
--|carregando aquivos para as tabelas|
--|**********************************|

insert into Dimdata (datekey,dthora,ano)
select Coddenuncia , dataden, codpais  from World_Survive.dbo.Denuncias
go

select * from Dimdata


insert into Dimpaises ( regiao, cidade)
select  paisnome, null from World_Survive.dbo.paises 
go

select * from Dimpaises

insert into Dimdenuncias (denunciaskey, nivel, nome )
select coddenuncia, nivel, tipo from World_Survive.dbo.Denuncias
go
select * from Dimdenuncias


insert into Dimtratativa (andamento, dttratativa)  
select c.statusden, D.dataden from World_Survive.dbo.Central_mund C
inner join World_Survive.dbo.Denuncias D
on C.coddenuncia = D.coddenuncia 
go

select * from Dimtratativa

 
insert into fatodenuncias  (datekey, paiskey,denunciaskey,provKey,statusden, arquivada)
select p.idcontinente ,p.codpais, D.Coddenuncia ,c.idprov,c.statusDen, p.idcontinente from  World_Survive.dbo.paises P 
inner join World_Survive.dbo.Denuncias D 
on D.codpais = P.codpais
inner join World_Survive.dbo.Central_mund C
on C.coddenuncia = d.coddenuncia 
group by p.codpais, D.Coddenuncia,c.idprov,c.statusDen, p.idcontinente
go

select * from fatodenuncias



