import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:access_control_residential/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:access_control_residential/screens/signup.dart';
import 'package:access_control_residential/screens/homeadmin.dart';

class LogInPage extends StatefulWidget {
  static const String routeName = 'LogIn';
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  void _passwordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _login() {
    // Aquí puedes agregar la lógica para verificar las credenciales del usuario
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == 'admin' && password == '1234') {
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Invalid credentials'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Leave'),
              ),
            ],
          );
        },
      );
    }
  }

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
                    padding: EdgeInsets.only(top: 70 * scaleh),
                    child: SvgPicture.asset(
                      'assets/imgs/imagoType.svg',
                      width: 312 * scalew,
                      height: 42 * scaleh,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 100 * scaleh, horizontal: 30 * scalew),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email Address",
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 14 * scaleh,
                              )),
                            ),
                            TextField(
                              controller: _usernameController,
                              cursorColor: kSecondaryColor,
                              decoration: InputDecoration(
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: kSecondaryColor),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: kSecondaryColor),
                                ),
                                hintText: 'Enter Email',
                                hintStyle: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                  color: kSecondaryColor,
                                  fontSize: 14 * scaleh,
                                )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10 * scaleh,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Password",
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 14 * scaleh,
                              )),
                            ),
                            TextField(
                              controller: _passwordController,
                              cursorColor: kSecondaryColor,
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: kSecondaryColor),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: kSecondaryColor),
                                ),
                                hintText: 'Password',
                                hintStyle: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                  color: kSecondaryColor,
                                  fontSize: 14 * scaleh,
                                )),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: kSecondaryColor,
                                  ),
                                  onPressed: () {
                                    _passwordVisibility();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10 * scaleh),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => const HomeAdminPage(),
                         ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          elevation: 10,
                          padding: const EdgeInsets.symmetric(
                              vertical: 17,
                              horizontal: 125),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10),
                          ),
                          minimumSize: Size(450 * scalew, 50 * scaleh)),
                      child: Text(
                        "Login",
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                          color: kPrimaryLightColor,
                          fontSize: 16 * scaleh,
                          fontWeight: FontWeight.w600,
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 15 * scaleh, horizontal: 30 * scalew),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUpPage(),
                                  ),
                                );
                              },
                              child: Text.rich(
                                textAlign: TextAlign.left,
                                TextSpan(
                                  text: "Don’t have an account? ",
                                  style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                    color: kSecondaryDarkColor,
                                    fontSize: 14 * scaleh,
                                    fontWeight: FontWeight.w400,
                                  )),
                                  children: [
                                    TextSpan(
                                      text: "Sign up",
                                      style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 14 * scaleh,
                                        fontWeight: FontWeight.bold,
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]),
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
