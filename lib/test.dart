import 'dart:async';
import 'dart:io';

import 'package:bookr_app/pdf_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'HtttpRequest.dart';
import 'package:auto_size_text/auto_size_text.dart';


/*class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biblioteca',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new HomePage1(),
    );
  }
}*/

class HomePage1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomeState1();
}

class HomeState1 extends State<HomePage1> {
  List<Book> _list;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.orange[300],
          title: Text("Bookr"),
          centerTitle: true,
        ),
        body: _getBody());
  }

  Widget _getBody() {
    if (_list == null) {
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.orange,
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.orange[100]),
        ),
      );
    } else if (_list.length == 0) {
      return Center(
        child: Text("No hay datos"),
      );
    } else {
      return GridView.builder(
          itemCount: _list.length,
          gridDelegate:
              new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            final book = _list[index];
            return new BookWidget(book);
          });
    }
  }

  @override
  void initState() {
    super.initState();
    doRequest();
  }

  void doRequest() {
    getData().then((result) {
      setState(() {
        _list = result;
      });
    }).catchError((error) {
      print(error);
    });
  }
}

class BookWidget extends StatelessWidget {
  final Book book;

  BookWidget(this.book);

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.all(3),
      child: GestureDetector(
        onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder:
                    (BuildContext context) => new BookShower(this)));
        },
        child: Stack(
          children: <Widget>[
            Center(
              child: Image.network(book.imgUrl),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.black.withOpacity(0.5),
                height: 56,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      AutoSizeText(
                          book.title,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      AutoSizeText(
                          book.autor,
                          style: TextStyle(color: Colors.white),
                        maxLines: 1,
                        ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BookShower extends StatefulWidget {
  final BookWidget bookWidget;

  BookShower(this.bookWidget);

  @override
  State<StatefulWidget> createState() => _BookShowerState();
}

  class _BookShowerState extends State<BookShower> {
  String pathPDF = "";

  @override
  void initState() {
  super.initState();
  fromAsset('assets/principito.pdf').then((f) {
  setState(() {
  pathPDF = f.path;
  print(pathPDF);
  });
  });
  // createFileOfPdfUrl().then((f) {
  //   setState(() {
  //     pathPDF = f.path;
  //     print(pathPDF);
  //   });
  // });
  }

  Future<File> fromAsset(String asset) async {
    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
    Completer<File> completer = Completer();

    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/large.pdf");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange[300],
          title: Text("Detalle"),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 240.0,
                  child: Center(
                    child: Image.network(this.widget.bookWidget.book.imgUrl),
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),
                Text(
                    "El principito es una narración corta del escritor francés Antoine de Saint-Exupéry, que cuenta la historia de un pequeño príncipe que parte de su asteroide a una travesía por el universo, en la cual descubre la extraña forma en que los adultos ven la vida y comprende el valor del amor y la amistad."),
                SizedBox(
                  height: 24.0,
                ),
                RaisedButton(
                  disabledColor: Colors.orange,
                  color: Colors.orange,
                  child: Text("Leer"),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder:
                            (BuildContext context) => new PdfViewScreen(path: pathPDF)));
                  },
                ),
                SizedBox(
                  height: 24.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


