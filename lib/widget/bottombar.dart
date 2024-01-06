import 'package:app/Model/data_model.dart';
import 'package:app/controller/bottom_provider.dart';
import 'package:app/view/chartscreen/chart_page.dart';
import 'package:app/helpers/colors.dart';
import 'package:app/view/homescreen/home_page.dart';
import 'package:app/view/settingscreen/settings_screen.dart';
import 'package:app/view/employeesbottom/four_screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomBar1 extends StatelessWidget {
  final String companyname;

  const BottomBar1({
    super.key,
    required this.companyname,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Provider.of<BottomBarProvider>(context),
      child: _BottomBar(
        companyname: companyname,
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  final String companyname;

  const _BottomBar({required this.companyname});

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<BottomBarProvider>(context, listen: false);

    return Scaffold(
      body: IndexedStack(
        index: pro.currentIndex,
        children: [
          HomeScreen(
            companyname: companyname,
            employee: EmployeeModel(
              name: '',
              gender: '',
              email: '',
              number: '',
              category: "",
              image: "",
            ),
          ),
          EmployeeListScreen(companyname: companyname),
          const Chart(),
          SettingsScreen(companyname: companyname),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: MainColours.homebgColor[400],
        currentIndex: pro.currentIndex,
        onTap: (index) {
          pro.updateIndex(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: MainColours.bgblack),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: MainColours.bgblack),
            label: "Employees",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart, color: MainColours.bgblack),
            label: "Chart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: MainColours.bgblack),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
