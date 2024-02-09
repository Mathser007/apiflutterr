import 'dart:convert';

import 'package:apiflutterr/Jsonnnn/Products.dart';
import 'package:apiflutterr/Jsonnnn/RespMain.dart';
import 'package:apiflutterr/searchhhh.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'draggable.dart';
import 'getsure.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent.shade400),
        useMaterial3: true,
      ),
      home:
      Search()
        // (title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 Future<List<Products>?>fetchdata() async {
   var response=await http.get(Uri.parse('https://dummyjson.com/products'));
   var Json=jsonDecode(response.body);
   var resp=RespMain.fromJson(Json);
   var list=resp.products;
   return list;
}

  @override
  Widget build(BuildContext context) {
// fetchdata();
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: FutureBuilder(future: fetchdata(), builder: (BuildContext context, AsyncSnapshot<List<Products>?>
      snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              Products p=snapshot.data![index];
              return ListTile(
                leading: CircleAvatar(backgroundImage: NetworkImage('${p.thumbnail}'),),
                title: Text('${p.title}'),
                subtitle: Text('${p.price}'),
              );
            },);
        } else{
          return Center(child: Text('No data'),);
        }
      }, ),
    );
  }
}
