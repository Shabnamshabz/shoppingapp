import 'dart:async';

// import 'package:flutter/material.dart';
//
// import '../../Common widgets/On_boarding_model.dart';
// import '../Loginpages/loginpage.dart';
//
// class OnBoardingScreen extends StatefulWidget {
//   const OnBoardingScreen({super.key});
//
//   @override
//   State<OnBoardingScreen> createState() => _OnBoardingScreenState();
// }
//
// class _OnBoardingScreenState extends State<OnBoardingScreen> {
//   Timer? timer;
//   @override
//   void initState() {
//     timer = Timer.periodic(
//       const Duration(seconds: 4),
//       (timer) {
//
//         if(currentvariable==2)
//           {
//
//             controller.jumpToPage(
//                 currentvariable);
//             currentvariable=-1;
//
//           }
//
//         currentvariable++;
//         controller.jumpToPage(
//             currentvariable);
//         //move to next page aftre two swcond
//         // if(currentvariable==2)
//         // {
//         //   currentvariable=0;
//         // }
//       },
//     ); //
//     super.initState();
//   }
//
//   PageController controller = PageController();
//   int currentvariable = 0;
//   @override
//   Widget build(BuildContext context) {
//     List<OnBoardingModel> collection = [
//       OnBoardingModel(
//           image:
//               "https://www.pngplay.com/wp-content/uploads/6/E-Commerce-Shopping-PNG-Clipart-Background.png",
//           title: "View product 360 degree",
//           subtitle:
//               "you can see the product in all angle, with true and convenient"),
//       OnBoardingModel(
//           image:
//               "https://cdni.iconscout.com/illustration/premium/thumb/women-doing-online-shopping-2890192-2406814.png",
//           title: "View product easily",
//           subtitle:
//               "you can take a photo and upload,we will find similar product for you"),
//       OnBoardingModel(
//           image:
//               "https://cdni.iconscout.com/illustration/premium/thumb/online-payment-with-mobile-2645883-2218295.png",
//           title: "Payment is easy",
//           subtitle: "you can easily do online payment to purchase product")
//     ];
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Center(
//                   child: Text(
//                     "Welcome to You & Me Shopping World!",textAlign: TextAlign.center,
//                     style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                         color: Colors.lightBlue,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 38),
//                   )),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.65,
//                 width: double.infinity,
//                 child: PageView.builder(
//                   controller:
//                   controller, //to automatically move on each screen use controller
//                   onPageChanged: (value) {
//                     setState(() {
//                       currentvariable = value;
//                     });
//                   }, // extra property of pageview builder, to get the existing page index value, to get index value globally
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Image(
//                             image: NetworkImage(collection[index].image),
//                             width: double.infinity,
//                             height: MediaQuery.of(context).size.height * 0.40,
//                             fit: BoxFit.fitWidth,
//                           ),
//                           Center(
//                             child: Text(
//                               collection[index].title,
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .titleLarge
//                                   ?.copyWith(color: Colors.purpleAccent),
//                             ),
//                           ),
//                           Center(
//                             child: Text(
//                               collection[index].subtitle,
//                               textAlign: TextAlign.center,
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .titleSmall
//                                   ?.copyWith(color: Colors.purpleAccent),
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                   itemCount: 3,
//                 ),
//               ),
//               Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: List.generate(
//                     3,
//                         (index) {
//                       return Padding(
//                         padding: const EdgeInsets.all(2.0),
//                         child: Container(
//                           width: currentvariable == index ? 30 : 10,
//                           height: 10,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(12),
//                               color: currentvariable == index
//                                   ? Colors.blue
//                                   : Colors.grey,
//                               shape: BoxShape.rectangle,
//                               border: Border.all(color: Colors.black)),
//                         ),
//                       );
//                     },
//                   )),
//               SizedBox(
//                 width: double.infinity,
//                 child: FilledButton(
//                     onPressed: () {
//                       timer?.cancel();
//                       Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => Loginsignuppage(),
//                           ));
//                     },
//                     style: const ButtonStyle(
//                         backgroundColor:
//                         WidgetStatePropertyAll(Colors.blueAccent)),
//                     child: Text(
//                       "Get Started!",
//                       style: Theme.of(context).textTheme.titleLarge,
//                     )),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
