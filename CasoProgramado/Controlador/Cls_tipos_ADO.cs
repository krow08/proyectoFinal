using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//libreria de SQL
using System.Data.SqlClient;
using System.Data;
using Modelo;

namespace Controlador
{
    public class Cls_tipos_ADO
    {
        private SqlConnection conexion;
        private SqlCommand comando;
        private string stringConexion;
        private SqlDataAdapter adaptador;

        public System.Data.DataSet TipoMotos()
        {
            try
            {
                this.conexion = new SqlConnection(this.stringConexion);
                this.conexion.Open();
                this.comando = new SqlCommand();
                this.comando.Connection = this.conexion;
                this.comando.CommandText = "select * from [Catalogo_Motos]";
                this.comando.CommandType = System.Data.CommandType.Text;

                System.Data.DataSet datos = new System.Data.DataSet();
                this.adaptador = new SqlDataAdapter();
                this.adaptador.SelectCommand = this.comando;
                this.adaptador.Fill(datos);

                this.conexion.Close();
                this.conexion.Dispose();
                this.comando.Dispose();
                this.adaptador.Dispose();

                return datos;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }



        public string consultarPrecio(string id)
        {
            try
            {

                this.conexion = new SqlConnection(this.stringConexion);

                this.comando = new SqlCommand();

                this.conexion.Open();
                this.comando.Connection = this.conexion;
                this.comando.CommandText = "[Sp_Cns_TipoMoto]";
                this.comando.CommandType = System.Data.CommandType.StoredProcedure;
                this.comando.Parameters.AddWithValue("@Id", id);

                SqlDataReader lector = this.comando.ExecuteReader();
                Cls_Categorias varTipoMoto = null;

                if (lector.Read())
                {

                    varTipoMoto = new Cls_Categorias();
                    varTipoMoto.id = int.Parse(lector.GetValue(0).ToString()); 


                    
                }
                else
                    throw new Exception("no existe ninguna moto con la placa # " + id);

                lector.Close();
                conexion.Close();
                conexion.Dispose();
                comando.Dispose();
                lector = null;

                //este metodo retorna la instancia del objeto
                return "" + varTipoMoto;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public Cls_tipos_ADO(string pStringConexion)
        {
            this.stringConexion = pStringConexion;
        }
    }
}
