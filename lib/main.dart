import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Home(),
    )
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController tempCelciusController = TextEditingController();
  
  String _mensagem = '';

  void limpa(){
    setState(() {
      tempCelciusController.text = '';
      _mensagem = '';
    });
  }

  void calculaK(){
    setState(() {
      double resultado = double.parse(tempCelciusController.text);
      resultado = resultado + 273;
      _mensagem = 'Kelvin: $resultado°';
    });
  }

  void calculaF(){
    setState(() {
      double resultado = double.parse(tempCelciusController.text);
      resultado = resultado * 1.8 + 32;
      _mensagem = 'Fahrenheit: $resultado°';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversor de Temperatura'),
        centerTitle: true,
        backgroundColor: Colors.pink,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: limpa,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top:20.0),
            child:
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Temperatura (Celsius)',
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0),
              controller: tempCelciusController,
            )
          ),
          Padding(
            padding: EdgeInsets.only(top:20.0, bottom:20.0, left: 60.0),
            child:Row(
              children: <Widget>[
                Container(
                  height: 50.0,
                  child:
                  Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: 
                      RaisedButton( 
                        child: Text('Kelvin', style: TextStyle(color: Colors.black, fontSize: 30.0)),
                        color: Colors.red,
                        onPressed: calculaK,
                      )
                  )
                ),
                Container(
                  height: 50.0,
                  child:
                RaisedButton( 
                  child: Text('Fahrenheit', style: TextStyle(color: Colors.black, fontSize: 30.0)),
                  color: Colors.red,
                  onPressed: calculaF,
                )
                )
              ],
              )
          ),
          Text(
            _mensagem,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 25.0),
          )
        ]
        ),
      backgroundColor: Colors.white,

    );
  }
}