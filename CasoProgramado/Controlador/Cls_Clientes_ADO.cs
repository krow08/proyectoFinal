using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Modelo;

namespace Controlador
{
    public class Cls_Clientes_ADO
    {
        //Objetos para interactuar con la base de datos
        //objetos para interactuar con la base datos
        private SqlConnection conexion;
        private SqlCommand comando;
        private string stringConexion;

        //Metodo que recibe todos los datos del objeto tipo cliente
        public void Registrar(Cls_Clientes pCliente)
        {
            try//controlar un error en caso que exista
            {
                //se requiere una conexion
                this.conexion = new SqlConnection(this.stringConexion);
                this.conexion.Open();

                //se crea el comando que llama al procedimiento para insertar los datos
                this.comando = new SqlCommand();
                this.comando.Connection = this.conexion;
                this.comando.CommandText = "[Sp_Ins_Clientes]"; //Sp=storedProcedure  Ins=Insertar
                this.comando.CommandType = System.Data.CommandType.StoredProcedure;
                this.comando.Parameters.AddWithValue("@cedula", pCliente.Cedula);
                this.comando.Parameters.AddWithValue("@nombre", pCliente.Nombre);
                this.comando.Parameters.AddWithValue("@tele", pCliente.Telefono);
                this.comando.Parameters.AddWithValue("@ubicac", pCliente.Ubicacion);
                this.comando.Parameters.AddWithValue("@pago", pCliente.Pago);
                this.comando.Parameters.AddWithValue("@email", pCliente.Email);
                this.comando.Parameters.AddWithValue("@password", pCliente.Password);
                this.comando.Parameters.AddWithValue("@numeroCheque", pCliente.NumeroCheque);
                this.comando.Parameters.AddWithValue("@nombreBanco", pCliente.NombreBanco);
                this.comando.Parameters.AddWithValue("@latitud", pCliente.latitud);
                this.comando.Parameters.AddWithValue("@longitud", pCliente.longitud);


                //ejecucion del comando, sin consulta
                this.comando.ExecuteNonQuery();
                //cierre la conexion
                this.conexion.Close();

                //Liberamos memoria con el dispose()
                this.conexion.Dispose();
                this.comando.Dispose();

            }
            //si existe un error el catch lo controla, retornando el error en la siguiente capa 
            catch (Exception ex)
            {
                throw ex;
            }
        }
        //Constructor de  Clase ADO, recibe los datos del string de conexion
        public Cls_Clientes_ADO(string pStrConexion)
        {
            //atributo de clase, almacena el valor del parametro
            this.stringConexion = pStrConexion;
        }
        //METODO PARA CONSULTAR LA INFORMACION DE UN CLIENTE
        public Cls_Clientes consultarCliente(String pCedula)
        {
            try
            {
                //Clase del modelo
                Cls_Clientes varCli = null;

                //Crear la conexion
                //Recibe el string de conexion para el servidor
                this.conexion = new SqlConnection(this.stringConexion);

                //Se instancia un comando
                this.comando = new SqlCommand();

                //abrir la conexion
                this.conexion.Open();

                //Se asigna la conexion al comando
                this.comando.Connection = this.conexion;

                //utiliza un procedimiento almacenado en SQL Server
                this.comando.CommandText = "[Sp_Cns_Clientes]";
                this.comando.CommandType = System.Data.CommandType.StoredProcedure;

                //Se asigna el parametro al comando
                //recuerde la variable pCedula llega como parametro
                this.comando.Parameters.AddWithValue("@Cedula", pCedula);

                //Lector de datos
                SqlDataReader lector = null;
                //utilizamos el comando, para ejecutar lectura
                lector = this.comando.ExecuteReader();

                //Se realiza la lectura de datos, en caso no leer genera un error
                if (lector.Read())
                {
                    //Lector es un vector de posiciones
                    //0 =CedulaCliente, 1 = nombre, 2 = Apellido1...
                    //Se instancia un cliente con los datos del lector
                    varCli = new Cls_Clientes(int.Parse(lector.GetValue(0).ToString()),
                        lector.GetValue(1).ToString(),
                        int.Parse(lector.GetValue(2).ToString()),
                        lector.GetValue(3).ToString(),

                        lector.GetValue(4).ToString(),
                        lector.GetValue(5).ToString(),
                        lector.GetValue(6).ToString());

                    varCli.NumeroCheque = int.Parse(lector.GetValue(7).ToString());
                    varCli.NombreBanco = lector.GetValue(8).ToString();
                    varCli.latitud = lector.GetValue(9).ToString();
                    varCli.longitud= lector.GetValue(10).ToString();
                    

                    //siempre hay que cerrar le lector o el metodo o conexion
                    lector.Close();

                }
                else
                {
                    throw new Exception("NO existe ningun cliente con la cedula # " + pCedula);
                }
                conexion.Close();
                conexion.Dispose();
                comando.Dispose();
                lector = null;

                //Este metodo retorna la instancia del objeto
                return varCli;
            }
            catch (Exception ex)
            {
                //throw = retorna un error
                throw ex;
            }
        }
        //Metodo para elimanar la informacion de un cliente
        public void BorrarCliente(string pCedula)
        {
            try
            {
                //se instancia la conexion
                this.conexion = new SqlConnection(this.stringConexion);
                //se abre la conexion
                this.conexion.Open();
                //se instancia el comando
                this.comando = new SqlCommand();
                //se asigna al comando la conexion
                this.comando.Connection = this.conexion;

                //se indica el procedimiento almacenado para eliminar
                this.comando.CommandText = "Sp_Del_Cliente";
                //indicar tipo de comando
                this.comando.CommandType = System.Data.CommandType.StoredProcedure;
                //se asigna el parametro al comando
                this.comando.Parameters.AddWithValue("@Cedula", pCedula);

                //se ejecuta el comando, no devuelv nada
                this.comando.ExecuteNonQuery();

                this.conexion.Close();
                this.conexion.Dispose();
                this.comando.Dispose();


            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        //Metodo para modificar la informacion de un cliente
        public void modificarCliente(Cls_Clientes pCliente)
        {
            try//controlar un error en caso que exista
            {
                //se requiere una conexion
                this.conexion = new SqlConnection(this.stringConexion);
                this.conexion.Open();

                //se crea el comando que llama al procedimiento para insertar los datos
                this.comando = new SqlCommand();
                this.comando.Connection = this.conexion;
                this.comando.CommandText = "[Sp_Mod_Clientes]"; //Sp=storedProcedure  Ins=Insertar
                this.comando.CommandType = System.Data.CommandType.StoredProcedure;
                this.comando.Parameters.AddWithValue("@cedula", pCliente.Cedula);
                this.comando.Parameters.AddWithValue("@nombre", pCliente.Nombre);
                this.comando.Parameters.AddWithValue("@tele", pCliente.Telefono);
                this.comando.Parameters.AddWithValue("@ubicac", pCliente.Ubicacion);
                this.comando.Parameters.AddWithValue("@pago", pCliente.Pago);
                this.comando.Parameters.AddWithValue("@numeroCheque", pCliente.NumeroCheque);
                this.comando.Parameters.AddWithValue("@nombreBanco", pCliente.NombreBanco);
                this.comando.Parameters.AddWithValue("@email", pCliente.Email);
                this.comando.Parameters.AddWithValue("@password", pCliente.Password);


                //ejecucion del comando, sin consulta
                this.comando.ExecuteNonQuery();
                //cierre la conexion
                this.conexion.Close();

                //Liberamos memoria con el dispose()
                this.conexion.Dispose();
                this.comando.Dispose();

            }
            //si existe un error el catch lo controla, retornando el error en la siguiente capa 
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }//Cierre de clase
}//Cierre de namespace
