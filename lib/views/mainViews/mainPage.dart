import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wholay/styles.dart';
import 'package:wholay/widgets/appWidgets.dart';
import 'package:wholay/views/mainViews/loginDrawer.dart';
import 'package:wholay/views/mainViews/mainDrawerMenu.dart';
import 'package:wholay/views/feedViews/main_feeds.dart';
import 'package:wholay/main.dart';

// Test
// import 'package:wholay/views/userProfile/userAccountEntry.dart';
// import 'package:wholay/views/userProfile/userAccountSummary.dart';

class MainPage extends StatefulWidget {
  final int pageIndex;

  MainPage({
    Key key,
    this.pageIndex,
  }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // static int _selectedTab;
  // final CircularBottomNavigationController _navController = CircularBottomNavigationController(_selectedTab);
  final String _appName = 'Wholay';
  final Curve _curve = Curves.fastOutSlowIn;
  final Duration _pageDuration = Duration(milliseconds: 200);
  final Color _activeIconColor = Colors.white;
  final Color _inactiveIconColor = WholayColors.blue[300];
  // final PageController _pageController = PageController(initialPage: 2, keepPage: false);
  int _activePage;
  String _pageName;

  // List<TabItem> tabItems = List.of([
  //   TabItem(Icons.favorite, 'รายการโปรด', WholayColors.primary),
  //   TabItem(FontAwesomeIcons.volumeUp, 'ประกาศ', WholayColors.primary), // another icon is FontAwesomeIcons.bullhorn
  //   TabItem(Icons.search, 'ค้นหาช่าง', WholayColors.primary),
  //   TabItem(FontAwesomeIcons.calendarAlt, 'รายการนัด', WholayColors.primary),
  //   TabItem(FontAwesomeIcons.solidBell, 'แจ้งเตือน', WholayColors.primary),
  // ]);

  @override
  void initState() {
    // _navController.value = 2;
    super.initState();
  }

  @override
  void dispose() {
    // _navController.dispose();
    // _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _activePage = (widget.pageIndex == null && _activePage == null)
        ? 2
        : ((widget.pageIndex != null) && (_activePage == null)
            ? widget.pageIndex
            : _activePage);
    final PageController _pageController =
        PageController(initialPage: _activePage, keepPage: false);

    String getPageName(int pageIndex) {
      String _result = '';
      switch (pageIndex) {
        case 0:
          _result = 'รายการโปรด';
          break;
        case 1:
          _result = 'ประกาศหาช่าง';
          break;
        case 2:
          _result = 'News Feed';
          break;
        case 3:
          _result = 'รายการนัด';
          break;
        case 4:
          _result = 'รายการแจ้งเตือน';
          break;
        default:
          _result = '';
      }
      return _result;
    }

    _pageName = getPageName(_activePage);
    Text _textPage = Text(_pageName ?? '', textAlign: TextAlign.center);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: WholayColors.surface,
      appBar: AppBar(
        title: (_activePage == 2)
                ? Padding(
                  padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 2.0, bottom: 2.0),
                      hintText: 'ค้นหา',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                )
                : Text(_appName + ((_pageName != null) ? ' - ' + _pageName : '')),
      ),
      body: PageView(
        controller: _pageController,
        // pageSnapping: false,
        onPageChanged: (page) {
          setState(() {
            _activePage = page;
            _pageName = getPageName(_activePage);
          });
        },
        children: <Widget>[
          Container(
            color: WholayColors.surface,
            alignment: Alignment.center,
            child: _textPage,
          ),
          Container(
            alignment: Alignment.center,
            color: WholayColors.surface,
            child: _textPage,
          ),
          // Container(
          //   color: WholayColors.surface,
          //   alignment: Alignment.center,
          //   child: MainFeedPage(),
          // ),
          MainFeedPage(),
          Container(
            color: WholayColors.surface,
            alignment: Alignment.center,
            child: _textPage,
          ),
          Container(
            color: WholayColors.surface,
            alignment: Alignment.center,
            child: _textPage,
          ),
        ],
      ),
      drawer: Drawer(
        child: (accessInfo.signupReady)
            ? MainDrawerMenuPage()
            : LoginDrawerMenuPage(),
      ),
      bottomNavigationBar: Container(
        // color: WholayColors.surface,
        child: BottomAppBar(
          color: WholayColors.blue[400],
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.person), //  Icon(Icons.favorite),
                  color: (_activePage == 0)
                      ? _activeIconColor
                      : _inactiveIconColor,
                  onPressed: () {
                    _pageController.animateToPage(0,
                        duration: _pageDuration, curve: _curve);
                    // _activePage = 0;
                  }),
              IconButton(
                  icon: Icon(FontAwesomeIcons.bullhorn),
                  color: (_activePage == 1)
                      ? _activeIconColor
                      : _inactiveIconColor,
                  onPressed: () {
                    _pageController.animateToPage(1,
                        duration: _pageDuration, curve: _curve);
                    // _activePage = 1;
                  }),
              SizedBox(width: 60.0),
              IconButton(
                  icon: Icon(FontAwesomeIcons.calendarAlt),
                  color: (_activePage == 3)
                      ? _activeIconColor
                      : _inactiveIconColor,
                  onPressed: () {
                    _pageController.animateToPage(3,
                        duration: _pageDuration, curve: _curve);
                    // _activePage = 3;
                  }),
              IconButton(
                  icon: Icon(FontAwesomeIcons.solidBell),
                  color: (_activePage == 4)
                      ? _activeIconColor
                      : _inactiveIconColor,
                  onPressed: () {
                    _pageController.animateToPage(4,
                        duration: _pageDuration, curve: _curve);
                    // _activePage = 4;
                  }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search,
            color: (_activePage == 2) ? _activeIconColor : _inactiveIconColor,
            size: WholaySpace.headIconSize),
        onPressed: () {
          _pageController.animateToPage(2,
              duration: _pageDuration, curve: _curve);
          // _activePage = 2;
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
