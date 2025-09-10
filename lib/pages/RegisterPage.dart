import 'package:flutter/material.dart';

import 'package:lab10_notif/components/my_button.dart';
import 'package:lab10_notif/components/my_textfield.dart';

import '../services/auth/auth_service.dart';

class Registerpage extends StatelessWidget {


  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmpwController = TextEditingController();

  // tap method to go to login
  final void Function()? onTap;


  Registerpage({super.key,
  required this.onTap});
  //register method

  void register(BuildContext context){
  //get auth service
    final _auth = AuthService();

    // if password matches create user
    if(_pwController.text == _confirmpwController.text){
        try{
              _auth.signUpWithEmailPassword(
            _emailController.text,
            _pwController.text,

          );
        } catch (e) {

              showDialog(
              context: context,
              builder: (context) => AlertDialog(
              title: Text(e.toString())
              ),
              );

        }

    }
  // if password do not match show error
  else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
            title: Text("Passwords do not match"),
        ),
      );

    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
           /*Icon(Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,),*/
            Image.asset('lib/images/name.png', scale: 4,),
            Image.asset('lib/images/logo.png', scale: 4,),



            const SizedBox(height: 25,),

            // welcome back message
            Text("Create an account",
              style: TextStyle(color: Theme.of(context).colorScheme.primary,
                  fontSize: 16
              ),
            ),
            const SizedBox(height: 15,),
            // email textfield
            MyTextField(hintText: "Email",
              obscureText: false,
              controller: _emailController,),
            const SizedBox(height: 5,),
            // pw textfield
            MyTextField(hintText: "Password",
              obscureText: true,
              controller: _pwController,),
            // confirm pw textfield
            MyTextField(hintText: "Confirm Password",
              obscureText: true,
              controller: _confirmpwController,),
            const SizedBox(height: 10,),
            // login button
            MyButton(text: "Register",
              onTap: () => register(context),),
            // register
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? ",
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),),

                GestureDetector(
                  onTap: onTap,
                  child: Text("Login", style: TextStyle(fontWeight: FontWeight.bold,
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
