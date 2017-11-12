--Se busca la base de datos y se borra en caso de existir
if exists(select name from dbo.sysdatabases where name = 'Db_CasoProgramado')
drop database [Db_CasoProgramado]
go
--Se crea la base de datos
create database [Db_CasoProgramado]
go
--Se utiliza la base de datos
use [Db_CasoProgramado]
go

--Se crea las entidades tablas
if exists(select name from dbo.sysobjects where name = 'Tbl_Motos')
drop table [Tbl_Motos]
go
create table [Tbl_Motos](
Placa varchar(30) not null primary key,
Precio decimal not null,
Tipo varchar(30) not null,
Modelo varchar(30) not null,
Descripcion varchar(max) not null,
Foto varbinary(max) not null,
NombreFoto varchar(max) not null)
go


if exists(select name from dbo.sysobjects where name = 'tipoMotos')
drop table [tipoMotos]
go
create table [tipoMotos](
id varchar(30) not null primary key,
tipo varchar(100) not null,
precio decimal not null)
go

insert into TipoMotos
values('1','Scooter',675000.00),('2','Montañera',1500000.00),('3','Cuadraciclo',1750000.00),('4','Pandillera',2000000.00)
go

---Relacion entre las motos con las catergorias
alter table [Tbl_Motos] add
constraint [FK_Motos_tipoMotos] foreign key(Tipo)
references [tipoMotos](id)
go

select  p.Placa, p.Modelo, t.tipo, p.Precio, p.Descripcion, p.NombreFoto
from  tipoMotos t
inner join Tbl_Motos p on p.Tipo = t.id
go

--procedimiento almacenado para insertar los datos 
if exists(select name from dbo.sysobjects
where name ='Sp_Ins_Motos')
drop procedure [Sp_Ins_Motos]
go
create procedure [Sp_Ins_Motos](
--los parametros del procedimiento inician con @
@Placa varchar(30),
@Precio decimal,
@Tipo varchar(30),
@Modelo varchar(30),
@Descripcion varchar(max),
@Foto varbinary(max),
@NombreFoto varchar(max))
as
insert into Tbl_Motos(Placa,Precio,Tipo,Modelo,Descripcion,Foto,NombreFoto)values(@Placa,@Precio,@Tipo,@Modelo,@Descripcion,@Foto,@NombreFoto)
go 

--procedimiento almacenado para consultar una Moto
if exists(select name from dbo.sysobjects where name = 'Sp_Cns_Motos')
drop procedure [Sp_Cns_Motos]
go
create procedure [Sp_Cns_Motos](
@placa varchar(30))
as
select  *
from  Tbl_Motos  m with(nolock)
where  m.Placa =@placa
go

--procedimiento almacenado para actualizar la informacion de la tabla motos
if exists(select name from dbo.sysobjects where name = 'Sp_Upd_Motos')
drop procedure [Sp_Upd_Motos]
go
create procedure [Sp_Upd_Motos](
@Placa varchar(30),
@Precio decimal,
@Tipo varchar(30),
@Modelo varchar(30),
@Descripcion varchar(max),
@Foto varbinary(max),
@NombreFoto varchar(max))
as
update [Tbl_Motos] set
Precio=@Precio,
Tipo=@Tipo,
Modelo=@Modelo,
Descripcion=@Descripcion,
Foto=@Foto,
NombreFoto=@NombreFoto
where Placa=@Placa
go

--procedimiento almacenado para borrar los datos de una moto
if exists(select name from dbo.sysobjects where name = 'Sp_Del_Motos')
drop procedure [Sp_Del_Motos]
go
create procedure [Sp_Del_Motos](
@placa varchar(30))
as
delete from Tbl_Motos
where Placa=@placa
go

select * from Tbl_Motos;

--procedimiento almacenado consultar datos de un TipoMoto
if exists(select name from dbo.sysobjects where name = 'Sp_Cns_TipoMoto')
drop procedure [Sp_Cns_TipoMoto]
go
Create procedure [Sp_Cns_TipoMoto](
@Id varchar(30))
as
select  m.precio
from  tipoMotos  m with(nolock)
where  m.id = @Id
go

exec [Sp_Cns_TipoMoto] 4

create view [Catalogo_Motos]
as
select c.id,c.tipo
from tipoMotos c with(nolock)
go
select * from Catalogo_Motos; 

if exists(select name from sysobjects where name = 'Catalogo_Motos')
drop view [Catalogo_Motos]
go
create view [Catalogo_Motos]
as
select c.id,c.tipo,c.precio
from tipoMotos c with(nolock)
go