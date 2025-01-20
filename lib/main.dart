import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projectshoppingapp/provider/on_boarding_provider.dart';
import 'package:projectshoppingapp/views/FIrstPages/splashpagelogo.dart';
import 'package:projectshoppingapp/views/Orders/allorders.dart';

import 'package:projectshoppingapp/views/Productsdisplay/individual_productdisplay_mainpage.dart';

import 'package:projectshoppingapp/views/Productsdisplay/producttofirebase.dart';
import 'package:projectshoppingapp/views/application_ui_page/applicationfirstpage.dart';
import 'package:projectshoppingapp/views/bottombarpages/cartpage.dart';
import 'package:projectshoppingapp/views/cartpages/cartcheckourpages.dart';
import 'package:projectshoppingapp/views/fullproductdisplay.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // its compulsory to write this line of code,if any extra code is needed to write before run app,here the extra code is connection to the firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); // to establish connection to firebase before running application
  runApp(const MyApp()); //running application(root)
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => OnBoardingProvider(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            textTheme: const TextTheme(
                displayLarge: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
                displayMedium: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                displaySmall: TextStyle(
                  fontSize: 10,
                )),
          ),

          //home: Splashpage(),
          //home:ProductDisplayMainPage(),
          home: Splashpage(),
          //home: Fullproductdisplay(),
          //home: Orderfulldisplay(),
          //home:Cartpage(),
          //home: Producttofirebase(),
        ));
  }
}
