import 'dart:convert';

import 'package:http/http.dart' as http;

Future sendEmailNewServiceAvailable() async {
  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
    },
    body: json.encode(
      {
        'service_id': 'service_0f45due',
        'template_id': 'template_wb64gnr',
        'user_id': 'Q5JC2yTxqSWdEqYkr',
        'template_params': {
          'username': 'Gabriel',
          'user_email': 'gabrielbrsc14@gmail.com',
          'user_message':
              'Teste de email Teste de email Teste de email Teste de email Teste de email Teste de email Teste de email ',
          'user_subject':
              'Teste de email Teste de email Teste de email Teste de email Teste de email Teste de email Teste de email Teste de email ',
        },
      },
    ),
  );
  print(response.body);
}
