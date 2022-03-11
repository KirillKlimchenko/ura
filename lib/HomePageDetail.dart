import 'package:flutter/material.dart';
import 'package:ura/HomePage.dart';
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
class HomePageDetail extends StatefulWidget {
  String dName, dEmail, dPhone, dCity, dZip;

  int did;
  HomePageDetail({required this.did,required this.dName, required this.dEmail, required this.dPhone, required this.dCity, required this.dZip});

  @override
  _HomePageDetailState createState() => _HomePageDetailState();
}

class _HomePageDetailState extends State<HomePageDetail> {
  //void _Case (){
   // final ident = widget.did;
   // Text('ddd $ident');
   // Navigator.push(context, MaterialPageRoute(builder: (context) => CasePage()));
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail User'),
        backgroundColor: Colors.blue,
      ),
      drawer: navDrawer(context),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        'With One Class',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Identify : ${widget.did}",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "${widget.dName}",
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Email : ${widget.dEmail}",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Phone : ${widget.dPhone}",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "City : ${widget.dCity}",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Zip Postal : ${widget.dZip}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: ElevatedButton(
              onPressed: (){},//_Case
              child: Text('Задачи'),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            child: Column(
              children: <Widget>[
                new NameDetail(
                  name: widget.dName,
                  email: widget.dEmail,
                ),
                new BagianIcon(),
                new BagianContact(
                  phone: widget.dPhone,
                  city: widget.dCity,
                  postal: widget.dZip,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class NameDetail extends StatelessWidget {
  final String name, email;
  NameDetail({required this.name, required this.email});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: 24),
                ),
                Text(
                  "Email : $email",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.star,
                size: 40,
                color: Colors.orange,
              ),
              Text(
                "12",
                style: TextStyle(fontSize: 12),
              )
            ],
          )
        ],
      ),
    );
  }
}

class BagianIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          IconText(iconData: Icons.camera, text: "Camera",),

          IconText(iconData: Icons.phone, text: "Phone",),

          IconText(iconData: Icons.message, text: "Message",),
        ],
      ),
    );
  }
}

class IconText extends StatelessWidget {
  IconText({required this.iconData, required this.text});
  final IconData iconData;
  final String text;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: Column(
        children: <Widget>[
          Icon(
            iconData,
            size: 20,
            color: Colors.green,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 12, color: Colors.green),
          ),
        ],
      ),
    );
  }
}
class BagianContact extends StatelessWidget {
  String phone, city, postal;

  BagianContact({required this.phone, required this.city, required this.postal});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(16),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Container(
                child: Text(
                  'With many Class',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Container(
                child: Text(
                  phone,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  city,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Container(
                child: Text(
                  postal,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}