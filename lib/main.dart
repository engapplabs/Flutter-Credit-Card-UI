import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var creditCardNumber = new TextEditingController();
  var creditCardName = new TextEditingController();
  var agencyNumber = new TextEditingController();
  var accountNumber = new TextEditingController();

  StreamController<String> creditCardNumberStream =
      new StreamController<String>();
  StreamController<String> creditCardNameStream =
      new StreamController<String>();
  StreamController<String> agencyNumberStream = new StreamController<String>();
  StreamController<String> accountNumberStream = new StreamController<String>();

  @override
  void dispose() {
    super.dispose();
    creditCardNumberStream.close();
    creditCardNameStream.close();
    agencyNumberStream.close();
    accountNumberStream.close();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: new Container(
        child: new ListView(
          children: <Widget>[
            new Stack(
              children: <Widget>[
                new Center(
                  child: new Image.asset(
                    'images/cc.png',
                    fit: BoxFit.contain,
                    width: double.infinity,
                  ),
                ),
                new Positioned(
                    bottom: 100.0,
                    left: 50.0,
                    child: new StreamBuilder(
                      initialData: "",
                      stream: creditCardNumberStream.stream,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        return new Text(
                          "${snapshot.data}",
                          style: new TextStyle(color: Colors.white),
                        );
                      },
                    )),
                new Positioned(
                    bottom: 70.0,
                    left: 50.0,
                    child: new StreamBuilder(
                      initialData: "",
                      stream: creditCardNameStream.stream,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        return new Text(
                          "${snapshot.data}",
                          style: new TextStyle(color: Colors.white),
                        );
                      },
                    )),
                new Positioned(
                    bottom: 50.0,
                    left: 50.0,
                    child: new StreamBuilder(
                      initialData: "",
                      stream: agencyNumberStream.stream,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        return new Text(
                          "${snapshot.data}",
                          style: new TextStyle(color: Colors.white),
                        );
                      },
                    )),
                new Positioned(
                    bottom: 50.0,
                    left: 120.0,
                    child: new StreamBuilder(
                      initialData: "",
                      stream: accountNumberStream.stream,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        return new Text(
                          "${snapshot.data}",
                          style: new TextStyle(color: Colors.white),
                        );
                      },
                    )),
              ],
            ),
            new TextField(
              keyboardType: TextInputType.number,
              onChanged: (String value) {
                creditCardNumberStream.sink.add(value);
              },
              controller: creditCardNumber,
              decoration: new InputDecoration(labelText: 'Número do cartão'),
            ),
            new TextField(
              onChanged: (String value) {
                creditCardNameStream.sink.add(value);
              },
              controller: creditCardName,
              decoration: new InputDecoration(labelText: 'Nome do titular'),
            ),
            new TextField(
              onChanged: (String value) {
                agencyNumberStream.sink.add(value);
              },
              controller: agencyNumber,
              decoration: new InputDecoration(labelText: 'Agência'),
            ),
            new TextField(
              onChanged: (String value) {
                accountNumberStream.sink.add(value);
              },
              controller: accountNumber,
              decoration: new InputDecoration(labelText: 'Conta'),
            ),
          ],
        ),
      ),
    );
  }
}
