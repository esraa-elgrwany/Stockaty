import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    int index=0;
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          index=value;
          setState(() {
          });
        },

        currentIndex: index,
        items: [
          BottomNavigationBarItem(icon:ImageIcon(AssetImage("")),
            label: "",
            backgroundColor: Theme.of(context).colorScheme.primary,),

        ],
      ),
      body: tabs[index],
    );
  }

  List<Widget>tabs=[];
}

