namespace DinDinAgora.Dados
{
    public class SimilaridadeCliente
    {
        public int Id { get; set; }
        public int ClienteOrigem { get; set; }
        public string NomeClienteOrigem { get; set; }
        public int ClienteDestino { get; set; }
        public string NomeClienteDestino { get; set; }
        public int Similaridade { get; set; }
    }
}