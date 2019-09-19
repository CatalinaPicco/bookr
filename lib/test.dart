import 'package:flutter/material.dart';
import 'HtttpRequest.dart';

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
                height: 52,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Text(
                        book.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        book.autor,
                        style: TextStyle(color: Colors.white),
                      )
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

class BookShower extends StatelessWidget {
  final BookWidget bookWidget;

  BookShower(this.bookWidget);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child:  Scaffold(
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
                    child: Image.network(bookWidget.book.imgUrl),
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),
                Text("hkhaj,shfk,hkergkerhgkehkrehkejhgjerhkjerlghelheh jjhjhkhkhfsfdsfsfsfsdfsfdsfdsfsfdsfds kjfdhdkshg wa rywukerguf  djqweduwefrilor ,f eiwyfheil yf h grieg  qwiuuiyqweqrfñg"),
                SizedBox(
                  height: 24.0,
                ),
                RaisedButton(
                  disabledColor: Colors.orange,
                  color: Colors.orange,
                  child: Text("Leer"),
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
