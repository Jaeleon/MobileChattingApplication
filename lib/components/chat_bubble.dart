import 'package:flutter/material.dart';
import 'package:lab10_notif/themes/theme_provider.dart';
import 'package:provider/provider.dart';
class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;



  const ChatBubble({super.key,
  required this.message,
  required this.isCurrentUser

  });

  @override
  Widget build(BuildContext context) {
    // light and dark mode for correct bubble colors
    bool isDarkMode = Provider.of<ThemeProvider>(context, listen: false).isDarkMode;

    return Container(
      decoration: BoxDecoration(
        color: isCurrentUser ? (isDarkMode ? Colors.green.shade700 : Colors.green.shade400) : (isDarkMode ? Colors.grey.shade700 : Colors.grey.shade200),
        borderRadius: BorderRadius.circular(13)
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),

      child: Text(message,
      style: TextStyle(color: (isDarkMode ? Colors.white : Colors.black)),

      ),

    );
  }
}

