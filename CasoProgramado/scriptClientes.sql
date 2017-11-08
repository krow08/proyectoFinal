-----Scripts para el diseño de la base de datos parte Cliente
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

select * from Tbl_Clientes

--Se crea las entidades tablas
if exists(select name from dbo.sysobjects where name = 'Tbl_Clientes')
drop table [Tbl_Clientes]
go
create table [Tbl_Clientes](
Cedula int not null primary key,
Nombre varchar(30) not null,
Telefono int not null,
Ubicacion varchar(100) not null,
Pago varchar(10) not null,
numeroCheque int,
nombreBanco varchar(30),
Email varchar(30) not null,
Password varchar(150) not null)
go

alter table [Tbl_Clientes] add Latitud varchar(max)
go
alter table [Tbl_Clientes] add Longitud varchar(max)
go

--procedimiento almacenado para insertar los datos 
if exists(select name from dbo.sysobjects
where name ='Sp_Ins_clientes')
drop procedure [Sp_Ins_clientes]
go
create procedure [Sp_Ins_clientes](
--los parametros del procedimiento inician con @
@Cedula int,
@nombre varchar(30),
@tele int,
@ubicac varchar(100),
@pago varchar(10),
@numeroCheque int,
@nombreBanco varchar(30),
@email varchar(30),
@password varchar(150),
@latitud varchar(max),
@longitud varchar(max))
as
insert into Tbl_Clientes(Cedula,Nombre,telefono,ubicacion,pago,numeroCheque,nombreBanco,Email,Password,Latitud,Longitud)values(@cedula,@nombre,@tele,@ubicac,@pago,@numeroCheque,@nombreBanco,@email,@password,@latitud,@longitud)
go 
--procedimiento almacena para consultar un cliente
if exists(select name from dbo.sysobjects where name = 'Sp_Cns_Clientes')
drop procedure [SP_Cns_CLientes]
go
create procedure [Sp_Cns_Clientes](
@Cedula int)
as
select cli.Cedula,
cli.Nombre,
Cli.Telefono,
cli.Ubicacion,
cli.Pago,
cli.Email,
Cli.Password,
cli.numeroCheque,
cli.nombreBanco,
cli.Latitud,
cli.Longitud

from Tbl_Clientes cli
where cli.Cedula = @Cedula

--Proceso almacenado para eliminar clientes
if exists(select name from dbo.sysobjects where name = 'Sp_Del_Cliente')
drop procedure [Sp_Del_Cliente]
go
---procedimiento almacenamiento para borrar los datos de un cliente
if exists(select name from dbo.sysobjects where name = 'Sp_Del_Cliente')
drop procedure [Sp_Del_Cliente]
go--lleva a los procedimiento de transa
create procedure [Sp_Del_Cliente](
@Cedula int)
as
delete from Tbl_Clientes
where Cedula = @Cedula



---Procedimiento almacenamiento para modificar el cliente
if exists(select name from dbo.sysobjects where name = 'Sp_Mod_Clientes')
drop procedure[Sp_Mod_Clientes]
go
create procedure [Sp_Mod_Clientes](
@Cedula int,
@nombre varchar(30),
@tele int,
@ubicac varchar(100),
@pago varchar(10),
@numeroCheque int,
@nombreBanco varchar(30),
@email varchar(30),
@password varchar(150),
@latitud varchar(max),
@longitud varchar(max))
as
UPDATE [dbo].[Tbl_Clientes]
   SET 
       [Nombre] = @nombre
      ,[Telefono] = @tele
      ,[Ubicacion] = @ubicac
      ,[Pago] = @pago
	  ,[Email] = @email
	  ,[Password] = @password
	  ,[numeroCheque] = @numeroCheque
	  ,[nombreBanco] = @nombreBanco
	  ,[Latitud] = @latitud
	  ,[Longitud] = @longitud

 WHERE Tbl_Clientes.Cedula = @cedula
go

select * from Tbl_Clientes