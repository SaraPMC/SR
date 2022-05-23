using System;

namespace DinDinAgora.Dados
{
    public class Cliente
    {
        public int Id { get; set; }
        public string Nome { get; set; }
        public string TipoPessoa { get; set; }
        public string Documento { get; set; }
        public DateTime? DataNascimento { get; set; }
        public string Telefone { get; set; }
        public string Celular { get; set; }
        public string Email { get; set; }
        public string Status { get; set; }
    }
}