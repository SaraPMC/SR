using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;

namespace DinDinAgora.Dados
{
    public class Dados
    {
        private MySqlConnection con;

        public Dados()
        {
            Conectar();
        }

        private void Conectar()
        {
            con = new MySqlConnection("server=localhost; user id=root; password=123456; database=dindinagora");
        }

        public List<Cliente> ListarClientes()
        {
            List<Cliente> clientes = new List<Cliente>();

            DataTable dt = ListarClientesDataTable();

            if (dt == null || dt.Rows.Count == 0)
                return clientes;

            foreach (DataRow dr in dt.Rows)
            {
                Cliente cliente = new Cliente
                {
                    Id = Convert.ToInt32(dr["id"]),
                    Nome = dr["nome"].ToString(),
                    TipoPessoa = dr["TIPO_PESSOA"].ToString(),
                    Documento = dr["DOCUMENTO"].ToString(),
                    DataNascimento = Convert.ToDateTime(dr["DATA_NASCIMENTO"]),
                    Telefone = dr["TELEFONE"].ToString(),
                    Celular = dr["CELULAR"].ToString(),
                    Email = dr["EMAIL"].ToString(),
                    Status = dr["STATUS"].ToString()
                };

                clientes.Add(cliente);
            }

            return clientes;
        }

        public DataTable ListarClientesDataTable()
        {
            string sql = @"SELECT C.ID, C.NOME, C.TIPO_PESSOA, C.DOCUMENTO, C.DATA_NASCIMENTO, C.TELEFONE, C.CELULAR, C.EMAIL, C.STATUS 
                           FROM DINDINAGORA.CLIENTE C";

            MySqlCommand cmd = new MySqlCommand(sql, con);
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }

        public List<SimilaridadeCliente> ListarSimilaridadePorCliente(int cliente)
        {
            List<SimilaridadeCliente> similaridades = new List<SimilaridadeCliente>();

            DataTable dt = ListarSimilaridade(cliente);

            if (dt == null || dt.Rows.Count == 0)
                return similaridades;

            foreach (DataRow dr in dt.Rows)
            {
                SimilaridadeCliente similaridade = new SimilaridadeCliente
                {
                    Id = Convert.ToInt32(dr["ID"]),
                    ClienteOrigem = Convert.ToInt32(dr["ID_CLIENTE_ORIGEM"]),
                    NomeClienteOrigem = dr["NOME_CLIENTE_ORIGEM"].ToString(),
                    ClienteDestino = Convert.ToInt32(dr["ID_CLIENTE_DESTINO"]),
                    NomeClienteDestino = dr["NOME_CLIENTE_DESTINO"].ToString(),
                    Similaridade = Convert.ToInt32(dr["SIMILARIDADE"])
                };

                similaridades.Add(similaridade);
            }

            return similaridades;
        }

        public DataTable ListarSimilaridade(int cliente)
        {
            string sql = @"SELECT S.ID, S.ID_CLIENTE_ORIGEM, S.ID_CLIENTE_DESTINO, S.SIMILARIDADE, 
                                  CO.NOME NOME_CLIENTE_ORIGEM, CD.NOME NOME_CLIENTE_DESTINO
                           FROM DINDINAGORA.SIMILARIDADE S
                             INNER JOIN DINDINAGORA.CLIENTE CO ON CO.ID = S.ID_CLIENTE_ORIGEM
                             INNER JOIN DINDINAGORA.CLIENTE CD ON CD.ID = S.ID_CLIENTE_DESTINO
                           WHERE S.ID_CLIENTE_ORIGEM = " + cliente.ToString();

            MySqlCommand cmd = new MySqlCommand(sql, con);
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }

        public List<Produto> ListarRecomendacoesPorCliente(int cliente)
        {
            List<Produto> produtos = new List<Produto>();

            DataTable dt = ListarRecomendacoes(cliente,"S.SIMILARIDADE");

            if (dt == null || dt.Rows.Count == 0)
                return produtos;

            foreach (DataRow dr in dt.Rows)
            {
                Produto produto = new Produto
                {
                    //Id = Convert.ToInt32(dr["ID"]),
                    Tipo = dr["TIPO"].ToString(),
                    Descricao = dr["DESCRICAO"].ToString(),
                    Valor = Convert.ToInt32(dr["VALOR"]),
                    Status = dr["STATUS"].ToString()
                };

                produtos.Add(produto);
            }

            return produtos;
        }

        public DataTable ListarRecomendacoes(int cliente, string tipo)
        {
            string sql = @"SELECT CD.NOME, P.TIPO, P.DESCRICAO, P.STATUS, " + tipo + @"
                           FROM DINDINAGORA.SIMILARIDADE S
                                INNER JOIN DINDINAGORA.TRANSACAO T ON T.ID_CLIENTE = S.ID_CLIENTE_DESTINO
                                INNER JOIN DINDINAGORA.PRODUTO P ON P.ID = T.ID_PRODUTO
                                INNER JOIN DINDINAGORA.CLIENTE CD ON CD.ID = S.ID_CLIENTE_DESTINO
                            WHERE S.ID_CLIENTE_ORIGEM = " + cliente.ToString() + @"
                              AND " + tipo + @" > 0
                              AND NOT EXISTS(SELECT * FROM DINDINAGORA.TRANSACAO T2 WHERE T2.ID_CLIENTE = S.ID_CLIENTE_ORIGEM AND T2.ID_PRODUTO = T.ID_PRODUTO)
                            ORDER BY " + tipo + @" DESC
                            LIMIT 6";

            MySqlCommand cmd = new MySqlCommand(sql, con);
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }

        public DataTable ListarProdutos(int cliente)
        {
            string sql = @"SELECT P.TIPO, P.DESCRICAO, P.VALOR, P.STATUS
                           FROM DINDINAGORA.TRANSACAO T
                             INNER JOIN DINDINAGORA.PRODUTO P ON P.ID = T.ID_PRODUTO
                           WHERE T.ID_CLIENTE = " + cliente.ToString();

            MySqlCommand cmd = new MySqlCommand(sql, con);
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }

    }
}
