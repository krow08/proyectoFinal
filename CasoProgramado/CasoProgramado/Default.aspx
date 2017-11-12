<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CasoProgramado._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="jumbotron" style="background-color: white">
                    <table class="table table-responsive">
                        <tbody>
                            <tr>
                                <td>
                                    <h1>Lista de Productos</h1>
                                    <asp:Label ID="lblAgregado" runat="server" Text="Label"></asp:Label>
                                </td>
                                <td>
                                    <asp:ImageButton ID="ImageButton1" Width="120" Height="120" runat="server" ImageUrl="~/Imagenes/carro-de-compras.jpg"  />
                                </td>
                            </tr>
                            <tr>
                                <td>

                                    <asp:DataList ID="DataList1" runat="server" DataKeyField="placa" DataSourceID="SqlDataSource1" RepeatColumns="4" OnItemCommand="DataList1_ItemCommand">
                                        <ItemTemplate>
                                            <asp:Image ID="NombreFotoLabel" Width="140" Height="120" runat="server" ImageUrl='<%# "~/Imagenes/"+Eval("nombreFoto") %>' />
                                            <br />
                                            <br />
                                                               
                                            Placa :
                                    <asp:Label ID="lblPlaca" runat="server" Text='<%# Eval("placa") %>' />
                                            <br />
                                            Modelo :
                                    <asp:Label ID="lblModelo" runat="server" Text='<%# Eval("Modelo") %>' />
                                            <br />
                                            Tipo :
                                    <asp:Label ID="lblTipo" runat="server" Text='<%# Eval("tipo") %>' />
                                            <br />
                                            Precio :
                                    <asp:Label ID="lblPrecio" runat="server" Text='<%# Eval("precio") %>' />
                                            <br />
                                            Cantidad :
                                    <asp:Label ID="lblDescripcion" runat="server" Text='<%# Eval("descripcion") %>' />
                                            <br />
                                            <asp:Button ID="btnAgregarCarrito" class="btn btn-default form-control" runat="server" CommandName="Seleccionar" Text="Agregar al Carrito" />
                                            <br />
                                        </ItemTemplate>
                                    </asp:DataList>

                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:Db_CasoProgramadoConnectionString %>' SelectCommand="SELECT p.Placa, p.Modelo, t.tipo, p.Precio, p.Descripcion, p.NombreFoto FROM tipoMotos AS t INNER JOIN Tbl_Motos AS p ON p.Tipo = t.id"></asp:SqlDataSource>

                                </td>

                            </tr>


                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
