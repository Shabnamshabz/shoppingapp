import 'package:flutter/material.dart';
class Cardwidget extends StatelessWidget {
  final String textname;
  final String? subtitlename;
  final String imageurl;
  final VoidCallback? ontapfunction;
  const Cardwidget({super.key,
    required this.textname,required this.imageurl,this.ontapfunction,this.subtitlename
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontapfunction,
      child: SizedBox(
        //color: Colors.purpleAccent,
        height: 165,
        child: Card(
          color: Colors.white54,
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: const EdgeInsets.all(10),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(textname,style: Theme.of(context).textTheme.displayMedium,),
                    //Text(subtitlename!,style: Theme.of(context).textTheme.displayMedium,),
                  ],
                ),
                SizedBox(width: 85,
                    child: Image(image: NetworkImage(imageurl)))

              ]),


        ),
      ),
    );
  }
}