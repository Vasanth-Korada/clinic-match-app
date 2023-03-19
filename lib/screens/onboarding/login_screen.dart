import 'package:clinic_match_app/constants/assets.dart';
import 'package:clinic_match_app/core/navigation/navigation_service.dart';
import 'package:clinic_match_app/screens/dashboard/dashboard.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late GoogleSignIn _googleSignIn;

  @override
  void initState() {
    super.initState();
    initialiseGoogleSignIn();
  }

  void initialiseGoogleSignIn() {
    _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
      navService.push(Dashboard.route());
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AspectRatio(aspectRatio: 3.3, child: Image.asset(PNGs.cmLogo)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.black,
            ),
            onPressed: () {
              _handleSignIn();
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Image(
                    image: AssetImage(PNGs.googleLogo),
                    height: 18.0,
                    width: 24,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 24, right: 8),
                    child: Text(
                      'Sign in with Google',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
