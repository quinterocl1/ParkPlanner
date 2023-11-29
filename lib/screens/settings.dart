import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:access_control_residential/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsPage extends StatefulWidget {
  static const String routeName = 'SettingsPage';
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double scalew = (constraints.maxWidth * 1) / 500;
        double scaleh = (constraints.maxHeight * 1) / 640;
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              '',
            ),
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
            foregroundColor: kSecondaryDarkColor,
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Center(
                child: Column(children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: 10 * scaleh, left: 30 * scalew),
                    child: Row(children: [
                      SvgPicture.asset(
                        'assets/imgs/isoType.svg',
                        width: 82 * scalew,
                        height: 42 * scaleh,
                      ),
                      Text(
                        "Settings",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          color: kSecondaryColor,
                          fontSize: 32 * scaleh,
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 80 * scaleh),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/imgs/logoType.svg',
                          width: 219 * scalew,
                          height: 26 * scaleh,
                        ),
                        SizedBox(height: 20 * scaleh),
                        Text(
                          "The Last Version",
                          style: GoogleFonts.inter(
                              textStyle: TextStyle(
                            color: kSecondaryDarkColor,
                            fontSize: 17 * scaleh,
                            fontWeight: FontWeight.normal,
                          )),
                        ),
                        Text(
                          "1.0.0",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                            color: kSecondaryColor,
                            fontSize: 32 * scaleh,
                            fontWeight: FontWeight.bold,
                          )),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        ListTile(
                          title: const Text('Permissions'),
                          subtitle:
                              const Text('Enable or disable permissions'),
                          onTap: () {
                            // Acciones cuando se toca la opción de notificaciones
                          },
                        ),
                        const Divider(),
                        ListTile(
                          title: const Text('Connect us'),
                          subtitle:
                              const Text('Connect with us for support'),
                          onTap: () {
                            // Acciones cuando se toca la opción de idioma
                          },
                        ),
                        const Divider(),
                        // Puedes agregar más opciones de configuración según sea necesario
                        ListTile(
                          title: const Text('About us'),
                          subtitle:
                              const Text('Learn more about our team'),
                          onTap: () {
                            // Acciones cuando se toca la opción de idioma
                          },
                        ),
                        const Divider(),
                        ListTile(
                          title: const Text('Log out'),
                          onTap: () {
                            // Acciones cuando se toca la opción de notificaciones
                          },
                        ),
                        const Divider(),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
