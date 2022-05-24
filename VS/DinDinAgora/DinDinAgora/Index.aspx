<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="DinDinAgora.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="ListarClientes" runat="server" Text="Listar Clientes" OnClick="ListarClientes_Click" />
        </div>
        <p>
            &nbsp;</p>
        <p>
        <asp:Button ID="ListarSimilaridades" runat="server" Text="Listar Similaridades" OnClick="ListarSimilaridades_Click" />
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Button ID="ListarRecomendacoes" runat="server" Text="Listar Recomendações" OnClick="ListarRecomendacoes_Click" />
        </p>
    </form>
</body>
</html>
