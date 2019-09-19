import 'package:flutter/material.dart';

class Register extends StatefulWidget {

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.red[400],
      appBar: AppBar(
        title: Text("Registro"),
        centerTitle: true,
        backgroundColor: Colors.orange[300],
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
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
                        hintText: "Repita su password",
                        labelText: "Repita la clave *"),
                  )),
              SizedBox(height: 24.0),
              new SizedBox(
                width: double.infinity,
                child: new RaisedButton(
                  disabledColor: Colors.orange,
                  color: Colors.orange,
                  child: Text("Registrarme"),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
