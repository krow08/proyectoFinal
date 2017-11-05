using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo
{
    public class Cls_Motos
    {
        #region Atributos de Clase
        private string strPlaca;
        private decimal dclPrecio;
        private string strTipo;
        private string strModelo;
        private string strDescripcion;
        private byte[] byteFoto;
        private string strNombreFoto;
        #endregion

        #region Propiedades de clase
        public string placa
        {
            set
            {
                this.strPlaca = value;
            }
            get
            {
                return this.strPlaca;
            }
        }

        public decimal precio
        {
            set
            {
                this.dclPrecio = value;
            }
            get
            {
                return this.dclPrecio;
            }
        }

        public string tipo
        {
            set
            {
                this.strTipo = value;
            }
            get
            {
                return this.strTipo;
            }
        }

        public string Modelo
        {
            set
            {
                this.strModelo = value;
            }
            get
            {
                return this.strModelo;
            }
        }

        public string Descripcion
        {
            set
            {
                this.strDescripcion = value;
            }
            get
            {
                return this.strDescripcion;
            }
        }

        public byte[] foto
        {
            set
            {
                this.byteFoto = value;
            }
            get
            {
                return this.byteFoto;
            }
        }

        public string nombreFoto
        {
            set
            {
                this.strNombreFoto = value;
            }
            get
            {
                return this.strNombreFoto;
            }
        }
        #endregion

        /// <summary>
        /// constructor con parametros
        /// </summary>
        /// <param name="pPlaca">placa del vehiculo</param>
        /// <param name="pPrecio">precio del vehiculo</param>
        /// <param name="pTipo">tipo de moto</param>
        /// <param name="pDescripcion">descripcion de la moto</param>
        /// <param name="pFoto">foto de la moto</param>
        /// <param name="pNombreFoto">nombre de la foto</param>
        public Cls_Motos(string pPlaca, decimal pPrecio, string pTipo, string pModelo, string pDescripcion, byte[] pFoto, string pNombreFoto)
        {
            //se llaman las variables y se les asigna el valor correspendiente segun su parametro
            this.strPlaca = pPlaca;
            this.precio = pPrecio;
            this.tipo = pTipo;
            this.Modelo = pModelo;
            this.Descripcion = pDescripcion;
            this.foto = pFoto;
            this.nombreFoto = pNombreFoto;
        }

        #region metodos de la clase
        //descuento segun el tipo de moto
        public decimal descuentoTipo()
        {
            decimal descuento=0;

            switch (tipo)
            {
                case "Scooter": descuento = precio * (decimal)0.1;
                    break;
                case "Montañera": descuento = precio * (decimal)0.15;
                    break;
                case "Cuadraciclos": descuento = precio * (decimal)0.2;
                    break;
                case "Pandillera": descuento = precio * (decimal)0.25;
                    break;
            }
            return descuento;
        }
        //se agrega el descuento al precio sin impuestos
        public decimal precioConDescuentoSinImpuestos()
        {
            decimal precioDescuento = 0;
            precioDescuento = precio - descuentoTipo();
            return precioDescuento;
        }
        //se agregan los impuestos al precio con el descuento
        public decimal impuestoAduanas()
        {
            decimal impuestoAduana = 0;

            impuestoAduana = precioConDescuentoSinImpuestos() * (decimal)0.15;
                    
            return impuestoAduana;
        }
        //se agrega el impuesto de ganancia
        public decimal impuestoGanancia()
        {
            decimal impuestoGanancia = 0;

            impuestoGanancia = (precioConDescuentoSinImpuestos() + impuestoAduanas()) * (decimal)0.15;

            return impuestoGanancia;
        }
        //se agrega el impuesto de ventas
        public decimal impuestoVentas()
        {
            decimal impuestoVentas = 0;

            impuestoVentas = (precioConDescuentoSinImpuestos() + impuestoGanancia()) * (decimal)0.13;

            return impuestoVentas;
        }
        //se calcula el precio total con todos los impuestos
        public decimal precioTotal()
        {
            decimal precioTotal=0;

            precioTotal = precioConDescuentoSinImpuestos() + impuestoAduanas() + impuestoGanancia() + impuestoVentas();

            return precioTotal;
        }
        #endregion
    }
}
