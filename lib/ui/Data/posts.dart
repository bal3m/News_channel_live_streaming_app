import 'package:http/http.dart' as http;
import 'dart:convert';

List api =new List();
List cat =new List();
List idCat=new List();
List find =new List();

Future <List> fetchFromApi() async{
  final response=await http.get('http://almustaqbal.ly/wp-json/wp/v2/posts?categories=56',headers:{"Accept":"application/json"});
  api = json.decode(response.body);
  return api;
}
Future <List> fetchbyID (int id) async{
  final res =await http.get('http://w.almustaqbal.ly/wp-json/wp/v2/posts?include[]=$id');
  var conv=json.decode(res.body);
  return conv;
}
Future <List> fetchCategory() async {
  final res= await http.get('https://w.almustaqbal.ly/wp-json/wp/v2/categories');
  cat= json.decode(res.body);
  return cat;
}
Future<List> fetchByCat(int id) async {
final res =await http.get('https://w.almustaqbal.ly/wp-json/wp/v2/posts?categories=$id&per_page=25');
  idCat=json.decode(res.body);
  return idCat;
}
Future<List> search(s) async{
    http.Response res =await http.get('https://w.almustaqbal.ly/wp-json/wp/v2/posts?search=$s');
    find =json.decode(res.body);
    return find;
  }
Future<List> pinned ()async{
  http.Response res =await http.get('https://w.almustaqbal.ly/wp-json/wp/v2/posts?categories=18');
  find =json.decode(res.body);
  return find;
}
fetchImage(int imageId) async {
  final res =await http.get('https://almustaqbal.ly/wp-json/wp/v2/media/$imageId');
  var imId=json.decode(res.body);
  return imId;
}