import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  String textDisplay = '0';

  int primeiroNumero = 0;
  String operacao = '';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora', style: TextStyle(fontSize: 30),),
      ),
      body: Column(
        children: [
          _buildDisplay(),
          Center(child: _buildKeyboard()),
        ],
      ),
    );
  }

  Widget _buildDisplay() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        border: Border.all(),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(30),
      alignment: Alignment.centerRight,
      child: Text(
        textDisplay,
        style: TextStyle(
          fontSize: 50,
        ),
      ),
    );
  }

  Widget _buildKeyboard() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildButton('7'),
            _buildButton('8'),
            _buildButton('9'),
            _buildButton('/'),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildButton('4'),
            _buildButton('5'),
            _buildButton('6'),
            _buildButton('*'),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildButton('1'),
            _buildButton('2'),
            _buildButton('3'),
            _buildButton('-'),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildButton('C'),
            _buildButton('0'),
            _buildButton('='),
            _buildButton('+'),
          ],
        ),
      ],
    );
  }

  Container _buildButton(String name) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 80,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          _clickBotao(name);
        },
        child: Text(name, style: TextStyle (fontSize: 40),),
      ),
    );
  }

  void _clickBotao(String name) {
    setState(() {
      switch (name) {
        case '/':
          operacao = '/';
          primeiroNumero = int.parse(textDisplay);
          textDisplay = '0';
          break;
        case '*':
          operacao = '*';
          primeiroNumero = int.parse(textDisplay);
          textDisplay = '0';
          break;
        case '-':
          operacao = '-';
          primeiroNumero = int.parse(textDisplay);
          textDisplay = '0';
          break;
        case '+':
          operacao = '+';
          primeiroNumero = int.parse(textDisplay);
          textDisplay = '0';
          break;
        case '=':
          _calcular(int.parse(textDisplay));
          break;
        case 'C':
          primeiroNumero = 0;
          textDisplay = '0';
          break;
        default:
          textDisplay = textDisplay + name;
      }
    });
  }

  void _calcular(int segundoNumero) {
    switch (operacao) {
      case '+':
        int resultado = primeiroNumero + segundoNumero;
        textDisplay = resultado.toString();
        primeiroNumero = resultado;
        break;
      case '-':
        int resultado = primeiroNumero - segundoNumero;
        textDisplay = resultado.toString();
        primeiroNumero = resultado;
        break;
      case '*':
        int resultado = primeiroNumero * segundoNumero;
        textDisplay = resultado.toString();
        primeiroNumero = resultado;
        break;
      case '/':
        double resultado = primeiroNumero / segundoNumero;
        textDisplay = resultado.toString();
        primeiroNumero = resultado.truncate();
        break;
    }
  }
}