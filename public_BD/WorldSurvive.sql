create database World_Survive


create table Continentes(
idcontinente int primary key ,
nomecont varchar(25) not null
);


create table paises(
codpais int primary key identity,
paisnome varchar(25) not null, 
idcontinente int foreign key 
references Continentes
);

select * from paises

create table Denuncias (
Coddenuncia int primary key identity,
tipo varchar(50) not null,
nivel varchar(25) not null,
dataden date , 
codpais int foreign key 
references paises

);

create table Central_mund(
idprov int primary key identity,
classificacao varchar (50) not null ,
statusDen varchar (25)not null,
Coddenuncia int foreign key 
references Denuncias

);
select * from Central_mund

insert into Continentes
values('1','Africa')


insert into Continentes
values('2','America')

insert into Continentes
values('3','Antartica')

insert into Continentes
values('4','Asia')

insert into Continentes
values('5','Europa')

insert into Continentes
values('6','oceania')


select * from Continentes

insert into paises
values ('Brasil', '2')

insert into paises
values ('EUA', '2')

insert into paises
values ('afeganistao', '4')

insert into paises
values ('alemanha', '5')

insert into paises
values ('africadosul', '1')

insert into paises
values ('Argentina', '2')


select * from paises

insert into Denuncias
values ('desmatamento','basico', '10/08/2007','4')

insert into Denuncias
values ('queimadas','basico', '07/08/2009','2')


insert into Denuncias
values ('contaminaçao','intemediario', '04/06/2007','2')


insert into Denuncias
values ('exploraçao','critico', '22/02/2003','3')


insert into Denuncias
values ('queimadas','critico', '10/07/2009','6')


insert into Denuncias
values ('poluiçao industrial','basico', '04/08/2001','3')

insert into Denuncias
values ('poluiçao industrial','critico', '20/04/2011','3')

insert into Denuncias
values ('poluiçao industrial','intermediario', '25/06/2003','3')

insert into Denuncias
values ('mao de obra infantil','intermediario', '06/07/2018','2')

insert into Denuncias
values ('mao de obra infantil','critico', '07/08/2009','4')

insert into Denuncias
values ('mao de obra infantil','basico', '29/11/2013','6')





select * from Denuncias

insert into Central_mund
values ('grvave','aberta','1')

insert into Central_mund
values ('gravissima','fechada','2')

insert into Central_mund
values ('media','aberta','3')

insert into Central_mund
values ('baixorisco','aberta','4')

insert into Central_mund
values ('grvave','aberta','5')

insert into Central_mund
values ('gravissima','atendimento','6')

insert into Central_mund
values ('medio','fechada','7')

insert into Central_mund
values ('baixorisco','atendimento','8')

insert into Central_mund
values ('gravissima','aberta','9')

insert into Central_mund
values ('baixorisco','atendimento','10')

insert into Central_mund
values ('gravissima','aberta','11')

insert into Central_mund
values ('gravissima','aberta','12')

insert into Central_mund
values ('gravissima','aberta','13')

insert into Central_mund
values ('medio','atendimento','14')

insert into Central_mund
values ('baixorisco','aberta','15')

insert into Central_mund
values ('baixorisco','atendimento','16')

insert into Central_mund
values ('medio','fechada','17')

insert into Central_mund
values ('grave','fechada','1
8')

insert into Central_mund
values ('medio','aberta','19')

insert into Central_mund
values ('gravissima','aberta','20')

select * from Central_mund

--***************TABELAS***********************
select * from Continentes
select * from paises
select * from Denuncias
select * from Central_mund


