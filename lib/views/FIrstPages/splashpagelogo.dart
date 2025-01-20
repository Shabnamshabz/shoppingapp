import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:projectshoppingapp/views/FIrstPages/on_boarding_screen.dart";

import "../../provider/on_boarding_provider.dart";
import "../application_ui_page/applicationfirstpage.dart";
import "../bottombarpages/homepage.dart";
import "On_boarding_firstpage.dart";

class Splashpage extends StatefulWidget {
  const Splashpage({super.key});

  @override
  State<Splashpage> createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {
  @override
  void initState() {
    //to navigate to loginpage
    // Future.delayed(
    //   Duration(seconds: 4),
    //   () => Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => LoginPage(),
    //     ),
    //     (route) => false,
    //   ),
    // );

    //to navigate to login page/homepage
    Future.delayed(Duration(seconds: 7),() {

    },);
    Future.delayed(
      const Duration(seconds: 7),
      () {
        if (FirebaseAuth.instance.currentUser == null) {
          Navigator.pushAndRemoveUntil(context,MaterialPageRoute(
              builder: (context) => OnBoardingFirstpage(),
            ),
            (route) => false,
          );
        }
        else {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => Userloginfirstpage(),
            ),
                (route) => false,
          );
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
          image: NetworkImage(
              "https://i.pinimg.com/originals/ce/56/99/ce5699233cbc0f142250b520d967dff7.png"),
          fit: BoxFit.cover,
        ),
        //COPY WITH METHOD: MAKING CHANGES TO THE EXISTING SET OF DATA,
        // so, you can add the alteration directly to the theme by
        // titlelarge. <code>
      ),
    );
  }
}
