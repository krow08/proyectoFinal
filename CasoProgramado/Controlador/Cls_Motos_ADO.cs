using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//se agregan las referencias al modelo y a la base de datos
using Modelo;
using System.Data.SqlClient;

namespace Controlador
{
    public class Cls_Motos_ADO
    {
        private SqlConnection conexion;
        private SqlCommand comando;
        private string stringConexion;

        public Cls_Motos_ADO(string pStrConexion)
        {
            this.stringConexion = pStrConexion;
        }
        public void RegistrarMotos(Cls_Motos pPlaca)
        {
            try
            {
                //Se requiere una conexion
                this.conexion = new SqlConnection(this.stringConexion);
                this.conexion.Open();

                //Se crea el comando que llama al procedimiento almacenado para insertar datos.
                this.comando = new SqlCommand();
                this.comando.Connection = this.conexion;
                this.comando.CommandText = "[Sp_Ins_Motos]";
                this.comando.CommandType = System.Data.CommandType.StoredProcedure;
                this.comando.Parameters.AddWithValue("@Placa", pPlaca.placa);
                this.comando.Parameters.AddWithValue("@Precio", pPlaca.precio);
                this.comando.Parameters.AddWithValue("@tipo", pPlaca.tipo);
                this.comando.Parameters.AddWithValue("@modelo", pPlaca.Modelo);
                this.comando.Parameters.AddWithValue("@descripcion", pPlaca.Descripcion);
                this.comando.Parameters.AddWithValue("@foto", pPlaca.foto);
                this.comando.Parameters.AddWithValue("@NombreFoto", pPlaca.nombreFoto);

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

        public void ModificarMotos(Cls_Motos pPlaca)
        {

            try
            {
                
                this.conexion = new SqlConnection(this.stringConexion);
                this.conexion.Open();


                this.comando = new SqlCommand();
                this.comando.Connection = this.conexion;
                this.comando.CommandText = "[Sp_Upd_Motos]";
                this.comando.CommandType = System.Data.CommandType.StoredProcedure;
                this.comando.Parameters.AddWithValue("@Placa", pPlaca.placa);
                this.comando.Parameters.AddWithValue("@Precio", pPlaca.precio);
                this.comando.Parameters.AddWithValue("@tipo", pPlaca.tipo);
                this.comando.Parameters.AddWithValue("@modelo", pPlaca.Modelo);
                this.comando.Parameters.AddWithValue("@descripcion", pPlaca.Descripcion);
                this.comando.Parameters.AddWithValue("@foto", pPlaca.foto);
                this.comando.Parameters.AddWithValue("@NombreFoto", pPlaca.nombreFoto);


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

        public Cls_Motos ConsultarMotos(string pPlaca)
        {
            try
            {
                Cls_Motos varMotos = null;

                this.conexion = new SqlConnection(this.stringConexion);

                this.comando = new SqlCommand();

                this.conexion.Open();
                this.comando.Connection = this.conexion;
                this.comando.CommandText = "[Sp_Cns_Motos]";
                this.comando.CommandType = System.Data.CommandType.StoredProcedure;
                this.comando.Parameters.AddWithValue("@placa", pPlaca);

                SqlDataReader lector = null;

                lector = this.comando.ExecuteReader();

                if (lector.Read())
                {
                    
                    varMotos = new Cls_Motos(lector.GetValue(0).ToString(),
                        decimal.Parse(lector.GetValue(1).ToString()),
                        lector.GetValue(2).ToString(),
                        lector.GetValue(3).ToString(),
                        lector.GetValue(4).ToString(),
                        (byte[])(lector.GetValue(5)),
                        lector.GetValue(6).ToString());

                    lector.Close();
                }
                else
                    throw new Exception("no existe ninguna moto con la placa # " + pPlaca);

                lector = null;
                conexion.Close();
                conexion.Dispose();

                //este metodo retorna la instancia del objeto
                return varMotos;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void EliminarMotos(string pPlaca)
        {
            try
            {
                this.conexion = new SqlConnection(this.stringConexion);
                this.conexion.Open();
                this.comando = new SqlCommand();
                this.comando.Connection = this.conexion;
                this.comando.CommandText = "[Sp_Del_Motos]";
                this.comando.CommandType = System.Data.CommandType.StoredProcedure;
                this.comando.Parameters.AddWithValue("@placa", pPlaca);

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

    }
}
