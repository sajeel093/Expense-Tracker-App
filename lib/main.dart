import 'package:flutter/material.dart';
import 'package:flutter_application_1/transaction.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', titile: 'New shoe', amount: 69.33, date: DateTime.now()),
    Transaction(
        id: 't2', titile: 'Old shoe', amount: 80.33, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('TrackerApp'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              width: double.infinity,
              child: Card(
                  child: Text('CHART'), elevation: 5, color: Colors.amber)),
          Column(
            children: transactions.map((tx) {
              return Card(
                  color: Color.fromARGB(255, 182, 218, 241),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.purple, width: 2)),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: Text(
                          '\$ ${tx.amount}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.purple),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tx.titile,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.blue),
                          ),
                          Text(
                            DateFormat().format(tx.date),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Color.fromARGB(255, 99, 97, 97)),
                          ),
                        ],
                      )
                    ],
                  ));
            }).toList(),
          )
        ],
      ),
    ));
  }
}
