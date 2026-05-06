import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const CalculadoraIMCApp());
}

class CalculadoraIMCApp extends StatelessWidget {
  const CalculadoraIMCApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IMC',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const ImcPage(),
    );
  }
}

class ImcPage extends StatefulWidget {
  const ImcPage({super.key});

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  final _formKey = GlobalKey<FormState>();

  final _pesoController = TextEditingController();
  final _alturaController = TextEditingController();

  String _genero = "Male";
  String _resultado = "Preencha os dados";
  String _classificacao = "";
  Color _corResultado = Colors.black54;

  void _calcularIMC() {
    if (!_formKey.currentState!.validate()) return;

    double peso =
    double.parse(_pesoController.text.replaceAll(',', '.'));
    double altura =
    double.parse(_alturaController.text.replaceAll(',', '.'));

    if (altura > 3) {
      altura = altura / 100;
    }

    double imc = peso / pow(altura, 2);

    String classificacao;
    Color cor;

    if (imc < 18.5) {
      classificacao = "Abaixo do peso";
      cor = Colors.orange;
    } else if (imc < 24.9) {
      classificacao = "Peso normal";
      cor = Colors.green;
    } else if (imc < 29.9) {
      classificacao = "Sobrepeso";
      cor = Colors.orange;
    } else {
      classificacao = "Obesidade";
      cor = Colors.red;
    }

    setState(() {
      _resultado = imc.toStringAsFixed(2); // 🔥 agora 2 casas decimais
      _classificacao = classificacao;
      _corResultado = cor;
    });
  }

  void _limpar() {
    _pesoController.clear();
    _alturaController.clear();

    setState(() {
      _resultado = "Preencha os dados";
      _classificacao = "";
      _corResultado = Colors.black54;
      _genero = "Male";
    });
  }

  Widget _generoCard(String label, IconData icon) {
    bool ativo = _genero == label;

    return GestureDetector(
      onTap: () {
        setState(() {
          _genero = label;
        });
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor:
            ativo ? Colors.teal.shade100 : Colors.grey.shade200,
            child: Icon(icon,
                size: 40,
                color: ativo ? Colors.teal : Colors.grey),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: ativo ? Colors.teal : Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _inputBox({
    required String label,
    required TextEditingController controller,
    required String tipo,
  }) {
    return Expanded(
      child: Column(
        children: [
          Text(label),
          const SizedBox(height: 10),
          TextFormField(
            controller: controller,
            keyboardType:
            const TextInputType.numberWithOptions(decimal: true),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Informe o $tipo';
              }

              final v =
              double.tryParse(value.replaceAll(',', '.'));

              if (v == null) return 'Número inválido';
              if (v <= 0) return '$tipo deve ser maior que zero';

              if (tipo == "altura" && v > 300) {
                return 'Altura muito alta (máx 300 cm)';
              }

              if (tipo == "peso" && v > 500) {
                return 'Peso muito alto (máx 500 kg)';
              }

              return null;
            },
            onChanged: (_) {
              setState(() {
                _resultado = "Preencha os dados";
                _classificacao = "";
              });
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pesoController.dispose();
    _alturaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Calculadora IMC"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceEvenly,
                children: [
                  _generoCard("Homem", Icons.man),
                  _generoCard("Mulher", Icons.woman),
                ],
              ),

              const SizedBox(height: 30),

              Row(
                children: [
                  _inputBox(
                      label: "Peso (kg)",
                      controller: _pesoController,
                      tipo: "peso"),
                  const SizedBox(width: 10),
                  _inputBox(
                      label: "Altura (m ou cm)",
                      controller: _alturaController,
                      tipo: "altura"),
                ],
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _calcularIMC,
                  child: const Text("Calcular IMC"),
                ),
              ),

              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _limpar,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                  child: const Text("Limpar"),
                ),
              ),

              const SizedBox(height: 30),

              Text("Seu IMC",
                  style: TextStyle(color: Colors.grey[700])),

              const SizedBox(height: 10),

              Text(
                _resultado,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: _corResultado,
                ),
              ),

              if (_classificacao.isNotEmpty)
                Text(
                  _classificacao,
                  style: TextStyle(
                    fontSize: 18,
                    color: _corResultado,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
