using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//importar la libreria controlador 
using Controlador;
//importar libreria del modelo
using Modelo;
//importar libreria de configuracion
using System.Configuration;
//permiten leer y escribir en los archivos y secuencias de datos
using System.IO;


namespace CasoProgramado
{
    public partial class Frm_Moto : System.Web.UI.Page
    {
        //variable de tipo clase
        private Cls_Motos varMotos;

        //variable controlador para el cliente
        private Cls_Motos_ADO varMotoADO;

        //variable para almacenar el string de conexion del web.config
        private string stringConexion;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    Cls_tipos_ADO controladorTipos = new Cls_tipos_ADO(ConfigurationManager.ConnectionStrings["stringConexion"].ConnectionString);
                    this.cbxTipo.DataSource = null;

                    this.cbxTipo.DataSource = controladorTipos.TipoMotos();
                    this.cbxTipo.DataTextField = "tipo";
                    this.cbxTipo.DataValueField = "id";
                    this.cbxTipo.DataBind();

                    if (this.cbxTipo.Items.Count > 0)
                    {
                        this.cbxTipo.SelectedIndex = 0;
                    }
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            try
            {
                //path de la foto
                string urlImagen = this.Scooter1.ImageUrl;
                urlImagen = urlImagen.Replace("~", "");
                urlImagen = urlImagen.Replace("/", "\\");
                urlImagen = urlImagen.Substring(1, urlImagen.Length - 1);
                string path = Request.PhysicalApplicationPath + urlImagen;
                //se crea una instancia de la moto con los datos ingresados en el front-end
                this.varMotos = new Cls_Motos(this.txtPlaca.Text, decimal.Parse(this.txtPrecio.Text), this.cbxTipo.SelectedValue,
                    this.txtModelo.Text, this.txtDescripcion.Text, File.ReadAllBytes(path), this.Session["nombreFoto"].ToString());


                Cls_Motos_ADO controladorMoto = new Cls_Motos_ADO(ConfigurationManager.ConnectionStrings["stringConexion"].ConnectionString);
                controladorMoto.RegistrarMotos(varMotos);

                this.txtPlaca.Text = "";
                this.txtPrecio.Text = "";
                this.cbxTipo.SelectedIndex = 0;
                this.txtModelo.Text = "";
                this.txtDescripcion.Text = "";
                this.Scooter1.ImageUrl = "~/Imagenes/Scooter1.jpg";

                Response.Write("<script language='JavaScript'>" + "alert('Moto Registrada Correctamente');</script>");

                //se borra la foto despues de registrar
                File.Delete(path);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnConsultar_Click(object sender, EventArgs e)
        {
            try
            {
                Cls_Motos_ADO controladorMotos = new Cls_Motos_ADO(ConfigurationManager.ConnectionStrings["stringConexion"].ConnectionString);
                Cls_Motos varMoto = null;
                varMoto = controladorMotos.ConsultarMotos(this.txtPlaca.Text.Trim());
                this.txtPrecio.Text = varMoto.precio.ToString();
                this.cbxTipo.SelectedValue = varMoto.tipo.ToString();
                this.txtModelo.Text = varMoto.Modelo.ToString();
                this.txtDescripcion.Text = varMoto.Descripcion.ToString();

                string path = Request.PhysicalApplicationPath + "Imagenes\\" + varMoto.nombreFoto;
                using (FileStream foto = new FileStream(path, FileMode.Create, FileAccess.Write))
                {
                    foto.Flush();
                    foto.Close();
                }
                File.WriteAllBytes(path, varMoto.foto);
                this.Scooter1.ImageUrl = "~/Imagenes/" + varMoto.nombreFoto;

                
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                Cls_Motos_ADO controladorMotos = new Cls_Motos_ADO(ConfigurationManager.ConnectionStrings["stringConexion"].ConnectionString);
                
                //path de la foto
                string urlImagen = this.Scooter1.ImageUrl;
                urlImagen = urlImagen.Replace("~", "");
                urlImagen = urlImagen.Replace("/", "\\");
                urlImagen = urlImagen.Substring(1, urlImagen.Length - 1);
                string path = Request.PhysicalApplicationPath + urlImagen;

                //se crea una instancia del cliente con los datos ingresados en el front-end
                this.varMotos = new Cls_Motos(this.txtPlaca.Text, decimal.Parse(this.txtPrecio.Text), this.cbxTipo.SelectedValue,
                    this.txtModelo.Text, this.txtDescripcion.Text, File.ReadAllBytes(path), this.Session["nombreFoto"].ToString());

                //utilizar el controlador
                //ADO = access data object
                Cls_Motos_ADO controladorMoto = new Cls_Motos_ADO(ConfigurationManager.ConnectionStrings["stringConexion"].ConnectionString);

                //se utiliza el controlador para almacenar los datos del objeto modelo
                //en la base de datos (Db_Motos)
                controladorMoto.ModificarMotos(this.varMotos);

                //se muestra los datos de la instancia del cliente
                Response.Write("<script language='javaScript'> alert('Datos del vehiculo" + this.varMotos.placa + " " +
                    this.varMotos.Descripcion + " " + this.varMotos.precio + "'); </script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script language='JavaScript'> alert('" + ex.Message + "');</script>");
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                //if(this.txtID.Text.Trim().Equals("")) Esta es otra forma de hacerlo.
                if (this.txtPlaca.Text.Trim().Equals("") || this.txtPlaca.Text.Trim().Equals(""))
                {
                    throw new Exception("No se puede eliminar el cliente, consulte sus datos");
                }

                //Se innicia el controlador del cliente.
                this.varMotoADO = new Cls_Motos_ADO
                    (ConfigurationManager.ConnectionStrings["stringConexion"].ConnectionString);

                //Se utiliza el metodo borrarCLiente se pasa al parametro del control ASP.NET
                this.varMotoADO.EliminarMotos(this.txtPlaca.Text);
                Response.Write("<script language='JavaScript'> alert('Moto borrada con exito!');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script language='JavaScript'> alert('" + ex.Message + "');</script>");
            }
        }

        protected void btnSubir_Click(object sender, EventArgs e)
        {
            try
            {
                //se pregunta si el control tiene un archivo o una foto
                if (this.FileUpload1.HasFile)
                {
                    //Crear path del servidor
                    //EL Request tiene toda la informacion de la aplicacion Web
                    string path = Request.PhysicalApplicationPath + "Imagenes\\" + this.FileUpload1.FileName;

                    //Se pregunta  si el control tiene una foto existe
                    if (!File.Exists(path))
                    {
                        File.Delete(path);
                    }

                    //se sube la foto
                    this.FileUpload1.SaveAs(path);

                    this.Scooter1.ImageUrl = "~/Imagenes/" + this.FileUpload1.FileName;

                    //Se guarda en una variable de session el nombre de la foto
                    Session["NombreFoto"] = this.FileUpload1.FileName;
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}