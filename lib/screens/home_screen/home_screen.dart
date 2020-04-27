import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tart_labs_store/components/app_list_item.dart';
import 'package:tart_labs_store/components/custom_text.dart';
import 'package:tart_labs_store/screens/login_screen/login_screen.dart';
import 'package:tart_labs_store/utils/color_resource.dart';
import 'package:tart_labs_store/utils/image_resource.dart';
import 'package:tart_labs_store/utils/preference_helper.dart';
import 'package:tart_labs_store/utils/string_resource.dart';
import 'app_bloc.dart';

class HomeScreen extends StatefulWidget {
  final String userName;

  const HomeScreen({this.userName});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  AppBloc appBloc = new AppBloc();

  @override
  void initState() {
    appBloc.getApps();
    super.initState();
  }

  @override
  void dispose() {
    appBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      drawer: drawer(),
      backgroundColor: ColorResource.bgColor,
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
          return Center(
            child: CustomText(
              text: StringResource.noAppsText,
              style: GoogleFonts.quicksand(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget appBar() {
    return AppBar(
      backgroundColor: ColorResource.secondaryColor,
      title: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: StringResource.tartText,
              style: GoogleFonts.exo2(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: StringResource.storeText,
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
          SizedBox(height: 10),
          drawerItem(0, selectedIndex, StringResource.myAppsText, Icons.layers, () {
            setSelectedIndex(0);
            Navigator.pop(context);
          }),
          drawerItem(1, selectedIndex, StringResource.logOutText, Icons.arrow_forward, () {
            setSelectedIndex(1);
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
              ImageResource.appIcon,
              width: 100,
              height: 110,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 24),
            CustomText(
              text: widget.userName,
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
            image: AssetImage(ImageResource.bgImage),
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
      color: isSelected ? ColorResource.fadedRed : null,
      child: ListTile(
        leading: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.black,
        ),
        title: Align(
          alignment: Alignment(-1.3, 0),
          child: CustomText(
            text: title,
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

  void setSelectedIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
