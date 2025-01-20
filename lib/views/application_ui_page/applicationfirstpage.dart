import "package:flutter/material.dart";
import "package:projectshoppingapp/views/bottombarpages/accountpage.dart";
import "package:projectshoppingapp/views/bottombarpages/cartpage.dart";
import "package:projectshoppingapp/views/bottombarpages/searchpage.dart";
import "package:projectshoppingapp/views/fullproductdisplay.dart";
import "../bottombarpages/homepage.dart";

class Userloginfirstpage extends StatefulWidget {
  const Userloginfirstpage({super.key});

  @override
  State<Userloginfirstpage> createState() => _UserloginfirstpageState();
}

class _UserloginfirstpageState extends State<Userloginfirstpage> {
  List<Widget> pages = [
    Homepage(),
    Accountpage(),
    const Searchpage(),
    const Cartpage(),
    Fullproductdisplay()
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BottomNavigationBar(
          showUnselectedLabels: false,
          currentIndex: index,
          onTap: (value) {
            setState(() {
              if (value < pages.length) {
                index = value;
              }
            });
          },
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Shopping"),
          ],
        ),
      ),
    );
  }
}




















