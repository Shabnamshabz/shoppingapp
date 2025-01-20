
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projectshoppingapp/modal/cartmodal.dart';
import 'package:projectshoppingapp/modal/ordermodal.dart';
import 'package:projectshoppingapp/modal/productmodal.dart';
import 'package:projectshoppingapp/respository/User_Firestore_repository_cloudfirestore.dart';
import 'package:projectshoppingapp/respository/order_repository.dart';
import 'package:projectshoppingapp/views/Orders/orderpage.dart';

class CheckOutPage extends StatefulWidget {
  final List<Cartmodal> cartproduct;
  CheckOutPage({super.key, required this.cartproduct});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}
// how to call argument in stateless class
//direct parameter
// how to call argument in statefull class
//widget.parametername

class _CheckOutPageState extends State<CheckOutPage> {
  final String _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();
  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  //to
  double salestax = 6.0;
  double shipping = 10.0;

  double findtotal() {
    double totalvalue = 0.0;

    for (int i = 0; i < widget.cartproduct.length; i++) {
      double totalprice = double.parse(widget.cartproduct[i].product.pprice!);
      totalvalue += totalprice * widget.cartproduct[i].quantity;
    }
    return totalvalue;
  }

  double grosstotal(double total, double salestax) {
    double shippingcharge = 10.0;
    double shipping = total > 100 ? 0 : shippingcharge;
    double grosstotal = total + shipping + salestax;
    return grosstotal;
  }

  int currentstep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text("CheckOut",
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: Colors.blue,
                  fontSize: 40,
                  fontFamily: "serif",
                  fontWeight: FontWeight.bold))),
      body: Stepper(
        currentStep: currentstep,
        steps: [
          Step(
            title: const Text("Information"),
            content: Column(
              children: [
                Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Deliver to:",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_drop_down),
                      )
                    ],
                  ),
                ),
                const Text(
                  "My Cart",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                //due to erro
                Wrap(
                  children: List.generate(
                    widget.cartproduct.length,
                    (index) {
                      return ListTile(
                        leading: Image(
                          image: NetworkImage(widget
                              .cartproduct[index].product.pimage
                              .toString()),
                          fit: BoxFit.cover,
                        ),
                        title: Text(widget.cartproduct[index].product.pname!,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22)),
                        trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward_ios)),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                "size:${widget.cartproduct[index].product.psize}"),
                            Text("Color:"),
                            CircleAvatar(
                              backgroundColor: Colors.brown,
                              radius: 10,
                            ),
                            Text(
                              "${widget.cartproduct[index].product.pprice}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
            isActive: currentstep == 0,
          ),
          Step(
            title: const Text('Shipping'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Shipping Address",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
                ),
                FutureBuilder(future:UserFirestoreRepository().fetchuserprofile(), builder:(context, snapshot) {
                  return Card(
                    child: Column(
                      children: [
                        ListTile(
                          title: const Text(
                            "Postal Address",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),

                        ),
                        ListTile(
                          leading: const Icon(Icons.person),
                          title: Text(snapshot.data!.firstname+snapshot.data!.lastname),
                        ),
                        ListTile(
                          leading: Icon(Icons.location_pin),
                          title: Text(snapshot.data!.address!),
                        ),

                      ],
                    ),
                  );
                }, ),
                const SizedBox(
                  height: 12,
                ),

                SizedBox(
                  height: 350,
                  width: double.infinity,
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ListTile(
                          title: const Text("Free Shipping",
                              style: TextStyle(fontSize: 20)),
                          subtitle:
                              Text(
                                  "For orders above 100aed "),


                        ),
                        ListTile(
                          title: const Text(
                            "Standard Shipping",
                            style: TextStyle(fontSize: 20),
                          ),
                          subtitle: const Text(
                              "Delivered within 2-3 days"),
                        ),
                        ListTile(
                          title: const Text(
                            "Express Shipping",
                            style: TextStyle(fontSize: 20),
                          ),
                          subtitle: const Text(
                              "20aed extra charge: Delivered early"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            isActive: currentstep == 1,
          ),
          Step(
            title: const Text(
              'Payment',
            ),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Payment",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  FutureBuilder(future:UserFirestoreRepository().fetchuserprofile(), builder:(context, snapshot) {
                    return Card(
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text(
                              "Postal Address",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),

                          ),
                          ListTile(
                            leading: const Icon(Icons.person),
                            title: Text(snapshot.data!.firstname+snapshot.data!.lastname),
                          ),
                          ListTile(
                            leading: Icon(Icons.location_pin),
                            title: Text(snapshot.data!.address!),
                          ),

                        ],
                      ),
                    );
                  }, ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "Payment Type",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Card(
                    child: SizedBox(
                      width: double.infinity,
                      height: 150,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              child: const Card(
                                child: SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Center(
                                      child: Text(
                                    "Debitcard",
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 18),
                                  )),
                                ),
                              ),
                            ),
                            GestureDetector(
                              child: const Card(
                                child: SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Center(
                                      child: Text(
                                    "Paypal",
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 18),
                                  )),
                                ),
                              ),
                            ),
                            GestureDetector(
                              child: const Card(
                                child: SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Center(
                                      child: Text(
                                    "Banking",
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 18),
                                  )),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "subtotal:",
                                  style: TextStyle(fontSize: 17),
                                ),
                                Text("${findtotal()}",
                                    style: TextStyle(
                                      fontSize: 17,
                                    )),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "shipping",
                                  style: TextStyle(fontSize: 17),
                                ),
                                Text(
                                    findtotal() > 100
                                        ? "free"
                                        : shipping.toString(),
                                    style: TextStyle(
                                      fontSize: 17,
                                    )),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "salestax",
                                  style: TextStyle(fontSize: 17),
                                ),
                                Text("${salestax}",
                                    style: TextStyle(
                                      fontSize: 17,
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "TOTAL:",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("${grosstotal(findtotal(), salestax)}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            isActive: currentstep == 2,
          ),
        ],
        type: StepperType.horizontal,

        //code to avoid continue?cancel in stepper
        controlsBuilder: (context, details) {
          return FilledButton(
              onPressed: () {
                if (currentstep < 3) {
                  setState(() {
                    currentstep += 1;
                  });
                }
                if (currentstep == 3) {
                  String docids = getRandomString(15);
                  OrderRepository order = OrderRepository();
                  order.ordercreated(OrderModal(
                      oid: docids,
                      cartProducts: widget.cartproduct,
                      total: findtotal()));
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Orderpage(
                        order: OrderModal(
                            oid: docids,
                            cartProducts: widget.cartproduct,
                            total: findtotal()),
                      ),
                    ),
                    (route) => false,
                  );
                }
              },
              child: Text(currentstep == 0
                  ? 'Shipping'
                  : currentstep == 1
                      ? 'Payment'
                      : 'Submit'));
        },
        //index of step assigned to currentstep
        onStepTapped: (step) {
          setState(() {
            currentstep = step;
          });
        },
        onStepContinue: () {},
        onStepCancel: () {},
      ),
      // bottomNavigationBar: FilledButton(
      //   onPressed: () {
      //     if (currentstep == 2) return;
      //     setState(() {
      //       currentstep += 1;
      //     });
      //   },
      //
      //   //DOUBT
      //   child: Text(currentstep == 0
      //       ? 'Shopping'
      //       : currentstep == 1
      //           ? 'Payment'
      //           : 'Submit'),
      // ),
    );
  }
}
