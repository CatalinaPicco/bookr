import 'package:bookr_app/test.dart';
import 'package:bookr_app/ui/pages/register.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bookr',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Bookr'),
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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.red[400],
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
            child: Form(
              child: Column(
                // Column is also layout widget. It takes a list of children and
                // arranges them vertically. By default, it sizes itself to fit its
                // children horizontally, and tries to be as tall as its parent.
                //
                // Invoke "debug painting" (press "p" in the console, choose the
                // "Toggle Debug Paint" action from the Flutter Inspector in Android
                // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
                // to see the wireframe for each widget.
                //
                // Column has various properties to control how it sizes itself and
                // how it positions its children. Here we use mainAxisAlignment to
                // center the children vertically; the main axis here is the vertical
                // axis because Columns are vertical (the cross axis would be
                // horizontal).
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 24.0,
                  ),
                  new Theme(
                      data: new ThemeData(
                          primaryColor: Colors.white,
                          primaryColorDark: Colors.grey[100]),
                      child: TextFormField(
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                            hintText: "Ingrese su nombre",
                            labelText: "Nombre *"),
                      )),
                  SizedBox(
                    height: 24.0,
                  ),
                  new Theme(
                      data: new ThemeData(
                          primaryColor: Colors.white,
                          primaryColorDark: Colors.grey[100]),
                      child: TextFormField(
                        textCapitalization: TextCapitalization.words,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                            hintText: "Ingrese su password",
                            labelText: "Clave *"),
                      )),
                  SizedBox(
                    height: 24.0,
                  ),
                  new SizedBox(
                    width: double.infinity,
                    child: new RaisedButton(
                      disabledColor: Colors.orange,
                      color: Colors.orange,
                      child: Text("Ingresar"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage1()),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  FlatButton(
                    child: Text(
                      "¿Aun no tenés cuenta? Registrate aquí",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
