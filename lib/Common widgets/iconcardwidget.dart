import 'package:flutter/material.dart';

class IconCardWidget extends StatelessWidget {
  final String imageurl;
  final String iconname;
  final Color colourname;
  final void Function()? onpressedfunction;
   const IconCardWidget({
    super.key,
    required this.iconname,required this.colourname,required this.imageurl,this.onpressedfunction
  });
   @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressedfunction,
      child: SizedBox(
          width: 150,
          height: 180,
        child: Card(
          color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(child: Image(image: NetworkImage(imageurl),fit: BoxFit.cover,)),

              Center(
                  child: Text(
                    iconname,
                    style: Theme.of(context).textTheme.displayMedium,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
