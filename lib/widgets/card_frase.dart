import 'package:flutter/material.dart';
import '../entities/frase.dart';


///Widget extraido de dentro de um stateful widget,
class CardFrase extends StatelessWidget {

  // frase precisa ser final, pois este objeto é stateless, e após criado, não pode ser alterado
  final Frase frase;
  final Function delete;
  CardFrase({this.frase, this.delete});


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: <Widget>[
            Row(

              children: <Widget>[
                Icon(
                  Icons.announcement,
                  color: Colors.red[300],
                  size: 14.0,
                ),
                SizedBox(width: 2),
                Text(
                  frase.frase,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            SizedBox(height: 6),
            Text(
              frase.autor,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 8.0,
                color: Colors.grey[800],
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 8.0),
            FlatButton.icon(
                onPressed: delete,
                label: Text('Delete'),
                icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}