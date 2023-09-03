import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Items/theme_provider.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  void _toggleDarkMode() {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    themeProvider.toggleTheme();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Account'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              // user profile image
              backgroundImage: AssetImage('assets/Images/picture.png'),
            ),
            const SizedBox(height: 20),
            const Text(
              'John Doe', // Replace with actual user name
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // TODO: Navigate to the settings screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Language'),
              onTap: () {
                // TODO: Show language selection dialog
              },
            ),
            SwitchListTile(
              title: Text('Dark Mode'),
              value: themeProvider.currentTheme == ThemeMode.dark,
              onChanged: (value) {
                _toggleDarkMode();
              },
            ),
            const SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(90),
                color: Colors.deepPurple

              ),
              child: TextButton(
                onPressed: () {
                  // Handle logout and navigate back to splash screen
                  Navigator.pushNamedAndRemoveUntil(context, '/splash', (route) => false);
                },
                child: const Text('Logout',style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                 ),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)){
                        return Colors.white;
                      }
                    }),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder> (
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
