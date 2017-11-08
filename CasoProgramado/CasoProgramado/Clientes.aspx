<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="CasoProgramado.Clientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- bootstrap y JQuery -->
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css" />
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>


    <!--  complementos del plugin-->
    <script src='https://maps.google.com/maps/api/js?sensor=false&libraries=places&key=AIzaSyBVT-EzZdI1nrBjosKz3Oc7T-VyXJObQvA' type="text/javascript"></script>
    <script src="Scripts/locationpicker.jquery.js"></script>



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
                    <asp:TextBox ID="txtCedula" class="form-control" runat="server" Width="200px"></asp:TextBox>
                </div>
            </div>

            <!-- Solicitud del Nombre-->
            <div class="form-group">
                <asp:Label ID="lblNombre" runat="server" class="control-label col-md-2" Text="Nombre"></asp:Label>
                <div class="col-md-10">
                    <asp:TextBox ID="txtNombre" class="form-control" runat="server" Width="200px"></asp:TextBox>
                </div>
            </div>

            <!-- solicitud del Telefono-->
            <div class="form-group">
                <asp:Label ID="lblTelefono" runat="server" class="control-label col-md-2" Text="Teléfono"></asp:Label>
                <div class="col-md-10">
                    <asp:TextBox ID="txtTelefono" class="form-control" runat="server" Width="200px"></asp:TextBox>
                </div>
            </div>

            <!-- Solicitud del tipo de pago-->
            <div class="form-group">
                <asp:Label ID="lblTipoPago" runat="server" class="control-label col-md-2" Text="Tipo Pago"></asp:Label>
                <div class="col-md-10">
                    <asp:DropDownList ID="CbxTipoPago" class="form-control" runat="server" Width="200px" OnSelectedIndexChanged="CbxTipoPago_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem>Efectivo</asp:ListItem>
                        <asp:ListItem>Cheque</asp:ListItem>
                        <asp:ListItem>Tarjeta</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="btnCheque" Visible="false" class="btn btn-success botones" runat="server" Text="Cheque" OnClick="brnRegistrar_Click" />
                </div>
            </div>

            <!-- Solicitud de la Ubicacion-->
            <div class="form-group">
                <asp:Label ID="lblUbicacion" runat="server" class="control-label col-md-2" Text="Ubicación"></asp:Label>
                <div class="col-md-10">
                    <button type="button" data-toggle="modal" data-target="#ModalMap" class="btn btn-default">
                        <span class="glyphicon glyphicon-map-marker "></span><span id="lblUbicacion2">Seleccionar Ubicación </span>
                    </button>

                    <style>
                        .pac-container {
                            z-index: 99999;
                        }
                    </style>
                    <div class="modal fade" id="ModalMap" tabindex="-1" role="dialog">
                        <div class="modal-dialog" role="document" style="margin-left: -19%">
                            <div class="modal-content">
                                <div class="modal-body">
                                    <div class="form-horizontal">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Ubicación:</label>
                                            <div class="col-sm-9">
                                                <asp:TextBox ID="txtModalMapaddress" Text="" CssClass="form-control" runat="server" />

                                            </div>
                                            <div class="col-sm-1">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                        </div>
                                        <div id="ModalMapPreview" style="width: 100%; height: 400px;"></div>
                                        <div class="clearfix">&nbsp; </div>
                                        <div class="m-t-small"></div>
                                        <label class="p-r-small col-sm-1 control-label">lat..:</label>
                                        <div class="col-sm-3">
                                            <asp:TextBox ID="ModalMapLat" Text="9.978350410396416" Class="form-control" runat="server"></asp:TextBox>

                                        </div>
                                        <label class="p-r-small col-sm-1 control-label">lon..:</label>
                                        <div class="col-sm-3">
                                            <asp:TextBox ID="ModalMapLon" Text="-84.72024570410156" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-sm-3">
                                            <button type="button" class="btn btn-primary btn-block" data-dismiss="modal">Aceptar</button>
                                        </div>
                                        <div class="clearfix"></div>
                                        <script>
                                            $('#ModalMapPreview').locationpicker({
                                                radius: 0,
                                                location: {
                                                    latitude: $('#<%=ModalMapLat.ClientID%>').val(),
                                                    longitude: $('#<%=ModalMapLon.ClientID%>').val()
                                                },
                                                enableAutocomplete: true,
                                                inputBinding: {
                                                    latitudeInput: $('#<%=ModalMapLat.ClientID%>'),
                                                    longitudeInput: $('#<%=ModalMapLon.ClientID%>'),
                                                    locationNameInput: $('#<%=txtModalMapaddress.ClientID%>')

                                                },
                                                onchanged: function (currentLocation, radius, isMarkerDropped) {
                                                    $('#lblUbicacion2').html($('#<%=txtModalMapaddress.ClientID%>').val());

                                                }


                                            });
                                            $('#ModalMap').on('shown.bs.modal', function () {
                                                $('#ModalMapPreview').locationpicker('autosize');
                                            });
                                        </script>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <!-- solicitud del Email-->
            <div class="form-group">
                <asp:Label ID="lblEmail" runat="server" class="control-label col-md-2" Text="Email"></asp:Label>
                <div class="col-md-10">
                    <asp:TextBox ID="txtemal" class="form-control" runat="server" Width="200px"></asp:TextBox>
                </div>
            </div>

            <!-- Solicitud de la Password-->
            <div class="form-group">
                <asp:Label ID="lblPassword" runat="server" class="control-label col-md-2" Text="Password"></asp:Label>
                <div class="col-md-10">
                    <asp:TextBox ID="txtpassword" class="form-control" TextMode="Password" runat="server" Width="200px"></asp:TextBox>
                </div>
            </div>

            <div style="margin-left: 90px">
                <asp:Button ID="brnRegistrar" class="btn btn-success botones" runat="server" Text="Registrar" OnClick="brnRegistrar_Click" />
                <asp:Button ID="btnModificar" class="btn btn-success botones" runat="server" Text="Modificar" OnClick="btnModificar_Click" />
                <asp:Button ID="btnEliminar" class="btn btn-success botones" runat="server" Text="Eliminar" OnClick="btnEliminar_Click" />
                <asp:Button ID="btnConsultar" class="btn btn-success botones" runat="server" Text="Consultar" />
            </div>
        </div>
    </div>

    <!-- Panel contenedor para datos del Cheque-->
    <asp:Panel ID="panelModal" Visible="false" runat="server" CssClass="modalPoput form-control panel-primary"
        BorderStyle="Ridge" Width="500px" Height="250px">
        <div class="panel-heading">Datos del Cheque</div>

        <!-- Solicitud de la Numero de Cheque-->
        <div class="form-group">
            <asp:Label ID="lblNumeroCheque" runat="server" class="control-label col-md-4" Text="Numero de Cheque" Style="margin-left: 30%;"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtNumeroCheque" Text="0" class="form-control" runat="server" Width="152px" Style="margin-left: 40%;"></asp:TextBox>
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

    <ajaxToolkit:ModalPopupExtender ID="modal" runat="server" BackgroundCssClass="modalBackground"
        PopupControlID="panelModal" TargetControlID="btnCheque" CancelControlID="btnCerrar">
    </ajaxToolkit:ModalPopupExtender>




    <%--  <!-- Panel contenedor para el map-->
    <asp:Panel ID="panelModal2" runat="server" CssClass="modalPoput form-control panel-primary"
        BorderStyle="Ridge" Width="500px" style="height:auto">
        <div class="form-horizontal">
            <div class="form-group">
                <!-- Panel contenedor para la ubicacion-->
                <asp:Label ID="lblUbicacionMapa" runat="server" class="col-sm-2 control-label" Text="Ubicación:"> </asp:Label>
                <div class="col-sm-9">
                    <asp:TextBox ID="ModalMapaddress" runat="server" class="form-control"></asp:TextBox>
                    <asp:Button ID="btnCerrarMapa" runat="server" class="btn btn-default" Text="X" Style="margin-left: 101%; margin-top: -16%"></asp:Button>
                </div>
            </div>
            <!-- Div para mostrar el mapa-->
            <div id="ModalMapPreview" style="width: 100%; height: 400px;"></div>
            <div class="clearfix">&nbsp;</div>
            <div class="m-t-small">
                <label class="p-r-small col-sm-1 control-label">lat..:</label>
                <div class="col-sm-3">
                    <asp:TextBox ID="ModalMapLat" class="form-control" runat="server"></asp:TextBox>
                </div>
                <label class="p-r-small col-sm-1 control-label">Long..:</label>
                <div class="col-sm-3">
                    <asp:TextBox ID="ModalMapLon" class="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-sm-3">
                    <button id="Aceptar" type="button" class="btn btn-primary btn-block" data-dismiss="modal">
                        Aceptar
                    </button>
                </div>
            </div>
            <div class="clearfix"></div>


            <script>
                $('#ModalMapPreview').locationpicker({
                    radius: 0,
                    location: {
                        latitude: 9.9906919,
                        longitude: -84.667374
                    },
                    enableAutocomplete: true,
                    inputBinding: {
                        latitudeInput: $('#<%=ModalMapLat.ClientID%>'),
                        longitudeInput: $('#<%=ModalMapLon.ClientID%>'),
                        locationNameInput: $('#<%=ModalMapaddress.ClientID%>')
                    },
                    onchanged: function (currentLocation, radius, isMarkerDropped) {
                        $('#brtUbicacion').html($('#<%=ModalMapaddress.ClientID%>').val());

                    }
                });
                $('#panelModal2').on('shown.bs.modal', function () {
                    $('#ModalMapPreview').locationpicker('autosize');
                });
            </script>

        </div>
    </asp:Panel>


    <ajaxToolkit:ModalPopupExtender ID="modal2" runat="server" BackgroundCssClass="modalBackground"
        PopupControlID="panelModal2" TargetControlID="brtUbicacion" CancelControlID="Aceptar">
    </ajaxToolkit:ModalPopupExtender>--%>
</asp:Content>
