import 'package:flutter/material.dart';
import 'package:projectshoppingapp/provider/on_boarding_provider.dart';
import 'package:provider/provider.dart';

import '../Loginpages/loginpage.dart';


class OnBoardingFirstpage extends StatefulWidget {


  const OnBoardingFirstpage({super.key});

  @override
  State<OnBoardingFirstpage> createState() => _OnBoardingFirstpageState();
}

class _OnBoardingFirstpageState extends State<OnBoardingFirstpage> {
  PageController pageController=PageController();
  @override
  void initState() {
    context.read<OnBoardingProvider>().timerchange(pageController);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<OnBoardingProvider>(
      builder: (context, value, child) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                    child: Text(
                  "Welcome to You & Me Shopping World!",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 38),
                )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.65,
                  width: double.infinity,
                  child: PageView.builder(
                    controller: pageController,
                    onPageChanged: (value) {
                      context.read<OnBoardingProvider>().changeindex(value);
                    },
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image(
                              image:
                                  NetworkImage(value.collection[index].image),
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.40,
                              fit: BoxFit.fitWidth,
                            ),
                            Center(
                              child: Text(
                                value.collection[index].title,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(color: Colors.purpleAccent),
                              ),
                            ),
                            Center(
                              child: Text(
                                value.collection[index].subtitle,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(color: Colors.purpleAccent),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: 3,
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            width: value.index == index ? 30 : 10,
                            height: 10,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: value.index == index
                                    ? Colors.blue
                                    : Colors.grey,
                                shape: BoxShape.rectangle,
                                border: Border.all(color: Colors.black)),
                          ),
                        );
                      },
                    )),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                      onPressed: () {
                        value.stoptimer();
                        //context.read<OnBoardingProvider>().stoptimer();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Loginsignuppage(),
                            ));
                      },
                      style: const ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.blueAccent)),
                      child: Text(
                        "Get Started!",
                        style: Theme.of(context).textTheme.titleLarge,
                      )),
                ),
              ],
            ),
          ),
        );
      },
    ));
  }
}
