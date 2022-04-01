import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:momyzdelivery/ui/views/home/widget.home.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../../constant/pallete.const.dart';
import '../notifications/view_notification.dart';
import '../orders/view_orders.dart';
import '../profile/view_profile.dart';

class ProvidedStylesExample extends StatefulWidget {
  @override
  _ProvidedStylesExampleState createState() => _ProvidedStylesExampleState();
}

class _ProvidedStylesExampleState extends State<ProvidedStylesExample> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 3);
  bool _hideNavBar = false;

  @override
  void initState() {
    super.initState();
  }

  List<Widget> _buildScreens() {
    return [
      Profile(),
      Notifications(),
      Orders(),
      Home(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset('assets/icons/ProfileActive.svg'),
        inactiveIcon: SvgPicture.asset('assets/icons/Profile 2.svg'),
        activeColorPrimary: Pallete.pinkColorPrinciple,
        title: "j",
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset('assets/icons/NotificationActive.svg'),
        inactiveIcon: SvgPicture.asset('assets/icons/Notification.svg'),
        activeColorPrimary: Pallete.pinkColorPrinciple,
        title: "Home",
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset('assets/icons/BagActive.svg'),
        inactiveIcon: SvgPicture.asset('assets/icons/orders.svg'),
        activeColorPrimary: Pallete.pinkColorPrinciple,
        title: "Home",
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset('assets/icons/homeActive.svg'),
        inactiveIcon: SvgPicture.asset('assets/icons/Discovery.svg'),
        activeColorPrimary: Pallete.pinkColorPrinciple,
        title: "Home",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,

        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
            ? 0.0
            : kBottomNavigationBarHeight,
        hideNavigationBarWhenKeyboardShows: true,
        margin: EdgeInsets.all(0.0),
        popActionScreens: PopActionScreensType.all,
        bottomScreenMargin: 0.0,

        selectedTabScreenContext: (context) {},
        hideNavigationBar: _hideNavBar,
        decoration: NavBarDecoration(
            colorBehindNavBar: Colors.red,
            borderRadius: BorderRadius.circular(20.0)),
        popAllScreensOnTapOfSelectedTab: true,

        itemAnimationProperties: ItemAnimationProperties(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),

        navBarStyle:
            NavBarStyle.style12, // Choose the nav bar style with this property
      ),
    );
  }
}
