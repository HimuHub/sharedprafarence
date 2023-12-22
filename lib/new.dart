import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedprafarence/home.dart';

class Newpage extends StatefulWidget {
  const Newpage({super.key});

  @override
  State<Newpage> createState() => _NewpageState();
}

class _NewpageState extends State<Newpage> {
  String email = '';
  String pass = '';

  @override
  void initState() {
    loaddata();
    super.initState();
  }

  loaddata() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString('email') ?? "";
    pass = sp.getString('pass') ?? "";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Home Screen"),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () async {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.clear();
                Navigator.push(
                    context, (MaterialPageRoute(builder: (context) => Home())));
              },
              child: Text(
                'Logout',
                style: TextStyle(fontSize: 20),
              )),
        ],
      ),
    );
  }
}
