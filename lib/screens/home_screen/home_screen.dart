import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tart_labs_store/components/app_list_item.dart';
import 'package:tart_labs_store/components/custom_text.dart';
import 'package:tart_labs_store/routes.dart';
import 'package:tart_labs_store/screens/detail_screen/bloc/app_detail_bloc.dart';
import 'package:tart_labs_store/screens/home_screen/bloc/app_event.dart';
import 'package:tart_labs_store/screens/home_screen/bloc/app_state.dart';
import 'package:tart_labs_store/utils/color_resource.dart';
import 'package:tart_labs_store/utils/image_resource.dart';
import 'package:tart_labs_store/utils/string_resource.dart';
import 'bloc/app_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  AppBloc appBloc;

  @override
  void initState() {
    super.initState();
    appBloc = BlocProvider.of<AppBloc>(context);
  }

  @override
  void dispose() {
    appBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      drawer: drawer(),
      backgroundColor: ColorResource.bgColor,
      body: BlocListener(
        bloc: appBloc,
        listener: (BuildContext context, AppState state) {
          if (state is AppDetailNavigateState) {
            AppDetailArgs args = AppDetailArgs(state.app);
            Navigator.pushNamed(
              context,
              AppRoutes.APP_DETAIL_SCREEN,
              arguments: args,
            );
          }
          if (state is MyAppsButtonPressedState) {
            Navigator.pop(context);
          }
        },
        child: BlocBuilder<AppBloc, AppState>(
          bloc: appBloc,
          builder: (BuildContext context, AppState state) {
            if (state is AppLoadingState) {
              return Center(child: CircularProgressIndicator());
            }
            if (appBloc.apps.length > 0)
              return Container(
                padding: EdgeInsets.only(top: 16),
                child: ListView.builder(
                  itemCount: appBloc.apps.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: AppListItem(
                        app: appBloc.apps[index],
                        appBloc: appBloc,
                      ),
                    );
                  },
                ),
              );
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
          drawerItem(0, selectedIndex, StringResource.myAppsText, Icons.layers,
              () {
            setSelectedIndex(0);
            appBloc.add(MyAppsButtonPressedEvent());
          }),
          drawerItem(
              1, selectedIndex, StringResource.logOutText, Icons.arrow_forward,
              () {
            setSelectedIndex(1);
            appBloc.add(LogOutButtonPressedEvent());
          }),
        ],
      ),
    );
  }

  Widget drawerHeader() {
    return BlocBuilder<AppBloc, AppState>(
      bloc: appBloc,
      builder: (BuildContext context, AppState state) {
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
                  text: appBloc.username,
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
      },
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
