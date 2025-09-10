import 'package:flutter/material.dart';

import 'package:lab10_notif/components/my_button.dart';
import 'package:lab10_notif/components/my_textfield.dart';

import '../services/auth/auth_service.dart';

class LoginPage extends StatelessWidget {

  // email and password text controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  // tap method to go to register
  final void Function()? onTap;
  
  LoginPage({super.key,
  required this.onTap});

  //login method

  void login(BuildContext context) async {

    // auth service
    final authService = AuthService();

    //try login
    try {
      await authService.signInWithEmailPassword(_emailController.text, _pwController.text);


    }
    //catch any errors
    catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),


          ),
      );

    }


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          // logo
          Image.asset('lib/images/name.png', scale: 4,),
          Image.asset('lib/images/logo.png', scale: 4,),
          /*Icon(Icons.message,
          size: 60,
          color: Theme.of(context).colorScheme.primary,),*/

          const SizedBox(height: 50,),

          // welcome back message
          Text("Welcome back, friend",
          style: TextStyle(color: Theme.of(context).colorScheme.primary,
          fontSize: 16
          ),
          ),
          const SizedBox(height: 15,),
          // email textfield
          MyTextField(hintText: "Email",
          obscureText: false,
          controller: _emailController,),
          const SizedBox(height: 10,),
          // pw textfield
          MyTextField(hintText: "Password",
          obscureText: true,
          controller: _pwController,),
          const SizedBox(height: 15,),
          // login button
          MyButton(text: "Login",
          onTap: () => login(context),),
          // register
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text("Not a member? ",
             style: TextStyle(color: Theme.of(context).colorScheme.primary),),

             GestureDetector(
               onTap: onTap,
               child: Text("Register now", style: TextStyle(fontWeight: FontWeight.bold,
                   color: Theme.of(context).colorScheme.primary),),
             ),

           ],
         )

        ],
        ),
      ),
    );
  }
}
