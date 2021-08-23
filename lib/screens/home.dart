import 'package:flutter/material.dart';
import 'package:to_do_app/screens/add_screen.dart';
import 'package:to_do_app/screens/app_bar.dart';
import 'package:to_do_app/screens/item_list.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2C384A),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF2C384A),
        title: AppBarTitle(
          sectionName: 'Crud',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context)=>AddScreen(),
              ),
          );
        },
        backgroundColor: Colors.orangeAccent,
        child: Icon(
            Icons.add,
            color: Colors.white,
            size: 32
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom:20.0,
          ),
          child: ItemList(),
        ),
      ),
    );
  }

}