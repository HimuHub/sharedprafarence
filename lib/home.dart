import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedprafarence/new.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sharedpreference'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 50)),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(hintText: 'Email'),
                  ),
                  TextFormField(
                    controller: passController,
                    decoration: InputDecoration(hintText: 'password'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.pinkAccent,
                    height: 50,
                    width: 200,
                    child: TextButton(
                        onPressed: () async {
                          SharedPreferences sp =
                              await SharedPreferences.getInstance();
                          sp.setString(
                              'email', emailController.text.toString());
                          sp.setString('pass', passController.text.toString());
                          sp.setBool('isLogin', true);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Newpage()));
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
