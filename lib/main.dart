import 'package:flutter/material.dart';
import 'package:githubuser/manage/request.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final pagecontroller= PageController();
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text('GitHub User'),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
        
        Expanded(child: PageView.builder(itemBuilder: (context,index)=> Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Page ${index+1}',style:TextStyle(fontWeight: FontWeight.bold, fontSize: 21)),
            ),
            Expanded(
              child: Page(indexpage: index,),
            ),
          ],
        )))

      ],),


      
    );
  }
}



class Page extends StatefulWidget {
  final int indexpage;

  const Page({Key key, this.indexpage}) : super(key: key);



  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<GiHubUser>>(
      future: GitHubUser.getUser(widget.indexpage+1),
      builder: (contex,snp)   {
        if(snp.connectionState== ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(strokeWidth: 2,),);

        }else{
          return ListView.builder(
        itemCount:snp.data==null? 0:10,
        itemBuilder: (context,index){
       var user = snp.data[index];
      

  
         return ListTile(title: Text(user.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
      subtitle: Text(user.owner),);
      
    });
        }
        });}
  }
