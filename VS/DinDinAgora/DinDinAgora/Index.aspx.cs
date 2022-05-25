using System;
using System.Data;
using System.Web.UI;

namespace DinDinAgora
{
    public partial class Index : Page
    {
        private Dados.Dados Dados;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Clientes.SelectedValue == "")
            {
                Dados = new Dados.Dados();

                DataTable dt = Dados.ListarClientesDataTable();
            
                Clientes.DataSource = dt;
                Clientes.DataValueField = "ID";
                Clientes.DataTextField = "NOME";
                Clientes.DataBind();

                if (!string.IsNullOrEmpty(Clientes.SelectedValue))
                    ListarProdutos(Convert.ToInt32(Clientes.SelectedValue));

                DataAtual.Text = DateTime.Today.ToString("dd/MM/yyyy");
            }
        }

        private void ListarProdutos(int cliente)
        {
            if (Dados == null)
                Dados = new Dados.Dados();

            DataTable dtProdutos = Dados.ListarProdutos(cliente);
            ProdutosContratados.DataSource = dtProdutos;
            ProdutosContratados.DataBind();

            DataTable dtRecomendacaoSimilaridade = Dados.ListarRecomendacoes(cliente, "S.SIMILARIDADE");
            ProdutosRecomendadosSimilaridade.DataSource = dtRecomendacaoSimilaridade;
            ProdutosRecomendadosSimilaridade.DataBind();

            DataTable dtRecomendacaoPontuacao = Dados.ListarRecomendacoes(cliente, "S.PONTUACAO");
            ProdutosRecomendadosPontuacao.DataSource = dtRecomendacaoPontuacao;
            ProdutosRecomendadosPontuacao.DataBind();
        }

        protected void Clientes_SelectedIndexChanged1(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Clientes.SelectedValue))
                ListarProdutos(Convert.ToInt32(Clientes.SelectedValue));
        }
    }
}