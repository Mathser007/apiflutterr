import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _editingController=TextEditingController();
  List<Actors>Aclist=[
    Actors(name: 'Mammootty', age:'70'),
    Actors(name: 'Mohanlal', age:'61'),
    Actors(name: 'Prithviraj', age:'40')
  ];
  final duplicateitems=<Actors>[];
  var items=<Actors>[];
  @override
  void initState() {
    items = duplicateitems;
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.lightGreen,title: Text('Search'),),
      body:Column(
        children: [
          Container(
            height: 60,
            child: TextField(
              controller: _editingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Search',
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
              child:ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  Actors A=Aclist[index];
                  return ListTile(
                    leading: Icon(Icons.star),
                    title: Text('${A.name}'),
                    subtitle: Text('${A.age}'),
                  );
                },) )
        ],
      ) ,
    );
  }
}
class Actors{
  late String name;
  late String age;
  Actors({required this.name,required this.age});
}