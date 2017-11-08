using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//libreria de SQL
using System.Data.SqlClient;

namespace Controlador
{
    public class Cls_tipos_ADO
    {
        private SqlConnection conexion;
        private SqlCommand comando;
        private string stringconexion;
        private SqlDataAdapter adaptador;

        public System.Data.DataSet TipoMotos()
        {
            try
            {
                this.conexion = new SqlConnection(this.stringconexion);
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

        public Cls_tipos_ADO(string pStringConexion)
        {
            this.stringconexion = pStringConexion;
        }
    }
}
