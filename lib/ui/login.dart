import 'package:flutter/material.dart';

import 'homePage.dart';

class Login extends StatefulWidget {
  static const routeName = '/login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _username = '';

  void _showalert() {
    AlertDialog alert = AlertDialog(
      title: Text("Hai $_username",
        style: TextStyle(
        fontSize: 25,
      ),),
      content: Container(
        child: Text(" Selamat datang kembali, Semoga harimu menyenangkan, Jangan lupa makan ya...",
          style: TextStyle(
            fontSize: 15,
          ),),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage())),
          child: const Text('Ok'),),
      ],
    );

    showDialog(context: context, builder: (context) => alert);
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: [
            Image.asset('assets/images/logheader.jpg',width: 200, height: 200),
            Positioned(
              child: Container(
                height: 250,
                width: double.maxFinite,
                child: Card(
                  margin: const EdgeInsets.all(15.0),
                  elevation: 5,
                  child: Column(
                    children:[
                      Container(
                        margin: EdgeInsets.all(10),
                        child: const Text('Login',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 0.0 , horizontal: 15.0),
                        child: TextField(
                          decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.account_circle,
                            color: Color.fromARGB(255, 0, 151, 167)),
                            labelText: 'Username'
                          ),
                          onChanged: (String value) {
                            setState(() {
                              _username = value;
                            });
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 15.0 , horizontal: 15.0),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Color(0xff3eccdc),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          onPressed: () {
                            _showalert();
                          },
                          child: const Text('Log In',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
}

