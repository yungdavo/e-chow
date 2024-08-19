import 'package:e_Chow/pages/home/main_food_page.dart';
import 'package:e_Chow/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

  //late PersistentTabController _controller;


  List pages = [
    MainFoodPage(),
    Container(child: Center(child: Text("Page 1"))),
    Container(child: Center(child: Text("Page 2"))),
    Container(child: Center(child: Text("Page 3"))),
  ];

  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(

        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.amberAccent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        currentIndex: _selectedIndex,
        onTap: onTapNav,

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: ("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline_sharp),
            label: ("Archive"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: ("Cart"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_3_outlined),
            label: ("Me"),
          ),
        ],
      ),
    );
  }

/*  @override
  void initState(){
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
   }*/

/*List<Widget> _buildScreens() {
    return [
      MainFoodPage(),
      Container(child: Center(child: Text("Page 1"))),
      Container(child: Center(child: Text("Page 2"))),
      Container(child: Center(child: Text("Page 3"))),
    ];
  }*/

/*List <PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,

      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.heart),
        title: ("favourite"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,

      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.cart),
        title: ("Cart"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,

      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person),
        title: ("me"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }*/

/* @override
  Widget build(BuildContext context) {
    return PersistentTabView(
    context,
    controller: _controller,
    screens: _buildScreens(),
    items: _navBarsItems(),
    handleAndroidBackButtonPress: true, // Default is true.
    resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
    stateManagement: true, // Default is true.
    hideNavigationBarWhenKeyboardShows: true,
      popAllScreensOnTapOfSelectedTab: true,
    margin:  EdgeInsets.only(top: 8),
    backgroundColor: Colors.grey.shade900,

      confineInSafeArea: true,
    navBarHeight: kBottomNavigationBarHeight,
    navBarStyle: NavBarStyle.style2, // Choose the nav bar style with this property
      );
    }
  }*/
}





