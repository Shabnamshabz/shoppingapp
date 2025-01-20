import "dart:io";

import "package:flutter/material.dart";
import "package:image_picker/image_picker.dart";
import "package:projectshoppingapp/respository/User_Firestore_repository_cloudfirestore.dart";

import "../../respository/authentication_repository.dart";
import "../FIrstPages/splashpagelogo.dart";
class Userprofilepage extends StatefulWidget {
  const Userprofilepage({super.key});

  @override
  State<Userprofilepage> createState() => _UserprofilepageState();
}

class _UserprofilepageState extends State<Userprofilepage> {
  File? _image;
  Future<void> _pickImage() async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("USER PROFILE",style: Theme.of(context).textTheme.displayMedium?.copyWith(
            color: Colors.blue,
            fontSize: 30,
            fontFamily: "serif",
            fontWeight: FontWeight.bold)),),

      body: Column(
        children: [
          Stack(

            children: [
              GestureDetector(
                onTap:_pickImage,
                child: Container(
                  color: Colors.grey,
                  child:
                  //  _image != null
                  //     ? Image.file(_image!, height: 200, width: 200, fit: BoxFit.cover)
                  //     : Text('select background photo'),
                  Image(image: NetworkImage("https://wallpapers.com/images/hd/pretty-profile-pictures-k1qebyviiyl0wx0x.jpg")),
                ),
              ),
              Center(
                child: SizedBox(
                  height: 120,
                  width: 200,
                  child: CircleAvatar(
                    child:  _image != null
                        ? Image.file(_image!, height: 200, width: 200, fit: BoxFit.cover)
                        : Text('select profile photo'),
                  ),
                ),
              ),
              Center(
                child: Container(
                  alignment: const AlignmentDirectional(0.2,-0.25),
                  child:CircleAvatar(
                      child:IconButton(onPressed:_pickImage,
                          icon:Icon(Icons.edit))
                  ),
                ),
              )
            ],
          ),
          FutureBuilder(future: UserFirestoreRepository().fetchuserprofile(),
              builder: (context, snapshot) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 5,),
                      Text("Uid:${snapshot.data?.uid}",style:Theme.of(context).textTheme.displayMedium,),
                      SizedBox(height: 15,),
                      Text("Firstname:${snapshot.data?.firstname}",style:Theme.of(context).textTheme.displayMedium),
                      SizedBox(height: 15,),
                      Text("Lastname:${snapshot.data?.lastname}",style:Theme.of(context).textTheme.displayMedium),
                      SizedBox(height: 15,),
                      Text("Emailid:${snapshot.data?.email}",style:Theme.of(context).textTheme.displayMedium),
                      SizedBox(height: 15,),
                      Text("Date of Birth:${snapshot.data?.dob}",style:Theme.of(context).textTheme.displayMedium),
                      SizedBox(height: 15,),
                      Text("Address:${snapshot.data?.address}",style:Theme.of(context).textTheme.displayMedium),
                    ],
                  ),
                );
              },),
          SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(width: double.infinity,
              child: FilledButton(onPressed: (){
                AuthenticationRepository logout=AuthenticationRepository();
                logout.signout();
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>Splashpage(),), (route) => false,);
              }, child:Text("SignOut"),),
            ),
          )

        ],
      ),
    );
  }
}
