using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class Cls_Clientes
    {
        #region Atributo de clase
        //atributos de clase
        private int intCedula;
        private string strNombre;
        private int intTelefono;
        private string strUbicacion;
        private string strPago;
        private int intNumeroCheque;
        private string strNombreBanco;
        private string strEmail;
        private string strPassword;
        #endregion

        #region Propiedades de Clase
        public int Cedula
        {
            set
            {
                if (value == 0)
                {
                    throw new Exception("No se permite la cedula en blanco");
                }
                else
                {
                    this.intCedula = value;
                }
            }
            get
            {
                return this.intCedula;
            }
        }
        public string Nombre
        {
            set
            {
                if (value.Trim().Equals(""))
                {
                    throw new Exception("No se permite el nombre en blanco");
                }
                else
                {
                    this.strNombre = value;
                }
            }
            get
            {
                return this.strNombre;
            }
        }
        public int Telefono
        {
            set
            {
                if (value == 0)
                {
                    throw new Exception("No se permite el telefono en blanco");
                }
                else
                {
                    this.intTelefono = value;
                }
            }
            get
            {
                return this.intTelefono;
            }
        }
        public string Ubicacion
        {
            set
            {
                if (value.Trim().Equals(""))
                {
                    throw new Exception("No se permite la ubicacion en blanco");
                }
                else
                {
                    this.strUbicacion = value;
                }
            }
            get
            {
                return this.strUbicacion;
            }
        }
        public string Pago
        {
            set
            {
                if (value.Trim().Equals(""))
                {
                    throw new Exception("No se permite el pago en blanco");
                }
                else
                {
                    this.strPago = value;

                }
            }
            get
            {
                return this.strPago;
            }
        }
        public int NumeroCheque
        {
            set
            {
                    this.intNumeroCheque = value;
            }
            get
            {
                return this.intNumeroCheque;
            }
        }
        public string NombreBanco
        {
            set
            {
                this.strNombreBanco = value;
            }
            get
            {
                return this.strNombreBanco;
            }
        }
        public string Email
        {
            set
            { 
                this.strEmail = value;
            }
            get
            {
                return this.strEmail;
            }
        }
        public string Password
        {
            set
            {
                this.strPassword = value;
            }
            get
            {
                return this.strPassword;
            }
        }
        #endregion

        public Cls_Clientes(int pCedula, string pNomb, int  pTelefono, string pUbicacion, string pPago, int pNumeroCheque, string pNombreBanco, string pEmail, string pPassword)
        {
            //Se llaman las propiedad  y se asigna el valor correspondiente segun si paramentro
            this.Cedula = pCedula;
            this.Nombre = pNomb;
            this.Telefono = pTelefono;
            this.Ubicacion = pUbicacion;
            this.Pago = pPago;
            this.NumeroCheque = pNumeroCheque;
            this.NombreBanco = pNombreBanco;
            this.Email = pEmail;
            this.Password = pPassword;
        }
    }
}
