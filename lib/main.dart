import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';
import 'map.dart';

var apiKeyGoogle = "AIzaSyCX6o9lxvLQCOuHxuBqZwB6gtwulL6ZxM4";
var apiKeyMapBox = "pk.eyJ1IjoicHVjaG9vIiwiYSI6ImNqanlvdjQ4ZTAxZngzcXA1Z3RuNzdldWMifQ.tiQLHQVhkrFasOaW759TwQ";

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Mapp Test',
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
          title: Center(child: Text('Map Test')),
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
                      child: const Text('A'),
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
      body: new Stack(
          children: <Widget>[
            new TabBarView(
              controller: tabController,
              children: <Widget>[
                // List of Widget, is like a list of fragment, ech one is a tab
                new MyMap(apiKeyMapBox),
                new page("page"),
                new page('headset is on?')
              ],
            ),
          ]
      ),

  );

/*
  new Stack(
      children: <Widget>[
        new Column(
            children: <Widget>[
              new Container(
                  height: topWidgetHeight,
                  color: Colors.yellow,
                  ),
              new Container(
                  color: Colors.red,
                  )
            ],
            ),
        new Positioned(
            child: new CircleAvatar(
                radius: avatarRadius,
                backgroundColor: Colors.green,
                ),
            left: (MediaQuery.of(context).size.width/2) - avatarRadius,
            top: topWidgetHeight - avatarRadius,
            )
      ],
      ),
*/

  }
}
