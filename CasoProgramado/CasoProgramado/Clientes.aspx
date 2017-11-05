<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="CasoProgramado.Clientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron text-center">
        <h3>Formulario para ingreso de cliente</h3>
    </div>

    <%--Controles de Form--%>

    <div class="form-horizontal" style="margin-top: 20px">
        <div class="form-group">

            <!--  datos de la cedula -->
            <div class="form-group">
                <asp:Label ID="lblCedula" runat="server" class="control-label col-md-2" Text="Cedula"></asp:Label>
                <div class="col-md-10">
                    <asp:TextBox ID="txtCedula" class="form-control" runat="server" Width="152px"></asp:TextBox>
                </div>
            </div>

            <!-- Solicitud del Nombre-->
            <div class="form-group">
                <asp:Label ID="lblNombre" runat="server" class="control-label col-md-2" Text="Nombre"></asp:Label>
                <div class="col-md-10">
                    <asp:TextBox ID="txtNombre" class="form-control" runat="server" Width="152px"></asp:TextBox>
                </div>
            </div>

            <!-- solicitud del Telefono-->
            <div class="form-group">
                <asp:Label ID="lblTelefono" runat="server" class="control-label col-md-2" Text="Teléfono"></asp:Label>
                <div class="col-md-10">
                    <asp:TextBox ID="txtTelefono" class="form-control" runat="server" Width="152px"></asp:TextBox>
                </div>
            </div>

            <!-- Solicitud de la Ubicacion-->
            <div class="form-group">
                <asp:Label ID="lblUbicacion" runat="server" class="control-label col-md-2" Text="Ubicación"></asp:Label>
                <div class="col-md-10">
                    <asp:TextBox ID="TxtUbicacion" class="form-control" runat="server" Width="152px"></asp:TextBox>
                </div>
            </div>


            <!-- Solicitud del tipo de pago-->
            <div class="form-group">
                <asp:Label ID="lblTipoPago" runat="server" class="control-label col-md-2" Text="Tipo Pago"></asp:Label>
                <div class="col-md-10">
                    <asp:DropDownList ID="CbxTipoPago" class="form-control" runat="server">
                        <asp:ListItem>Efectivo</asp:ListItem>
                        <asp:ListItem>Cheque</asp:ListItem>
                        <asp:ListItem>Tarjeta</asp:ListItem>
                    </asp:DropDownList>

                </div>
            </div>

            <!-- solicitud del Email-->
            <div class="form-group">
                <asp:Label ID="lblEmail" runat="server" class="control-label col-md-2" Text="Email"></asp:Label>
                <div class="col-md-10">
                    <asp:TextBox ID="txtEmail" class="form-control" runat="server" Width="152px"></asp:TextBox>
                </div>
            </div>

            <!-- Solicitud de la Password-->
            <div class="form-group">
                <asp:Label ID="lblPassword" runat="server" class="control-label col-md-2" Text="Password"></asp:Label>
                <div class="col-md-10">
                    <asp:TextBox ID="txtPassword" class="form-control" TextMode="Password" runat="server" Width="152px"></asp:TextBox>
                </div>
            </div>

            <div style="margin-left: 90px">
                <asp:Button ID="brnRegistrar" class="btn btn-success botones" runat="server" Text="Registrar" OnClick="brnRegistrar_Click" />
                <asp:Button ID="btnModificar" class="btn btn-success botones" runat="server" Text="Modificar" OnClick="btnModificar_Click" />
                <asp:Button ID="btnEliminar" class="btn btn-success botones" runat="server" Text="Eliminar" OnClick="btnEliminar_Click" />
                <asp:Button ID="btnConsultar" class="btn btn-success botones" runat="server" Text="Consultar" OnClick="btnConsultar_Click" />
            </div>
        </div>
    </div>

    <!-- Panel contenedor para datos del Cheque-->
    <asp:Panel ID="panelModal" runat="server" CssClass="modalPoput form-control panel-primary"
        BorderStyle="Ridge" Width="500px" Height="250px">
        <div class="panel-heading">Datos del Cheque</div>

        <!-- Solicitud de la Numero de Cheque-->
        <div class="form-group">
            <asp:Label ID="lblNumeroCheque" runat="server" class="control-label col-md-4" Text="Numero de Cheque" Style="margin-left: 30%;"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtNumeroCheque" class="form-control" runat="server" Width="152px" Style="margin-left: 40%;"></asp:TextBox>
            </div>
        </div>
        <!-- Solicitud del Nombre del banco-->
        <div class="form-group">
            <asp:Label ID="lblNombreBanco" runat="server" class="control-label col-md-4" Text="Nombre del Banco" Style="margin-left: 30%;"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtNombreBanco" class="form-control" runat="server" Width="152px" Style="margin-left: 40%;"></asp:TextBox>
            </div>
        </div>
        <div style="margin-left: 85%; margin-top: 30%">
            <asp:Button ID="btnCerrar" runat="server" Text="Cerrar" class="btn btn-primary" />
        </div>


    </asp:Panel>

    <ajaxtoolkit:modalpopupextender id="modal" runat="server" backgroundcssclass="modalBackgroud"
        popupcontrolid="panelModal" targetcontrolid="CbxTipoPago" cancelcontrolid="btnCerrar">
    </ajaxtoolkit:modalpopupextender>
</asp:Content>
