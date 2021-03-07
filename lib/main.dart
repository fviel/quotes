import 'package:flutter/material.dart';
import 'entities/frase.dart';
import 'widgets/card_frase.dart';

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
  //Array de frases, poderia ter puxado do BD...
  List<Frase> frases = [
    Frase(
        frase:
            'Regra número 1: nunca perca dinheiro. \nRegra número 2: nunca se esqueça da regra número 1.',
        autor: 'Warren Buffett'),
    Frase(
        frase: 'Jamais gaste seu dinheiro antes de você possuí-lo.',
        autor: 'Thomas Jefferson'),
    Frase(frase: 'Feito é melhor que perfeito.', autor: 'Allan Peron'),
    Frase(
        frase: 'O dinheiro é um mestre terrível, mas um excelente servo.',
        autor: 'P. T. Barnum'),
    Frase(
        frase: 'O risco vem de você não saber o que está fazendo.',
        autor: 'Warren Buffett'),
    Frase(
        frase:
            'Seja paciente e ignore modismos. \nFoque no valor e não entre em pânico.',
        autor: 'Eddy Elfenbein')
  ];

  removerFrase(Frase frase) {
    frases.remove(frase);
  }

  adicionarFraseAleatoria() {
    Frase frase = new Frase(frase: "Teste123", autor: "Autor Teste");
    frases.add(frase);
  }

  /**
   * Retorna um widget decorado para o meu appbar!
   */
  Widget obtemAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.question_answer,
          color: Colors.grey[100],
          size: 20.0,
        ),
        SizedBox(width: 2),
        Text(
          'Aplicativo de frases do Fernando',
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.grey[100],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: obtemAppBar(),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        //
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        //este código abaixo faz muita coisa...

        children: frases
            .map((frase) => new CardFrase(
                frase: frase,
                delete: () {
                  setState(() {
                    //comando para remover frase do vetor
                    //frases.remove(frase);
                    removerFrase(frase);
                  });
                }))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: IconButton(
          onPressed: () {
            setState(() {
              //comando para remover frase do vetor
              //frases.remove(frase);
              adicionarFraseAleatoria();
            });
          },
          icon: Icon(Icons.add),
          color: Colors.amberAccent,
        ),
      ),
    );
  }
}
