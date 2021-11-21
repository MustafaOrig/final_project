import 'dart:ffi';
import 'package:firstapp/Screens/wrapper.dart';
import 'package:firstapp/Services/auth.dart';
import 'package:firstapp/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(
          duration: 3,
          goToPage: Wrapper(),
        ),
      ),
    );
  }
}

class SplashPage extends StatelessWidget {
  final int duration;
  final Widget goToPage;

  SplashPage({required this.goToPage, required this.duration});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: this.duration), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => this.goToPage));
    });

    return Scaffold(
      body: Container(
        color: Color(0xFF0C038),
        alignment: Alignment.center,
        child: Image(
          image: AssetImage('Assets/images/logo.png'),
        ),
      ),
    );
  }
}
