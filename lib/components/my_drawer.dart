import 'package:flutter/material.dart';


import '../pages/SettingsPage.dart';
import '../services/auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout(){
    // get auth service

    final auth = AuthService();
    auth.signOut();

  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Column(
            children: [
              const SizedBox(height: 25,),
              Image.asset('lib/images/name.png', scale: 3,),
              //logo
              DrawerHeader(
                child: Center(
                    child: Image.asset('lib/images/logo.png', scale: 4,),

                           /*Icon(Icons.message,
                      color: Theme.of(context).colorScheme.primary,
                      size: 40,

                    )*/
                ),


              ),

              //home list tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: const Text("H O M E"),
                  leading: const Icon(Icons.home),
                  onTap: (){
                    // pop the drawer

                    Navigator.pop(context);
                  },


                ),
              ),


              //settings list tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: const Text("S E T T I N G S"),
                  leading: const Icon(Icons.settings),
                  onTap: (){
                    // pop the drawer

                    Navigator.pop(context);

                    //Navigate to the settings page
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context)=> const SettingsPage(),));

                  },


                ),
              ),

            ],

          ),


          //logout tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
            child: ListTile(
              title: const Text("L O G O U T"),
              leading: const Icon(Icons.logout),
              onTap: logout,


            ),
          ),


        ],




      ),


    );
  }
}
