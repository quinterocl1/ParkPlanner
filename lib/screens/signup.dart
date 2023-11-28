import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:access_control_residential/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:access_control_residential/screens/login.dart';

class SignUpPage extends StatefulWidget {
  static const String routeName = 'SignUp';
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();

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
                        "Sign up",
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
                    padding: EdgeInsets.symmetric(
                        vertical: 40 * scaleh, horizontal: 30 * scalew),
                    child: Container(
                      width: 350 * scalew,
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: kPrimaryLightColor,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 40 * scaleh,
                            backgroundColor: Colors.grey[200],
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'assets/imgs/Recognition.png',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 16 * scaleh),
                          TextField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: kPrimaryColor),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: kPrimaryColor),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              hintText: 'UserName',
                              filled: true,
                              fillColor: Colors.grey[200],
                            ),
                          ),
                          SizedBox(height: 16 * scaleh),
                          TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: kPrimaryColor),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: kPrimaryColor),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              hintText: 'Email',
                              filled: true,
                              fillColor: Colors.grey[200],
                            ),
                          ),
                          SizedBox(height: 16 * scaleh),
                          TextField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: kPrimaryColor),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: kPrimaryColor),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              hintText: 'Password',
                              filled: true,
                              fillColor: Colors.grey[200],
                            ),
                          ),
                          SizedBox(height: 16 * scaleh),
                          TextField(
                            controller: _roleController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: kPrimaryColor),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: kPrimaryColor),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              hintText: 'Role',
                              filled: true,
                              fillColor: Colors.grey[200],
                            ),
                          ),
                          SizedBox(height: 16 * scaleh),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                              context,
                              MaterialPageRoute(
                              builder: (context) => const LogInPage(),
                               ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                foregroundColor: kPrimaryLightColor,
                                backgroundColor: kPrimaryColor,
                                elevation: 10,
                                padding: EdgeInsets.symmetric(
                                    vertical: 17 * scaleh, horizontal: 12 * scalew),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                minimumSize: Size(340 * scalew, 50)),
                            child: Text(
                              "Register",
                              style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                  color: kPrimaryLightColor,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
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
