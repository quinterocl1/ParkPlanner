import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:access_control_residential/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:access_control_residential/screens/signup.dart';
import 'package:access_control_residential/screens/homeadmin.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogInPage extends StatefulWidget {
  static const String routeName = 'LogIn';
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  String _email = "";
  String _pass = "";

  void _handleLogin() async {
    try {
      await _auth.signInWithEmailAndPassword(email: _email, password: _pass);
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeAdminPage(),
        ),
      );
    } catch (e) {
      const Text("Error signing");
    }
  }

  void _passwordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
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
                    child: Form(
                      key: _formKey,
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
                              TextFormField(
                                controller: _usernameController,
                                keyboardType: TextInputType.emailAddress,
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
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  setState(() {
                                    _email = value;
                                  });
                                },
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
                              TextFormField(
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
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  setState(() {
                                    _pass = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10 * scaleh),
                    child: ElevatedButton(
                      onPressed: () {
                        _handleLogin();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          elevation: 10,
                          padding: const EdgeInsets.symmetric(
                              vertical: 17, horizontal: 125),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
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
