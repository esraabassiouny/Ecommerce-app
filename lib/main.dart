import 'package:ecommerce/Screens/Widgets/details.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Screens/account.dart';
import 'Screens/home.dart';
import 'Screens/favorite.dart';
import 'Screens/sign-in.dart';
import 'Screens/sign-up.dart';
import 'Screens/splash-screen.dart';
import 'Screens/Items/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProviderRef, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'E-Commerce APP',
            theme: ThemeData(
              primaryColor: Colors.deepPurple,
                  primarySwatch: Colors.deepPurple,
            ),
            darkTheme: ThemeData.dark(),
            themeMode: themeProviderRef.currentTheme,
            home:  SplashScreen() ,
            // initialRoute: '/splash',
            // routes: {
            //   '/splash': (context) => const SplashScreen(),
            //   '/signin': (context) => const SignInScreen(),
            //   '/signup': (context) => const SignUpScreen(),
            //   '/home': (context) => const MainScreen(),
            // },
          );
        },
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    FavoriteScreen(),
    AccountScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: const Text('Goods2You',style: TextStyle(
          fontFamily: 'Pacifico',
        ),),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),

        ],
      ),

    );
  }
}
