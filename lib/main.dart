import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: QuoteList(),
  ));
}

//jmeu stateful widget
class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

//Minha classe State
class _QuoteListState extends State<QuoteList> {
  List<String> frases = [
    'Podia ser melhor...',
    'Eu queria poder comprar meu novo notebook',
    'Quero terminar o bootcamp do Inter',
    'Quero fazer meus apps em Flutter',
    'Ainda espero fazer meu app de perguntas e respostas',
    'Ainda espero fazer o Responder Questões!'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Frases2'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        //
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: frases
            .map(
              (frase) => Text(
                frase,
                style: TextStyle(
                  //backgroundColor: Colors.blue,
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  color: Colors.grey[600],
                  fontFamily: 'Roboto',
                ),
              )
            ).toList(),

        //Este método publicou meu array como uma lista de widgets, cada widget recebeu uma posição do meu array, e há duas formas de fazer isso:
        //Forma A - children: frases.map((frase)=>Text(frase)).toList();

        //Forma B - children: frases.map((quote) {
        //   return Text(quote);
        // }).toList(),
      ),
    );
  }
}
