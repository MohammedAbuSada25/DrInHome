import 'package:drinhome/Module/Home/BarCode/barCodeScreen.dart';
import 'package:drinhome/Module/Home/List/ListScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;
  final pages = [

    /// Screens
    // BarCodeScreen(),
    BarCodeScreen(),
    ListScreen(),
    //ListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            innerBoxIsScrolled = false;
            return [ SliverAppBar(
              // toolbarHeight: 50,
              title: const Text("الطبيب داخل البيت",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
              centerTitle: true,
              pinned: true,
              floating: true,
              // flexibleSpace: Container(color: Colors.black,),
              // stretch: false,
              bottom: TabBar(
                indicatorColor: Colors.amberAccent,
                indicatorSize: TabBarIndicatorSize.tab,
                // indicator: BoxDecoration(
                //     borderRadius: BorderRadius.circular(50), // Creates border
                //     color: Colors.greenAccent),
                onTap: _onItemTapped,
                tabs: [
                  Tab(icon: const Icon(Icons.barcode_reader),),
                  Tab(icon: const Icon(Icons.list_alt),),
                ],
              ),
            ),
            ];
          },
          body: pages[pageIndex],
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   items: const [
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.barcode_reader),
        //       label: 'BarCode',
        //     ),
        //
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.list_alt,),
        //
        //       label: 'List',
        //     ),
        //   ],
        //   elevation: 0,
        //   backgroundColor: const Color(0XFFF8F9FB),
        //   currentIndex: pageIndex,
        //   selectedItemColor: Colors.blue,
        //   onTap: _onItemTapped,
        // ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      pageIndex = index;
    });
  }
}

