


import 'dart:convert';

import 'package:http/http.dart' as http;

class GitHubUser{



  static Future<List<GiHubUser>> getUser(int page) async{
    var url = 'https://api.github.com/search/repositories?q=flutter+language:dart&page=$page&per_page=10';
var response = await http.get(url );

var rawdata = json.decode(response.body);
     List data = rawdata['items'];
List<GiHubUser> users= data.map((data)=> GiHubUser.repo(data)).toList();
print(users);
return users;
  }
  
}



class GiHubUser{
final String name;
final String owner;

  GiHubUser({this.name, this.owner});

  GiHubUser.repo(Map map):
  name = map["name"],
  owner= map["full_name"];


}