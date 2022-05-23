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

        public List<string> ListarRecomendacoes(int cliente1, int cliente2)
        {
            return new List<string>();
        }

        public List<string> ListarRecomendacoesPorCliente(int cliente)
        {
            return new List<string>();
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

    }
}
