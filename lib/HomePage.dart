import 'dart:convert';

import 'package:ura/user.dart';
import 'package:ura/HomePageDetail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
Widget navDrawer(context) => Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      DrawerHeader(
        decoration: const BoxDecoration(
          color:Colors.blue,
        ),
        child: Container(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50.0))
                ),
                child: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/330px-Google-flutter-logo.png'),
              ),
              const Text('Навигация во Flutter'),
            ],
          ),
        ),
      ),
      ListTile(
        leading: const Icon(Icons.one_k),
        title: const Text('Авторизация'),
        onTap: (){
          Navigator.pushNamed(context, '/');
        },
      ),
      const Divider(
        thickness: 1,
      ),
      ListTile(
        leading: const Icon(Icons.two_k),
        title: const Text('Список пользователей'),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        },
      ),
      const Divider(
        color: Colors.black26,
        thickness: 2,
      ),
    ],
  ),
);
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Membuat List Dari data Internet
  List<User> listModel = [];
  var loading = false;

  Future<Null> getData() async{
    setState(() {
      loading = true;
    });

    final responseData = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if(responseData.statusCode == 200){
      final data = jsonDecode(responseData.body);
      print(data);
      setState(() {
        for(Map<String,dynamic> i in data){
          listModel.add(User.fromJson(i));
        }
        loading = false;
      });
    }
  }

  //Panggil Data / Call Data
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text('Home Page List User'),
        centerTitle: true,
      ),
      drawer: navDrawer(context),

      body: Container(
        child: loading ? Center (child: CircularProgressIndicator()) : ListView.builder(
            itemCount: listModel.length,
            itemBuilder: (context, i){
              final nDataList = listModel[i];
              return Container(
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageDetail(
                      did: nDataList.id,
                      dName: nDataList.name,
                      dEmail: nDataList.email,
                      dPhone: nDataList.phone,
                      dCity: nDataList.address.city,
                      dZip: nDataList.address.zipcode,
                    )));
                  },
                  child: Card(
                    color: Colors.amber[100],
                    margin: EdgeInsets.all(15),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(nDataList.id.toString()),
                          Text(nDataList.name, style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.green),
                          ),
                          Text(nDataList.email),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
        ),
      ),

    );
  }
}