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
--Se crea las entidades tablas
if exists(select name from dbo.sysobjects where name = 'Tbl_Clientes')
drop table [Tbl_Clientes]
go
create table [Tbl_Clientes](
Cedula int not null primary key,
Nombre varchar(30) not null,
Telefono int not null,
Ubicacion varchar(50) not null,
Pago varchar(10) not null)
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
@ubicac varchar(30),
@pago varchar(10))
as
insert into Tbl_Clientes(Cedula,Nombre,telefono,ubicacion,pago)values(@cedula,@nombre,@tele,@ubicac,@pago)
go 
--procedimiento almacena para consultar un cliente
if exists(select name from dbo.sysobjects where name = 'Sp_Cns_Clientes')
drop procedure [SP_Cns_CLientes]
go
create procedure [Sp_Cns_Clientes](
@Cedula int)
as
select cli.Cedula as Cedula,
cli.Nombre,
cli.telefono,
cli.Ubicacion,
cli.Pago
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
@cedula int,
@nombre varchar(30),
@tele int,
@ubicac varchar(30),
@pago varchar(50))
as 
UPDATE [dbo].[Tbl_Clientes]
   SET 
       [Nombre] = @nombre
      ,[Telefono] = @tele
      ,[Ubicacion] = @ubicac
      ,[Pago] = @pago
 WHERE Tbl_Clientes.Cedula = @cedula
go