import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';

void main() {
  MapView.setApiKey("<your_api_key>");
  runApp(new MyApp());
}

var apiKey = "AIzaSyDX7mK74TR9cEFomaSY44Arzz_TRdu2U8Q";

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Mapp Test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}


class page extends StatelessWidget {
  String title;
  page(this.title);

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Center(
            child:  new Text(title),
            ),
        );
  }
}


class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  TabController tabController;

  //here in the initstate we assign the tabcontroller and give it a length and vsyc for animation.
  @override
  void initState(){
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
  }

  //dispose method for good practice.
  @override
  void dispose(){
    super.dispose();
    tabController.dispose();
  }


  //our build widget of state class.
  @override
  Widget build(BuildContext context) {

    //Definition of tabBar Icons, no need define actions
  final tab = new TabBar(
      controller: tabController,
      tabs: <Widget>[
        new Tab(
            child: new Icon(Icons.map),
            ),
        new Tab(
            child: new Icon(Icons.star),
            ),
        new Tab(
            child: new Icon(Icons.history),
            ),
      ],
  );

  return new Scaffold(
      appBar: new AppBar(
          title: Center(child: Text('Test Tittle')),
          bottom: tab,
      ),
      // Drawer is a side menu - Flutter alone add a menu icon in the appBar
      drawer: new Drawer(
          child: new ListView(
              children: <Widget> [
                // Simple Header
                /*new DrawerHeader(
                    child: new Text('Header'),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                ),*/
                // Header with some user data
                new UserAccountsDrawerHeader(
                  accountName: const Text('Account Name'),
                  accountEmail: const Text('mail.widget@example.com'),
                  currentAccountPicture: const CircleAvatar(
                      backgroundColor: Colors.brown,
                      child: const Text('AH'),
                      )
                ),
                // Items for the sideMenu
                new ListTile(
                    title: new Text('First Menu Item'),
                    onTap: () {},
                ),
                new ListTile(
                    title: new Text('Second Menu Item'),
                    onTap: () {},
                ),
                new Divider(),
                new ListTile(
                    title: new Text('Close'),
                    onTap: () {
                      Navigator.pop(context); // Navigate to the context, close the sideMenu
                    },
                ),
              ],
              )
      ),
      body: new TabBarView(
          controller: tabController,
          children: <Widget>[
            // List of Widget, is like a list of fragment, ech one is a tab
            new page("hey"),
            new page('the other one!'),
            new page('headset is on?')
          ],

      ),
  );

  }
}
