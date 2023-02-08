
import 'package:flutter/material.dart';
import 'package:onboarding_screen_app/models/onBoard.dart';
import 'package:onboarding_screen_app/screens/onBoarding/components/dot_indicator.dart';
import 'package:onboarding_screen_app/screens/onBoarding/components/onboarding_content.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late PageController _pageController;

  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) => setState(() {
                  _pageIndex = value;
                }),  
                itemCount: demoData.length,
                controller: _pageController,
                itemBuilder: (context, index) => OnBoardingContent(
                  image: demoData[index].image,
                  title: demoData[index].title, 
                  description: demoData[index].description),
              ),
            ),
            Row(
              children: [
                ...List.generate(
                  demoData.length, 
                  (index) =>  Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: DotIndicator(isActive: index == _pageIndex),
                  )
                ),
                const Spacer(),
                SizedBox(
                  height: 60,
                  width: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(shape: const  CircleBorder(),backgroundColor: Colors.purple),
                    onPressed: () {_pageIndex++; _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease); },
                    child: const Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}