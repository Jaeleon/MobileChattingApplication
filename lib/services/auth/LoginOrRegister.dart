import 'package:flutter/material.dart';
import 'package:lab10_notif/pages/LoginPage.dart';
import 'package:lab10_notif/pages/RegisterPage.dart';

class LoginOrRegister extends StatefulWidget{
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegister();


}
class _LoginOrRegister extends State<LoginOrRegister>{
  //initially show login page
  bool showLoginPage = true;
  // toggle between login and register
  void togglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });

  }


  @override
  Widget build(BuildContext context) {
    if(showLoginPage) {
      return LoginPage(
        onTap: togglePages,

      );
    } else {
      return Registerpage(
        onTap: togglePages,
      );
    }

  }
}