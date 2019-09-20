import 'package:http/http.dart' as http;
import 'dart:convert';
class Book{
  final String title;
  final String autor;
  final String imgUrl;

  Book({this.title, this.autor, this.imgUrl});

  factory Book.fromJson(Map<String, dynamic> json){
    return new Book(
      autor: json["autor"],
      imgUrl: json["img"],
      title: json["title"]
    );
  }
}


Future<List<Book>> getData() async{
  final response = await http.get("https://api.myjson.com/bins/10u8y5");
  //if(response.statusCode == 200){
    var jsonArray = json.decode(response.body) as List;
    return jsonArray.map(decode).toList();
  /*}else{
    return new List();
  }*/
}

Book decode(dynamic element){
  return Book.fromJson(element);
}
