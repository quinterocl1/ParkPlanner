import 'package:access_control_residential/models/DataTable.dart';
import 'package:access_control_residential/screens/addresident.dart';
import 'package:access_control_residential/screens/addvehicle.dart';
import 'package:access_control_residential/screens/addvisitor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:access_control_residential/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:access_control_residential/screens/settings.dart';

class HomeAdminPage extends StatefulWidget {
  static const String routeName = 'HomeAdminPage';
  const HomeAdminPage({super.key});

  @override
  State<HomeAdminPage> createState() => _HomeAdminPageState();
}

class _HomeAdminPageState extends State<HomeAdminPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double scalew = (constraints.maxWidth * 1) / 500;
        double scaleh = (constraints.maxHeight * 1) / 640;
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Center(
                child: Column(children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: 10 * scaleh, left: 30 * scalew),
                    child: Row(children: [
                      SvgPicture.asset(
                        'assets/imgs/imagoType.svg',
                        width: 312 * scalew,
                        height: 42 * scaleh,
                      ),
                    ]),
                  ),
                  const MyDataTable(),
                ]),
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/icons/vaultIcon.svg',
                    width: 25,
                    height: 24,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeAdminPage(),
                      ),
                    );
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    showMenu(
                      context: context,
                      position: const RelativeRect.fromLTRB(160, 400, 160, 0),
                      items: [
                        const PopupMenuItem(
                          value: 1,
                          child: Row(
                            children: [
                              Icon(Icons.add),
                              SizedBox(width: 8),
                              Text('Add Resident'),
                            ],
                          ),
                        ),
                        const PopupMenuItem(
                          value: 2,
                          child: Row(
                            children: [
                              Icon(Icons.edit),
                              SizedBox(width: 8),
                              Text('Add visitor'),
                            ],
                          ),
                        ),
                        const PopupMenuItem(
                          value: 3,
                          child: Row(
                            children: [
                              Icon(Icons.edit),
                              SizedBox(width: 8),
                              Text('Add Vehicle'),
                            ],
                          ),
                        ),
                      ],
                    ).then((value) {
                      if (value != null) {
                        switch (value) {
                          case 1:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ResidentPage(),
                              ),
                            );
                            break;
                          case 2:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const VisitorPage(),
                              ),
                            );
                            break;
                          case 3:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const VehiclePage(),
                              ),
                            );
                            break;
                        }
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      foregroundColor: kPrimaryLightColor,
                      backgroundColor: kPrimaryColor,
                      elevation: 10,
                      padding: EdgeInsets.symmetric(
                          vertical: 17 * scaleh, horizontal: 20 * scalew),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: Size(50 * scalew, 30)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/plusIcon.svg',
                        width: 19,
                        height: 18,
                      ),
                      SizedBox(width: 10 * scalew),
                      Text(
                        "Add Register",
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            color: kPrimaryLightColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/icons/settingIcon.svg',
                    width: 25,
                    height: 24,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
