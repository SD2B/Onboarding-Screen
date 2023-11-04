import 'dart:async';

import 'package:flutter/material.dart';
import 'package:onboardingscreen/onboardContent.dart';
import 'package:onboardingscreen/onboardingModel.dart';

import 'dotIndicator.dart';
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _pageIndex=0;
  Timer? _timer;

  @override
  void initState(){
    _pageController=PageController(initialPage: 0);
    _timer=Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if(_pageIndex<3){
        _pageIndex++;
      }else{
        _pageIndex=0;
      }
      _pageController.animateToPage(
          _pageIndex,
          duration: Duration(milliseconds: 350),
          curve: Curves.easeIn
      );
    });
    super.initState();
  }

  @override
  void dispose(){
    _pageController.dispose();
    _timer!.cancel;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        // Background gradient
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color(0xff1f005c),
              Color(0xff5b0060),
              Color(0xff870160),
              Color(0xffac255e),
              Color(0xffca485c),
              Color(0xffe16b5c),
              Color(0xfff39060),
              Color(0xffffb56b),
            ],
            tileMode: TileMode.mirror,
          ),
        ),
        child: Column(
          children: [
            Expanded(child: PageView.builder(
              onPageChanged: (index){
                setState(() {
                  _pageIndex=index;
                });
              },
                itemCount: demoData.length,
                controller: _pageController,
                itemBuilder: (context,index){
                  return OnboardContent(
                    title: demoData[index].title,
                    description: demoData[index].description,
                    image: demoData[index].image,
                  );
                }
              )
            ),
            Padding(
                padding: EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                      demoData.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: DotIndicator(
                          isActive: index == _pageIndex,
                        ),
                      ),
                  )
                ],
              ),
            ),
            Text("By proceeding you agree to our Privacy Policy"),
            SizedBox(height: 16,),
            InkWell(
              onTap: () {
                print("Button clicked!");
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 48),
                height: MediaQuery.of(context).size.height * 0.075,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "Login / Registration",
                    style: TextStyle(
                      fontFamily: "HappyMonkey",
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
