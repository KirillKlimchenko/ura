import 'package:flutter/material.dart';
import 'package:ura/HomePage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      home: PageHome(),debugShowCheckedModeBanner: false,
    );
  }
}

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  final _loginText = TextEditingController();
  final _passwordText = TextEditingController();
  String? errorText = null;
  void _auth() {
    final login = _loginText.text;
    final password = _passwordText.text;
    if (login == '8800930' && password == 'admin') {
      errorText = null;
      print('Open');
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    }
    else {
      errorText = 'Не верный логин или пароль';
      print('Ошибка');
    }
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    const BorderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(36)),
        borderSide: BorderSide(
            color: const Color(0xFFbbbbbb), width: 2)
    );
    const LinkTextStyle = TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color(0xFF0079D0)
    );
    final errorText = this.errorText;
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 60),
              const SizedBox(width: 110, height: 84, child: Placeholder(),
              ),
              const SizedBox(height: 20),
              const Text('Введите логин в виде 10 цифр номера телефона',
                  style: TextStyle(
                      fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.6))),
              const Text('Логин:8800930 Пароль:admin',
                  style: TextStyle(
                      fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.6))),
              const SizedBox(height: 20),
              SizedBox(width: 224,
                child: TextField(
                  controller: _loginText,
                  decoration: const InputDecoration(
                      enabledBorder: BorderStyle,
                      focusedBorder: BorderStyle,
                      filled: true,
                      fillColor: Color(0xFFeceff1),
                      labelText: 'Телефон'
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(width: 224,
                child: TextField(
                  controller: _passwordText,
                  obscureText: true,
                  decoration: const InputDecoration(
                      enabledBorder: BorderStyle,
                      focusedBorder: BorderStyle,
                      filled: true,
                      fillColor: Color(0xFFeceff1),
                      labelText: 'Пароль'
                  ),
                ),
              ),
              const SizedBox(height: 28),
              if(errorText != null)
                Text(
                    '$errorText'
                ),
              SizedBox(
                width: 154,
                height: 42,
                child:
                ElevatedButton(
                  onPressed: _auth,
                  child: Text('Войти'),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFF0079D0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36.0),
                      )
                  ),
                ),
              ),
            ],),
        ),
      ),
    );
  }
}
