using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
using Controlador;
using System.Configuration;

namespace CasoProgramado
{
    public partial class Clientes : System.Web.UI.Page
    {
        private Cls_Clientes varCliente;
        private Cls_Clientes_ADO varclienteADO;
        private string stringConexion;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void brnRegistrar_Click(object sender, EventArgs e)
        {
            try
            {
                this.stringConexion = ConfigurationManager.ConnectionStrings["stringConexion"].ConnectionString;
                //se crea una instancia del cliente con los datos ingresados en el front-END
                this.varCliente = new Cls_Clientes(int.Parse(this.txtCedula.Text), this.txtNombre.Text,int.Parse(this.txtTelefono.Text), this.TxtUbicacion.Text, this.CbxPago.Text);

                //utilizar controlador

                this.varclienteADO = new Cls_Clientes_ADO(this.stringConexion);

                //Se utiliza el controlador para almacenar los datos del objeto medelo +
                //en la base datos(DB_Motos)
                this.varclienteADO.Registrar(this.varCliente);


                //se muestra los datos de la instancia cliente
                Response.Write("<script language='javaScript'> alert('Datos del clientes:" + this.varCliente.Cedula + " " +
                    this.varCliente.Nombre + "'); </script>");
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                this.stringConexion = ConfigurationManager.ConnectionStrings["stringConexion"].ConnectionString;
                //se crea una instancia del cliente con los datos ingresados en el front-END
                this.varCliente = new Cls_Clientes(int.Parse(this.txtCedula.Text), this.txtNombre.Text, int.Parse(this.txtTelefono.Text), this.TxtUbicacion.Text, this.CbxPago.Text);

                //utilizar controlador

                this.varclienteADO = new Cls_Clientes_ADO(this.stringConexion);

                //Se utiliza el controlador para almacenar los datos del objeto medelo +
                //en la base datos(DB_Motos)
                this.varclienteADO.modificarCliente(this.varCliente);


                //se muestra los datos de la instancia cliente
                Response.Write("<script language='javaScript'> alert('El cliente ha sido modificado perfectamente'); </script>");
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {

                //se instancia el controlador del cliente
                this.varclienteADO = new Cls_Clientes_ADO(ConfigurationManager.ConnectionStrings["stringConexion"].ConnectionString);

                //Se utiliza el metodo borrarCliente, se pasa el parametro del controlador ASP.net
                this.varclienteADO.BorrarCliente(this.txtCedula.Text);


                Response.Write("<script languaje='javascript'> alert('Cliente borrado correctamente'); </script>");

                this.LimpiarUI();
            }
            catch (Exception ex)
            {
                //ex.message nos permite obtener los datos del error en caso que exista durante la transaccion
                Response.Write("<script languaje='javascript'> alert('" + ex.Message + "'); </script>");
            }
        }
        private void LimpiarUI()
        {
            this.txtCedula.Text = "";
            this.txtNombre.Text = "";
            this.txtTelefono.Text = "";
            this.TxtUbicacion.Text = "";
            this.CbxPago.Text = "";

        }

        protected void btnConsultar_Click(object sender, EventArgs e)
        {
            try
            {
                //se instancia el controlador ADO Cliente
                //Se utiliza el objeto configuracion manager para leer el string de conexion
                //almacena el el web.config
                this.varclienteADO = new Cls_Clientes_ADO(
                    ConfigurationManager.ConnectionStrings["stringconexion"].ConnectionString);

                //se utiliza el metodo consultar cliente, que recibe la Cedula
                //Los datos consultados se almacena en la variable varCliente
                this.varCliente = this.varclienteADO.consultarCliente(this.txtCedula.Text.ToString());

                //se asigna los datos al Front-end
                //recuerde que la variable varcliente es una clase del modelo
                this.txtNombre.Text = this.varCliente.Nombre;
                this.txtTelefono.Text = ""+this.varCliente.Telefono;
                this.TxtUbicacion.Text = this.varCliente.Ubicacion;
                this.CbxPago.Text = this.varCliente.Pago;
            }
            catch (Exception ex)
            {

            }
        }
    }
}