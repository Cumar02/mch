import 'package:flutter/material.dart';
import 'package:mather_child/HomePage.dart';
import 'package:mather_child/insert/employee.dart';
import 'package:mather_child/insert/insert_child.dart';
import 'package:mather_child/insert/insert_doctor.dart';
import 'package:mather_child/insert/login.dart';
import 'package:mather_child/insert/product.dart';
import 'package:http/http.dart' as http;
import 'package:mather_child/view/search.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {'login':(context)=>MyLogin()},
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int myCurrentIndex=0;

  List pages=[
    const HomePage(),
    const doctor(),
    const child_inset(),
    const employee(),
    const product()
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: pages[myCurrentIndex],
        appBar: AppBar(
          title: const Text("mather and children",style: TextStyle(fontSize: 22),),

          backgroundColor: const Color(0xFF517da2),
          foregroundColor: Colors.white,
          centerTitle: true,
          toolbarHeight: 80,
          elevation: 0,


          actions: [
            IconButton(
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => const SearchPage())),
                icon: Icon(Icons.search)
            )
          ],


        ),
        drawer:  Drawer(
          child: ListView.builder(padding: EdgeInsets.zero,
              itemBuilder:(context,index){
            children: [

              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Color(0xFF517da2)),

                accountName: Text('saidomar abshir',style: TextStyle(fontSize: 22),), accountEmail: Text('omar@gmail.com',style: TextStyle(fontSize: 18),),
                currentAccountPicture: CircleAvatar(foregroundImage: AssetImage('assets/albert.png'),),
              ),


            ];}),
        ),
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.black54,
            currentIndex: myCurrentIndex,
            iconSize: 35,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.health_and_safety_outlined),label: 'doctor'),
              BottomNavigationBarItem(icon: Icon(Icons.child_care_outlined),label: 'child'),
              BottomNavigationBarItem(icon: Icon(Icons.person_outline),label: 'employee'),
              BottomNavigationBarItem(icon: Icon(Icons.production_quantity_limits_outlined),label: 'products'),
            ],
            onTap: (myNewCurrent){
              setState(() {
                myCurrentIndex = myNewCurrent;
              });
            }
        ),

      ),
    );
  }

}