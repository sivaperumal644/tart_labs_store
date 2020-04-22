import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tart_labs_store/components/app_list_item.dart';
import 'package:tart_labs_store/constants/colors.dart';
import 'package:tart_labs_store/screens/login_screen/login_screen.dart';
import 'package:tart_labs_store/utils/preference_helper.dart';

import 'app_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    appBloc.getApps();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      drawer: drawer(),
      backgroundColor: BG_COLOR,
      body: StreamBuilder(
        stream: appBloc.getAppList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            return Container(
              padding: EdgeInsets.only(top: 16),
              child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: AppListItem(app: snapshot.data[index]),
                  );
                },
              ),
            );
          }
          return Container();
        },
      ),
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
              style: GoogleFonts.exo2(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: 'labs Store',
              style: GoogleFonts.exo2(
                fontSize: 24,
                fontWeight: FontWeight.w300,
              ),
            ),
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
          Container(height: 10),
          drawerItem(0, selectedIndex, 'My Apps', Icons.layers, () {
            setState(() {
              selectedIndex = 0;
            });
            Navigator.pop(context);
          }),
          drawerItem(1, selectedIndex, 'Log out', Icons.arrow_forward, () {
            setState(() {
              selectedIndex = 1;
            });
            PreferenceHelper.clearToken();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget drawerHeader() {
    return Container(
      height: 190,
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
              style: GoogleFonts.quicksand(
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
            fit: BoxFit.cover,
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
        title: Align(
          alignment: Alignment(-1.3, 0),
          child: Text(
            title,
            style: GoogleFonts.quicksand(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
