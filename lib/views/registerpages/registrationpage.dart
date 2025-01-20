import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectshoppingapp/Common%20widgets/dateformat.dart';
import 'package:projectshoppingapp/modal/usermodal.dart';
import 'package:projectshoppingapp/respository/authentication_repository.dart';
import 'package:provider/provider.dart';
import '../../Common widgets/TextFieldModalClass.dart';
import '../../Common widgets/custom_button.dart';
import '../../respository/User_Firestore_repository_cloudfirestore.dart';

class Registrationpage extends StatefulWidget {
  Registrationpage({super.key});

  @override
  State<Registrationpage> createState() => _RegistrationpageState();
}

class _RegistrationpageState extends State<Registrationpage> {
  TextEditingController namecontroller = TextEditingController();

  TextEditingController dobcontroller = TextEditingController();

  String gender = "Men";

  TextEditingController mailcontroller = TextEditingController();

  TextEditingController lnamecontroller = TextEditingController();

  TextEditingController fnamecontroller = TextEditingController();

  TextEditingController passcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sign Up Form",
              style: Theme.of(context).textTheme.displayLarge),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
              //mainAxisAlignment: MainAxisAlignment.,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Email Address",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(
                  height: 12,
                ),
                TextfieldWidget(
                    name: "Enter your email", controller: mailcontroller),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "your confirmation mail send here",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "First Name",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(
                  height: 12,
                ),
                TextfieldWidget(
                    name: "Enter your first name", controller: fnamecontroller),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Last Name",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(
                  height: 12,
                ),
                TextfieldWidget(
                    name: "Enter your last name", controller: lnamecontroller),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Password",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(
                  height: 12,
                ),
                TextfieldWidget(
                    name: "Enter your password", controller: passcontroller),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Date of birth:",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                TextField(
                  controller: dobcontroller,
                  decoration: InputDecoration(
                      hintText: "CHOOSE DATE",
                      suffixIcon: IconButton(
                        onPressed: () async {
                          DateTime? date = await showDatePicker(
                              context: context,
                              firstDate: DateTime(1980),
                              lastDate: DateTime.now());

                          String dob=formatDate(date!);
                          dobcontroller.text=dob;
                        },
                        icon: const Icon(Icons.calendar_month),
                      )),

                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Mostly interested in:",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                RadioListTile(
                  title: const Text("Men"),
                  value: "Men",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text("Women"),
                  value: "Women",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomButton(
                    text: "SUBMIT",
                    onTapfunction: () async {
                      //register user
                      AuthenticationRepository auth =
                          AuthenticationRepository();
                      User? user = await auth.registeruser(
                          mailcontroller.text, passcontroller.text);
                      //save user
                      if (user != null) {
                        UserFirestoreRepository firestore = UserFirestoreRepository();
                        firestore.saveuserprofile(Usermodal(
                            uid: user.uid,
                            email: user.email!,
                            password: passcontroller.text,
                            firstname: fnamecontroller.text,
                            lastname: lnamecontroller.text,
                            dob: dobcontroller.text,
                            gender: gender));
                        Navigator.pop(context);
                      }
                    })
              ]),
        )));
  }
}
