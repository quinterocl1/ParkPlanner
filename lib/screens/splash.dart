import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:access_control_residential/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:access_control_residential/screens/login.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = 'Splash';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double scalew = (constraints.maxWidth*1)/500;
        double scaleh = (constraints.maxHeight*1)/640;
        return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(top: 100 * scaleh),
                  child: SvgPicture.asset(
                    'assets/imgs/initImage.svg',
                    width: 353 * scalew,
                    height: 221 * scaleh, 
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 9 * scaleh),
                  child: Text(
                    'Explore the app',
                    style: GoogleFonts.poppins(
                        textStyle:
                             TextStyle(color: kPrimaryColor, 
                            fontSize: 35 * scalew * scaleh),
                        fontWeight: bodyTitle),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2 * scaleh),
                  child: Text(
                    'Now your security are in one place \n and always under control',
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(
                      color: kSecondaryDarkColor,
                      fontSize: 17 * scalew * scaleh,
                    )),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 80 * scaleh),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LogInPage(),
                      ),
                    );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: kPrimaryColor,
                      padding: EdgeInsets.symmetric(
                          vertical: 5 * scaleh, horizontal: 10 * scalew),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: const BorderSide(
                        width: 2.0,
                        color: kPrimaryColor,
                      ),
                      minimumSize: Size(355 * scalew, 56 * scaleh),
                    ),
                    child: Text(
                      "Get Started!",
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 16 * scalew * scaleh,
                        ),
                      ),
                    ),
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
