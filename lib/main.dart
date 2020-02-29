import 'package:flutter/material.dart';
import './bottom_bar.dart';
import './cookie_page.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final  String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> 
with SingleTickerProviderStateMixin {
  
  TabController _tabController;

@override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Text('Pickup'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: Column(
        children: <Widget>[
          SizedBox(height: 15.0),
          Text('Categories',
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 42.0,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 15.0),
          TabBar(
              controller: _tabController,
              indicatorColor: Colors.transparent,
              labelColor: Color(0xFFC88D67),
              isScrollable: true,
              labelPadding: EdgeInsets.only(right: 45.0),
              unselectedLabelColor: Color(0xFFCDCDCD),
              tabs: [
                Tab(
                  child: Text('Cookies', style: TextStyle(fontSize: 21.0),),
                ),
                Tab(
                  child: Text('Cookie cake', style: TextStyle(fontSize: 21.0),),
                ),
                Tab(
                  child: Text('Ice cream', style: TextStyle(fontSize: 21.0),),
                ),
              ]
            ),
            Expanded(
              child: Container(
                  width: double.infinity,
                  child: TabBarView(controller: _tabController, children: [
                    CookiePage(),
                    CookiePage(),
                    CookiePage(),
                  ])),
            )
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Color(0xFFF17532),
        child: Icon(Icons.fastfood),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}