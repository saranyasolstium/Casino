import 'package:casino_web_app/screen/home/home_screen.dart';
import 'package:casino_web_app/screen/home/report_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:casino_web_app/res/colors/app_color.dart';
import 'package:casino_web_app/res/font_style/style.dart';
import 'package:casino_web_app/screen/user/user_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: TabBarView(
        controller: _tabController,
        children: const [
          HomeScreen(),
          ReportScreen(),
          UserScreen(),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.background,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(flex: 1, child: Container()),
            Expanded(
              flex: 2,
              child: _buildTabBar(),
            ),
            Expanded(flex: 3, child: Container()),
            Expanded(
                flex: 1,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: _buildUserProfile(),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      tabs: const [
        Tab(text: 'Home'),
        Tab(text: 'Report'),
        Tab(text: 'Users'),
      ],
      onTap: (index) {
        // Handle tab selection if needed
      },
      labelStyle: GoogleFonts.roboto(fontSize: 18),
      unselectedLabelStyle: GoogleFonts.roboto(fontSize: 18),
      indicator: const BoxDecoration(),
      labelColor: AppColors.accentColor,
      unselectedLabelColor: Colors.black,
      dividerHeight: 0,
    );
  }

  Widget _buildUserProfile() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage('assets/profile_image.png'),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Text(
              'Hi',
              style: zzRegularBlackTextStyle10,
            ),
            Row(
              children: [
                Text(
                  'Lorem Ipsum',
                  style: zzRegularBlackTextStyle12,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 5, left: 5),
                  child: Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: Colors.black,
                    size: 16,
                  ),
                )
              ],
            ),
          ],
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}
