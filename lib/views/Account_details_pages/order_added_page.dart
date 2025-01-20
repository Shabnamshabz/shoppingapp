import "package:flutter/material.dart";
class OrderAddedPage extends StatefulWidget {

  const OrderAddedPage({super.key});

  @override
  State<OrderAddedPage> createState() => _OrderAddedPageState();
}

class _OrderAddedPageState extends State<OrderAddedPage> {
  int currentstep = 0;

  List<Step> steps = [
    const Step(
      title: Text("Placed order",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
      content: Text("8th june 2024,8:40am",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
      isActive: true,
    ),
    const Step(
      title: Text('Delivered to shipping UNIT',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
      content: Text("9th june 2024,8:40am",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
      isActive: true,
    ),
    const Step(
      title: Text('Orders are being shipped',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
      content: Text("10th june 2024,8:40am",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
      isActive: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
       appBar: AppBar(
         centerTitle: true,
         title: Text("My Orders",style: Theme.of(context).textTheme.displayLarge,),
      actions: [
        IconButton(onPressed:(){} , icon:const Icon(Icons.search)),
        IconButton(onPressed:(){} , icon:const Icon(Icons.shopping_cart)),
      ],
       ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            TabBar(
                padding: const EdgeInsets.all(10),
                dividerHeight: 2,
                dividerColor: Colors.blue,
                indicatorColor: Colors.red,
                labelColor: Colors.blue,
                labelStyle:Theme.of(context).textTheme.displayMedium,

                tabs: const [Text("Pending Orders"),Text("Past Orders")]),
            Expanded(
              child: SizedBox(
                height: 150,
                width: double.infinity,
                child: TabBarView(children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 100,
                        width: double.infinity,
                        child: Card(
                          child: ListTile(
                            leading: const Image(image: NetworkImage("https://tse1.mm.bing.net/th?id=OIP.cjLGdnddziH-G0hmyRnb6wHaHa&pid=Api&P=0&h=220"),fit: BoxFit.cover,),
                            title: const Text("Womens Hoodie",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22)),
                            trailing:IconButton(onPressed: (){}, icon:const Icon(Icons.arrow_forward_ios)),
                            subtitle: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Cash on delivery"),
                                Text("123aed",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),)
                              ],
                            ),
                          ),
                        ),
                      ),
                const SizedBox(height:100,),
                Stepper(
                  connectorThickness:5,
                  //stepIconWidth: 10,
                  currentStep:currentstep,
                  steps: steps,
                  type: StepperType.vertical,
                  onStepTapped: (step) {
                    setState(() {
                      currentstep = step;
                    }
                    );
                  },
                  onStepContinue: () {
                    setState(() {
                      if (currentstep < steps.length - 1) {
                        currentstep = currentstep + 1;
                      } else {
                        currentstep = 0;
                      }
                    });
                  },
                  onStepCancel: () {
                    setState(() {
                      if (currentstep > 0) {
                        currentstep = currentstep - 1;
                      } else {
                        currentstep = 0;
                      }
                    });
                  },
                ),

                      // const EasyStepper(activeStep:4,
                      //     alignment: Alignment.bottomLeft,
                      //   internalPadding: 5,
                      //     borderThickness: 40,
                      //     showLoadingAnimation: true,
                      //     stepRadius: 25,
                      //     direction: Axis.vertical,
                      //     steps:[
                      //       EasyStep(
                      //
                      //           icon: Icon(CupertinoIcons.cart),
                      //         title: "Placed order",),
                      //       EasyStep(icon: Icon(Icons.home), title:"Delivered to shipping unit",
                      //         lineText: "8th june 2024,8:40am",
                      //       ),
                      //       EasyStep(icon: Icon(Icons.fire_truck_outlined), title:
                      //           "Orders are being shipped",
                      //          lineText:"9th june 2024,8:40am",
                      //
                      //       ),
                      //       EasyStep(icon: Icon(Icons.favorite), title:"Delivered successfully",
                      //           lineText: "not delivered yet",
                      //
                      //       ),
                      //     ],),
                      // Stepper(
                      //
                      //   connectorThickness: 4,
                      //   connectorColor: WidgetStatePropertyAll(Colors.brown),
                      //   //stepIconWidth: 50,
                      //   //currentStep: 2,
                      //   stepIconHeight: 50,
                      //
                      //   type: StepperType.vertical,
                      //   steps: const [
                      //     Step(
                      //         title: Icon(CupertinoIcons.cart), content: Row(
                      //       children: [
                      //         Center(child: Text("Placed order"),),
                      //         Center(child: Text("7th june 2024,8:40am"),),
                      //       ],
                      //     )),
                      //     Step(title: Icon(Icons.home), content: Row(
                      //       children: [
                      //         Center(child: Text("Delivered to shipping unit"),),
                      //         Center(child: Text("8th june 2024,8:40am"),),
                      //       ],
                      //     )),
                      //     Step(title: Icon(Icons.fire_truck_outlined), content: Row(
                      //       children: [
                      //         Center(child: Text("Orders are being shipped"),),
                      //         Center(child: Text("9th june 2024,8:40am"),),
                      //       ],
                      //     )),
                      //     Step(title: Icon(Icons.favorite), content: Row(
                      //       children: [
                      //         Center(child: Text("Delivered successfully"),),
                      //         Center(child: Text("not delivered yet"),),
                      //       ],
                      //     )),
                      //   ],
                      // ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 100,
                        width: double.infinity,
                        child: Card(
                          child: ListTile(
                            leading: const Image(image: NetworkImage("https://tse4.mm.bing.net/th?id=OIP.9Fryy6iOJOnHgkNUZWTF2gAAAA&pid=Api&P=0&h=220"),),
                            title: const Text("Mens Track Pants",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22)),
                               trailing:IconButton(onPressed: (){}, icon:const Icon(Icons.arrow_forward_ios)),
                            subtitle: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Cash on delivery"),
                                Text("123aed",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                ]),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
