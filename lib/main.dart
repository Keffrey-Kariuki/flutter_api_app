import 'package:api_app/pages/meal_db_page.dart';
import 'package:api_app/pages/mine_page.dart';
import 'package:api_app/pages/news_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }

}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int currentIndex = 0;
  List<Widget> pages = [
    const MealDBPage(),
    const NewsPage(),
    const MinePage()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "API APP"
        ),
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30.0,
        selectedLabelStyle: const TextStyle(
          fontSize: 17.0
        ),
        unselectedLabelStyle:  const TextStyle(
          fontSize: 17.0
        ),
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: "MealDB"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.newspaper),
              label: "News"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.fastfood),
              label: "Mine"
          )
        ]
      )
    );
  }

}