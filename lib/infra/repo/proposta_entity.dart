class ServicoRepo {
  List<Map<String, dynamic>> prestador_servico_repo = [
    {
      "id": "1",
      "idPrestador": "prestador1",
      "idServico": "123",
      "dataInicio": "2022-06-01T14:30:00.000Z",
      "valor": 150.0,
      "consideracoes": "A proposta inclui a compra de materiais.",
      "flgAvisoCliente": true,
      "flgAvisoPrestador": true
    },
    {
      "id": "2",
      "idPrestador": "prestador2",
      "idServico": "1234",
      "dataInicio": "2022-06-05T10:00:00.000Z",
      "valor": 200.0,
      "consideracoes": "",
      "flgAvisoCliente": false,
      "flgAvisoPrestador": true
    },
    {
      "id": "3",
      "idPrestador": "3",
      "idServico": "1",
      "dataInicio": "2022-06-08T13:45:00.000Z",
      "valor": 100.0,
      "consideracoes": "",
      "flgAvisoCliente": true,
      "flgAvisoPrestador": false
    },
    {
      "id": "4",
      "idPrestador": "2",
      "idServico": "3",
      "dataInicio": "2022-06-12T08:00:00.000Z",
      "valor": 50.0,
      "consideracoes": "Serviço de limpeza básico.",
      "flgAvisoCliente": false,
      "flgAvisoPrestador": false
    },
/*
  {
  "id": "5",
  "idPrestador": "3",
  "idServico": "2",
  "dataInicio": "2022-06-15T17:30:00.000Z",
  "valor": 300.0,
  "consideracoes": "Disponível apenas nos finais de semana.",
  "flgAvisoCliente": true,
  "flgAvisoPrestador": true
  },*/
  ];
}