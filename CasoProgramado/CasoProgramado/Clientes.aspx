<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="CasoProgramado.Clientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron text-center">
        <h3>Formulario para ingreso de cliente</h3>
    </div>

    <%--Controles de Form--%>
    <div class="panel" id="panel" ">
        <div id="Cedula">
            <asp:Label ID="lblCedula" runat="server" Text="Cedula"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtCedula" CssClass="cajaTexto" runat="server" Width="152px"></asp:TextBox>
        </div>

        <div id="Nombre">
            <asp:Label ID="lblNombre" runat="server" Text="Nombre"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtNombre" CssClass="cajaTexto" runat="server" Width="149px"></asp:TextBox>
        </div>

        <div id="Telefono">
            <asp:Label ID="lblTelefono" runat="server" Text="Teléfono"></asp:Label>
            &nbsp;
            <asp:TextBox ID="txtTelefono" CssClass="cajaTexto" runat="server" Width="140px"></asp:TextBox>
        </div>

        <div id="Ubicacion">
            <asp:Label ID="lblUbicacion" runat="server" Text="Ubicación"></asp:Label>
            &nbsp;
            <asp:TextBox ID="TxtUbicacion" CssClass="cajaTexto" runat="server" Width="141px"></asp:TextBox>
        </div>

        <div id="Pago">
            <asp:Label ID="lblPago" runat="server" Text="Pago"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="CbxPago" runat="server" CssClass="cajaTexto" Width="141px">
                <asp:ListItem>Cheque</asp:ListItem>
                <asp:ListItem>Tarjeta</asp:ListItem>
                <asp:ListItem>Efectio</asp:ListItem>
            </asp:DropDownList>

        </div>

        <div id="PanelBotones">
            <asp:Button ID="brnRegistrar" class="btn btn-success botones" runat="server" Text="Registrar" OnClick="brnRegistrar_Click" />
            <asp:Button ID="btnModificar" class="btn btn-success botones" runat="server" Text="Modificar" OnClick="btnModificar_Click" />
            <asp:Button ID="btnEliminar" class="btn btn-success botones" runat="server" Text="Eliminar" OnClick="btnEliminar_Click" />
            <asp:Button ID="btnConsultar" class="btn btn-success botones" runat="server" Text="Consultar" OnClick="btnConsultar_Click" />
        </div>
    </div>
</asp:Content>
