import 'package:flutter/material.dart';

import 'package:lab10_notif/components/my_drawer.dart';
import 'package:lab10_notif/pages/ChatPage.dart';
import 'package:lab10_notif/services/auth/auth_service.dart';
import 'package:lab10_notif/services/chat/ChatService.dart';

import '../components/user_tile.dart';
class HomePage extends StatelessWidget {
  HomePage({super.key});

  // chat and auth services
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Home"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,

      ),
      drawer: const MyDrawer(),
      body: _buildUserList(),



    );
  }
    // build a list of users except for the current logged in user
Widget _buildUserList() {

    return StreamBuilder(
        stream: _chatService.getUsersStream(),
        builder: (context, snapshot) {
          // errors
          if(snapshot.hasError){

            return const Text("Error");
          }

          //loading..
          if(snapshot.connectionState == ConnectionState.waiting){

            return const Text("Loading..");
          }
          //return list view
          return ListView(
            children: snapshot.data!.map<Widget>((userData) => _buildUserListItem(userData, context)).toList()


          );

        }

    );
}

  // build individual list tile for user
  Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context){
    // display all users except current user
    if(userData["email"] != _authService.getCurrenUser()!.email){
      return UserTile(
        text: userData["email"],
        onTap: () {
          // if tapped on user go to chat page
          Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatPage(
            receiverEmail: userData["email"],
            receiverID: userData["uid"],

          ),)
          );

        },

      );
    } else {
      return Container();


    }

  }
}