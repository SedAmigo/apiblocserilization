import 'package:serelization/model/post.dart';
import 'dart:convert';
import 'netvoer.dart';

const String postApiUrl = 'https://jsonplaceholder.typicode.com/posts';

class PostApi{
  Future<List<Post>> getPost() async{
    Network network = Network(url: postApiUrl);
    var postData = await network.getData();
    List data = json.decode(postData);
    return data.map((e) => Post.fromJson(e)).toList();
  }
}