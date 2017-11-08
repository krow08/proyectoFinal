<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Frm_Moto.aspx.cs" Inherits="CasoProgramado.Frm_Moto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div class="jumbotron text-center">
        <h3>Formulario para ingreso de motos
        </h3>
    </div>

    <%--panel contenedor de los ocntroles para subir la foto--%>
    <div class="form-horizontal" style="margin-top: 20px">

        <div class="form-group">

            <%--Datos imagen--%>
            <div class="col-md-6">

                <div class="form-group">
                    <asp:Label ID="lblPlaca" runat="server" class="control-label col-md-2" Text="Numero de Placa:"></asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox ID="txtPlaca" class="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblPrecio" class="control-label col-md-2" runat="server" Text="Precio:"></asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox ID="txtPrecio" class="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblTipo" runat="server" class="control-label col-md-2" Text="Tipo de Moto:"></asp:Label>
                    <div class="col-md-10">
                        <asp:DropDownList ID="cbxTipo" class="form-control" runat="server"></asp:DropDownList>
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblModelo" runat="server" class="control-label col-md-2" Text="Modelo del Vehiculo:"></asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox ID="txtModelo" class="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblDescripcion" runat="server" class="control-label col-md-2" Text="Descripcion:"></asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox ID="txtDescripcion" class="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>


            </div>

            <%-----imagen.----%>
            <div class="col-md-c6">
                <asp:ImageButton ID="Scooter1" ImageUrl="~/imagenes/Scooter1.jpg" runat="server" Width="240px" Height="195px" />
                <div class="form-group">
                    <asp:Button ID="btnRegistrar" class="btn btn-primary botones" runat="server" Text="Registrar" OnClick="btnRegistrar_Click" />
                    <asp:Button ID="btnConsultar" class="btn btn-primary botones" runat="server" Text="Consultar" OnClick="btnConsultar_Click" />
                    <asp:Button ID="btnModificar" class="btn btn-primary botones" runat="server" Text="Modificar" OnClick="btnModificar_Click" />
                    <asp:Button ID="btnEliminar" class="btn btn-primary botones" runat="server" Text="Eliminar" OnClick="btnEliminar_Click" />
                </div>

            </div>

        </div>
    </div>

    <%--panel contenedor de los ocntroles para subir la foto--%>
    <asp:Panel ID="panelModal" runat="server" CssClass="modalPopup form-control panel-primary"
        BorderStyle="Ridge" Width="500px" Height="250px">
        <div class="panel-heading">Foto de moto</div>

        <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:Button ID="btnSubir" runat="server" Text="Subir Foto" class="btn btn-primary" OnClick="btnSubir_Click" />
        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" cancelarControlID="" class="btn btn-primary" />
    </asp:Panel>

    <ajaxToolkit:ModalPopupExtender ID="Modal" runat="server" BackgroundCssClass="modalBackground"
        PopupControlID="panelModal" TargetControlID="Scooter1">
    </ajaxToolkit:ModalPopupExtender>


</asp:Content>
