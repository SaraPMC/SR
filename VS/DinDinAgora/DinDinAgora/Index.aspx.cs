using System;
using System.Web.UI;

namespace DinDinAgora
{
    public partial class Index : Page
    {
        private Dados.Dados Dados;
        protected void Page_Load(object sender, EventArgs e)
        {
            Dados = new Dados.Dados();
        }

        protected void ListarClientes_Click(object sender, EventArgs e)
        {
            _ = Dados.ListarClientes();
        }

        protected void ListarSimilaridades_Click(object sender, EventArgs e)
        {
            _ = Dados.ListarSimilaridadePorCliente(1);
        }
    }
}