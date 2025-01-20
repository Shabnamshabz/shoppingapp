import 'package:flutter/material.dart';
import 'package:projectshoppingapp/respository/authentication_repository.dart';
import 'package:projectshoppingapp/views/registerpages/registrationpage.dart';

import '../application_ui_page/applicationfirstpage.dart';


class Loginsignuppage extends StatelessWidget {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  Loginsignuppage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("LOGIN",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.pinkAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 50)),
                const SizedBox(
                  height: 12,
                ),
                TextField(
                  controller: usernamecontroller,
                  decoration: InputDecoration(
                      hintText: "Enter you email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                      hintText: "Enter you password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
                const SizedBox(
                  height: 32,
                ),
                ElevatedButton(
                  onPressed: () async {
                   AuthenticationRepository loginuser=AuthenticationRepository();
                  bool value= await loginuser.loginuser(usernamecontroller.text,passwordcontroller.text);
                  if(value==true)
                    {
                      Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => const Userloginfirstpage()),(route) => false,);
                    }
                  else
                    {
                      const snackBar = SnackBar(
                        content: Text("User Not Found"),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child:const Text("Login")
                ),

                // FilledButton(onPressed: (){}, child: Text("LOGIN")),
                const SizedBox(
                  height: 22,
                ),
                const Text("if not registered kindly register by sign up"),
                const SizedBox(
                  height: 12,
                ),
                FilledButton(
                    child: const Text("Register"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Registrationpage(),
                          ));
                    })
                // FilledButton(onPressed: (){
                //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignupPage(),));
                // }, child: Text("SIGN UP")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// try {
// await FirebaseAuth.instance.signInWithEmailAndPassword(
// email: usernamecontroller.text,
// password: passwordcontroller
//     .text); //as we are using await keyword before this firebase.authentication code, the next line of codes underneath await,that will only execute if this line of code executes without any eror, if else it will move on to catch and execute that line of code
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => Registrationpage(),
// ),
// );
// } catch (error) {
// ScaffoldMessenger.of(context).showSnackBar(
// SnackBar(content: Text(error.toString())));
//}