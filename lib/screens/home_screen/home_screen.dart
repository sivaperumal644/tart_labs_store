import 'package:flutter/material.dart';
import 'package:tart_labs_store/constants/colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      drawer: drawer(),
      body: Container(),
    );
  }

  Widget appBar() {
    return AppBar(
      backgroundColor: SECONDARY_COLOR,
      title: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: 'Tart',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: 'labs Store',
              style: TextStyle(fontSize: 24),
            )
          ],
        ),
      ),
    );
  }

  Widget drawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          drawerHeader(),
          drawerItem(0, selectedIndex, 'My Apps', Icons.layers, () {
            setState(() {
              selectedIndex = 0;
            });
          }),
          drawerItem(1, selectedIndex, 'Log out', Icons.arrow_forward, () {
            setState(() {
              selectedIndex = 1;
            });
          }),
        ],
      ),
    );
  }

  Widget drawerHeader() {
    return Container(
      height: 200,
      child: DrawerHeader(
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/images/group_4.png',
              width: 100,
              height: 110,
            ),
            Container(height: 24),
            Text(
              'Gowtham Raj',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_1.jpg'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Widget drawerItem(int itemIndex, int selectedIndex, String title,
      IconData icon, Function onTap) {
    bool isSelected = itemIndex == selectedIndex;
    return Container(
      color: isSelected ? FADED_RED : null,
      child: ListTile(
        leading: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.black,
        ),
        title: Text(
          'My Apps',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
